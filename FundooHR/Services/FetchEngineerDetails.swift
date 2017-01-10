//
//  FetchEngineerDetails.swift
//  FundooHR
//
//  Created by BridgeLabz on 20/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit
import CoreData

class FetchEngineerDetails: NSObject
{
    var EnmployeImage : UIImage?
    var EmployeName : String?
    var EmployeJob : String?
    var EmployeCompany : String?
    var EmployeMobile : String?
    var EmployeEmail : String?
    
    var EngineerDetailsArray : NSArray = []
    var engName : NSArray = []
    var token : String?
    var finalEngData:[EngineerDetails] = []
    var delegate1 : controllerDelegate?
    var timeStamp : Int?
   // var engControllerObj = EngineerDetailsController()
    
    // method to Fetch the Engineer Details
    func callRestApiToFetchEngineersData()
    {
        let tok = self.fetchToken()
        
        timeStamp = Int(Date().timeIntervalSince1970 * 1000)
        print(timeStamp!)
        
        // Set up the URL request
        let todoEndpoint: String = "http://192.168.0.171:3000/searchEmployeeByName?token=\(tok)&timestamp=\(timeStamp)"
        guard let url = URL(string: todoEndpoint) else {
            print("Error: cannot create URL")
            return
        }
        let urlRequest = URLRequest(url: url)
        
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // make the request
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                print("error calling GET on /todos/1")
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
                // now we have the todo, let's just print it to prove we can access it
                print("The Engineer Data is: " + json.description)
                
                let EngineerDetailsArray = json as NSDictionary
                print(EngineerDetailsArray.description)
                let array1 = EngineerDetailsArray["employeeList"] as! NSArray
                //print(array1)
                for variab in array1
                {
                    let v1 = variab as! NSDictionary
                    let empName = v1["employeeName"] as! String
                    let empstatus = v1["employeeStatus"] as! String
                    let empMob = v1["mobile"] as! String
                    let empMail = v1["emailId"] as! String
                    let empCmpny = v1["company"] as! String
                    print(empName)
                    print(empstatus)
                    print(empMob)
                    print(empMail)
                    print(empCmpny)
                    let EngDetails = EngineerDetails(EngineerName: empName, EngineerJob: empstatus, EngineerCompany: empCmpny, EngineerMobile: empMob, EngineerEmail: empMail)
                    self.finalEngData.append(EngDetails)
                }
                //sending the received object to the Controller
                self.delegate1?.recieveDataFromServices(engDetailArray: self.finalEngData)
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        task.resume()
    }
    
    func fetchToken() -> String
    {
        var detArr : [LoginToken1]?
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            let fetchreq : NSFetchRequest = LoginToken1.fetchRequest()
            detArr = try context.fetch(fetchreq)
            self.token = detArr?[0].mytoken
            print(token!)
        }catch{
            print("fetch failed")
        }
        return token!
        }
    
}
