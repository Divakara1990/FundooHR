//
//  LoginController.swift
//  FundooHR
//
//  1. controller class for the login view controller
//  2. controles the flow of data
//
//  Created by BridgeLabz on 07/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit

class LoginController: NSObject,LoginCotrollerProtocol
{
    //variable of service class
    var mloginSer : LoginService?
    
    //variable for the VMProtocol
    var pdel : LoginVMProtocol?
    
    //constructor of logincontroller which creates the object of the LoginService inside this. also sends the logincontroller object to the loginservice class
    init(loginVMProtocolObj : LoginVMProtocol) {
        super.init()
        pdel = loginVMProtocolObj
        //creating the object of the service class
        mloginSer = LoginService(loginControllerObj : self)
    }
    
    
    //function called from the viewmodel and sending the email and password
    func sendCredentials(email: String, password : String) -> Void
    {
        //invoking the method which is in services
        mloginSer?.sendingLoginDetails(useremail: email, userpwd: password)
    }
    
    
    //receiving the data from the services
    func loginSuccessful(token: String, status: Int, message: String)
    {
        pdel?.checkReceivedLoginStatus(token1: token, status1: status, message1:message)
    }
    
    
    //method if any error is occurred
    func errorMessageCtrl() -> Void {
        pdel?.errorMessageVM()
    }
}
