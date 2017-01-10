//
//  LoginService.swift
//  FundooHR
//
//  Created by BridgeLabz on 07/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit
import Alamofire

class LoginService: NSObject {

    var delegate : LoginCotrollerProtocol?
    
    func userlogin(useremail:String, userpwd : String) -> Void
    {
        let urlString : String = "http://192.168.0.171:3000/login"
        let params = ["emailId":  (useremail)/*"admin@bridgelabz.com"*/, "password" : (userpwd)/*"Bridge@123"*/]
        Alamofire.request(urlString, method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseJSON { response in
                print("response---->",response)
                print("result---->",response.result)
                if((response.result).isSuccess){
                    print("result---->",response.result)
                    
                    let json = response.result.value as! NSDictionary
                    
                    let check = json["token"] as Any
                    let checkStr = String(describing : check)
                    if self.checkInternet(check : checkStr)
                    {
                        self.delegate?.errorMessageCtrl()
                    }
                    else{
                        let token = json["token"] as! String
                        let status = json["status"] as! Int
                        let message = json["message"] as! String
                        
                        self.delegate?.receiveLoginStatus(token: token, status : status, message: message)
                    }
                }
        }
    }
    
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
