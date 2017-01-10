//
//  LoginController.swift
//  FundooHR
//
//  Created by BridgeLabz on 07/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit

class LoginController: NSObject,LoginCotrollerProtocol
{
    var loginSer : LoginService?
    var del : LoginVMProtocol?
    
    func callLoginController(email: String, password : String) -> Void
    {
        loginSer = LoginService()
        loginSer?.delegate = self
        loginSer?.userlogin(useremail: email, userpwd: password)
    }
    
    func receiveLoginStatus(token: String, status: Int, message: String)
    {
        del?.userLoginStatus(token1: token, status1: status, message1:message)
    }
    
    func errorMessageCtrl() -> Void {
        del?.errorMessageVM()
    }
}
