//
//  FetchAttendanceReport.swift
//  FundooHR
//
//  1. service class which fetches the data using the URL Request and sends the data to the controller
//  2. sends the received data to the controller using the protocol methods

//  Created by BridgeLabz on 24/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit
import CoreData

class FetchAttendanceReport: NSObject{
    
    //variable to hold the protocol type
    var pAttendanceCtrlPro : AttendanceSlipControllerProtocol?
    
    //variable to hold the token which is used to send with the urlrequest
    var mtoken : String?
    
    //variable to hold the timestamp
    var mtimeStamp : Int?
    
    //variable which holds the array of the object type (attendance model object)
    var mfinalAttData : [AttendanceModel] = []
    
    //variable of utility object
    var mUtil = Utility()
    
    
    
    //constructor of the class
    init(attendanceControllerObj : AttendanceSlipControllerProtocol)
    {
        pAttendanceCtrlPro = attendanceControllerObj
    }

    
    //function which is called from the controller to fetch the data
    func fetchAttendanceReportDetails(){
        
        //variable which is used to hold the array of string type
        var mcmpnyArr : [String] = []
        
        // invoking the method to fetch the token and storing in the variable to send with the url
        let mtok = mUtil.fetchToken()
        
        //generating the time stamp
        mtimeStamp = Int(Date().timeIntervalSince1970 * 1000)
        print(mtimeStamp!)
        
        //fetching the url which is stored in the plist using key and value pair
        let path = Bundle.main.path(forResource: "RestUrls", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        let attendanceurl = dict?.value(forKey: "attendanceurl") as? String
        
        // Set up the URL request
        let mUrlString: String = attendanceurl!
        
        //checking the url
        guard let murl = URL(string: mUrlString) else {
            print("Error: cannot create URL")
            return
        }
        var murlRequest = URLRequest(url: murl)
        
        //adding the fetched token to the url
        murlRequest.addValue(mtok, forHTTPHeaderField: "x-token")
        
        // set up the session
        let mconfig = URLSessionConfiguration.default
        let msession = URLSession(configuration: mconfig)
        
        // make the request
        let task = msession.dataTask(with: murlRequest) {
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
                guard let json = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: AnyObject]
                    else
                    {
                        print("error trying to convert data to JSON")
                        return
                    }
                
                    //initially it is in the form of the dictionary
                    let mattendanceArray = json as NSDictionary
                
                    //based on the key fetching the value which is of the type NSArray
                    let marray1 = mattendanceArray["allEmployee"] as! NSArray

                    //iterating that array to fetch the value present the array
                    for i in marray1
                    {
                        var mleave : Int?
                        var mename : String?
                        let mdic = i as! NSDictionary
                        let mcmpny = mdic["company"] as! String
                        print(mcmpny)
                        mcmpnyArr.append(mcmpny)
                        print(mcmpnyArr)
                        let marr = mdic["employeeList"] as! NSArray
                    
                        for x in marr
                        {
                            let mdata = x as! NSDictionary
                            mleave = mdata["employeeLeave"] as? Int
                            let mstr = String(describing: mleave!)
                        
                            mename = mdata["employeeName"] as? String
                            
                            //adding into the model object
                            let mattendanceDetails = AttendanceModel(EngineerName: mename!, EngineerLeave: mstr)
                            //adding that object to the array of object type
                            self.mfinalAttData.append(mattendanceDetails)
                    }
                    
                    print(self.mfinalAttData)
                }
                
                //sending the received object to the Controller
                self.pAttendanceCtrlPro?.sendReceivedAttendanceReportDetails(attendanceArray: self.mfinalAttData, companiesList: mcmpnyArr)
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        task.resume()
    }
}
