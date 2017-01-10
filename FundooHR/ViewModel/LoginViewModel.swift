//
//  LoginViewModel.swift
//  FundooHR
//
//  Created by BridgeLabz on 07/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit

class LoginViewModel: NSObject, LoginVMProtocol {

    
    var Email = String()
    var PasWrd = String()
    
    var LoginControllerObj : LoginController?
    var loginVC : ViewController?
    
    var tokn : String?
    var loginstatus : Int?
    var loginmsg : String?
    
    func callLoginVM()
    {
        LoginControllerObj = LoginController()
        LoginControllerObj?.del = self
        LoginControllerObj?.callLoginController(email: Email, password: PasWrd)
    }
    
    func userLoginStatus(token1: String, status1: Int, message1: String)
    {
        self.tokn = token1
        self.loginstatus = status1
        self.loginmsg = message1
        
        if tokn != nil && loginstatus != 0 && loginmsg != nil
        {
            loginVC?.validateLogin(tokn1 :tokn!, status : loginstatus!, mess : loginmsg!)
        }
        else
        {
            self.callLoginVM()
        }
    }
    
    func errorMessageVM() -> Void{
        loginVC?.errorMessage()
    }
    
}
