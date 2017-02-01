//
//  LoginService.swift
//  FundooHR
//
//  1. service class contains the function which makes Rest Api
//  2. makes use of alamofire
//
//  Created by BridgeLabz on 07/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit
import Alamofire

class LoginService: NSObject {
    
    //variable holds the protocol delegate
    var pdelegate : LoginCotrollerProtocol?
    
    
    //constructor of the loginservice
    init(loginControllerObj : LoginCotrollerProtocol) {
        pdelegate = loginControllerObj
    }
    
    //function make a rest api call by sending the username and password.
    func sendingLoginDetails(useremail:String, userpwd : String) -> Void
    {
        
        //fetching the url from the plist which is already created in the project
        let path = Bundle.main.path(forResource: "RestUrls", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        
        //fetching the url based on the key value pair
        let loginUrl = dict?.value(forKey: "loginurl") as? String
        
        //variable to hold the url
        let urlString : String = loginUrl!
        
        //setting the parameters which needs to pass
        let params = ["emailId":  (useremail), "password" : (userpwd)]
        
        //using the alamofire to make the request
        Alamofire.request(urlString, method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseJSON
        { response in
                print("result---->",response.result)
                
                //checking that the received data
                if((response.result).isSuccess)
                {
                    print("result---->",response.result)
                    
                    //storing the json object in the form of NSDictionary
                    let json = response.result.value as! NSDictionary
                    let check = json["token"] as Any
                   
                    
                    if self.checkInternet(check : check as! String)
                    {
                        self.pdelegate?.errorMessageCtrl()
                    }
                    else
                    {
                        //fetching individual record from the received object
                        let token = json["token"] as! String
                        let status = json["status"] as! Int
                        let message = json["message"] as! String
                        //sending the received data to the controller using the protocol method
                        self.pdelegate?.loginSuccessful(token: token, status : status, message: message)
                    }
                }
        }
    }
    
    
    //function to check the internet connection
    func checkInternet(check : String) -> Bool{
        if check == "Optional(null)"
        {
            return true
        }
        else
        {
            return false
        }
    }
}
