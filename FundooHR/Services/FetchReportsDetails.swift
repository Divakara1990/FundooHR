//
//  FetchReportsDetails.swift
//  FundooHR
//
//  1. service class which makes the rest api to fetch the salary details
//  2. this makes use of NSURl to fetch the data from the server
//
//  Created by BridgeLabz on 12/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit

class FetchReportsDetails: NSObject {

    var finalSalaryArray : [paySlipModel] = []
    
    //variable to store the protocol delegate
    var pdelegate1A : SalaryPaySlipControllerProtocol?
    
    //variable to store the array type
    var marray1 : NSArray?
    
    //variable stores the object type
    var mpaySlipData : [paySlipModel] = []
   
    
    
    // method to Fetch the Engineer Details
    func fetchFromFireBase()
    {
        mUtil = Utility()
        //invoking the function to fetch the token
        let tok = mUtil?.fetchToken()
        print("token fetched \(tok!)")
        
        //fetching the url which is stored from the plist
        let path = Bundle.main.path(forResource: "RestUrls", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        let searchUrl = dict?.value(forKey: "salaryslipurl") as? String
        
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
                print("The salaryslip Data is: " + json.description)
                
                //receiving in the form of the NSDictionary
                let salaryDetailsArray = json as NSDictionary
                print(salaryDetailsArray.description)
                
                //pasing the key "employeeList" fetching the value which is in the form of array
                let array1 = salaryDetailsArray["allEmployee"] as! NSArray
                
                //iterating that array to fetch the details of employee
                for variab in array1
                {
                    //each employee record is in the form of the nsdictionary
                    let v1 = variab as! NSDictionary
                    //fetching all details of employee
                    let empName = v1["employeeName"] as! String
                    let empstatus = v1["employeeStatus"] as! String
                    let empCmpny = v1["company"] as! String
                    
                    //setting that all details in the form of object
                    let salDetails = paySlipModel(EngineerName: empName, EngineerJob: empstatus, EngineerCompany: empCmpny)
                    
                    //appending that object to the class type
                    self.finalSalaryArray.append(salDetails)
                }
                
                //sending the received object to the Controller
                self.pdelegate1A?.receiveFetchedSalaryDetails(paySlipArray: self.finalSalaryArray)
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        task.resume()
    }

    
    
    //    //function which makes the request for firebase to fetch the data
    //    func fetchFromFireBase(){
    //
    //
    //        //connecting to firebase
    //        let ref = FIRDatabase.database().reference()
    //        ref.child("Employee").observeSingleEvent(of: .value, with: {(snapshot) in
    //
    //            //receiving in the form of the array
    //            self.marray1 = snapshot.value as? NSArray
    //            //iterating the received array
    //            for ary in self.marray1!
    //            {
    //                //receiving that data
    //                let empVar = ary as! NSDictionary
    //                let ename = empVar["name"] as! String?
    //                let estatus = empVar["status"] as! String?
    //                let ecompany = empVar["Company"] as! String?
    //                //storing in the object variable
    //                let paySlip = paySlipModel(EngineerName: ename!, EngineerJob: estatus!, EngineerCompany: ecompany!)
    //
    //                //appending the object
    //                self.mpaySlipData.append(paySlip)
    //            }
    //
    //            //sending the received object to the controller
    //            self.pdelegate1A?.receiveFetchedSalaryDetails(paySlipArray: self.mpaySlipData)
    //        })
    //    }

    
}

