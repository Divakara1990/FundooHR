//
//  FetchEngineerDetails.swift
//  FundooHR
//
//  1. service class which makes a rest api to fetch the employee data 
//  2. fetch the token from the coredata and send with the url
//
//  Created by BridgeLabz on 20/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit
import CoreData

class FetchEngineerDetails: NSObject
{
       
    //variable which stores the array of data
    var mEngineerDetailsArray : NSArray = []    
    
    //variable to store the object in array
    var mFinalEngData:[EngineerDetails] = []
    
    //variable to holds the delegate protocol
    var pEmpControllerPro : EmployeeControllerProtocol?
    
    //variable to store the timestamp
    var mTimeStamp : Int?
    
    //variable to store the utility class
    var mUtil : Utility?
    
    //constructor of the class
    init(employeeControllerObj : EmployeeControllerProtocol)
    {
        pEmpControllerPro = employeeControllerObj
    }
    
    // method to Fetch the Engineer Details
    func fetchEmployeeDetails()
    {
        mUtil = Utility()
        //invoking the function to fetch the token
        let tok = mUtil?.fetchToken()
        print("token fetched \(tok!)")
    
        //fetching the url which is stored from the plist
        let path = Bundle.main.path(forResource: "RestUrls", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        let searchUrl = dict?.value(forKey: "searchurl") as? String
        
        //generating the time stamp
        mTimeStamp = Int(Date().timeIntervalSince1970 * 1000)
        print(mTimeStamp!)
        
        // Set up the URL request
        let urlString: String = searchUrl!
        
        guard let url = URL(string: urlString) else {
            print("Error: cannot create URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.addValue(tok!, forHTTPHeaderField: "x-token")
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // make the request
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            
            // check for any errors
            guard error == nil else {
                print("error calling GET on data")
                print(error!)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            // parse the result as JSON, since that's what the API provides
            do {
                guard let json = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: AnyObject] else {
                    print("error trying to convert data to JSON")
                    return
                }
                
                // now we have the json data, let's just print it to prove we can access it
                print("The Engineer Data is: " + json.description)
                
                //receiving in the form of the NSDictionary
                let engineerDetailsArray = json as NSDictionary
                print(engineerDetailsArray.description)
                
                //pasing the key "employeeList" fetching the value which is in the form of array
                let array1 = engineerDetailsArray["employeeList"] as! NSArray
                
                //iterating that array to fetch the details of employee
                for variab in array1
                {
                    //each employee record is in the form of the nsdictionary
                    let v1 = variab as! NSDictionary
                    //fetching all details of employee
                    let empName = v1["employeeName"] as! String
                    let empstatus = v1["employeeStatus"] as! String
                    let empMob = v1["mobile"] as! String
                    let empMail = v1["emailId"] as! String
                    let empCmpny = v1["company"] as! String
                    let empID = v1["engineerId"] as! String
                    
                    //setting that all details in the form of object
                    let engDetails = EngineerDetails(EngineerName: empName, EngineerStatus: empstatus, EngineerCompany: empCmpny, EngineerMobile: empMob, EngineerEmail: empMail, EngineerID: empID)
                    
                    //appending that object to the class type
                    self.mFinalEngData.append(engDetails)
                }
                
                //sending the received object to the Controller
                self.pEmpControllerPro?.sendEmployeeDetails(engDetailArray: self.mFinalEngData)
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        task.resume()
    }
}
