//
//  LoginViewModel.swift
//  FundooHR
//
//  1. viewmodel for the login viewcontroller in MVVM structure
//  2. contains function to call from viewmodel to controller
//
//  Created by BridgeLabz on 07/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit

class LoginViewModel: NSObject, LoginVMProtocol
{
    //variable to store the email
    var mEmail = String()
    
    //variable to store the password
    var mPasWrd = String()
    
    //variable to store the controller
    var mLoginControllerObj : LoginController?
    
    //variable to hold the viewcontroller
    var mLoginVCPro : LoginVCProtocol?
    
    //variable to store the token
    var mTokn : String?
    
    //variable to store the login status
    var mLoginstatus : Int?
    
    //variable to store the login message
    var mLoginmsg : String?
    
    
    //constructor of the loginviewmodel with two parameters, inside creates the object of the LoginController by passing the loginviewmodel object to the LoginController
    init(loginVCObj : LoginVCProtocol, emailId : String, password : String)
    {
        super.init()
        mLoginVCPro = loginVCObj
        mEmail = emailId
        mPasWrd = password
        //creating the object of the LoginCOntroller by passing the self object
        mLoginControllerObj = LoginController(loginVMProtocolObj : self)
    }
    
    //function invoked by viewcontroller
    func sendLoginCredentials()
    {
        //calling the function of controller and passing the email and password
        mLoginControllerObj?.sendCredentials(email: mEmail, password: mPasWrd)
    }
    
    //function to check the data received from controller
    func checkReceivedLoginStatus(token1: String, status1: Int, message1: String)
    {
        self.mTokn = token1
        self.mLoginstatus = status1
        self.mLoginmsg = message1
        
        if mTokn != nil && mLoginstatus != 0 && mLoginmsg != nil
        {
            mLoginVCPro?.saveReceivedToken(tokn1 :mTokn!, status : mLoginstatus!, mess : mLoginmsg!)
        }
        else
        {
            self.sendLoginCredentials()
        }
    }
    
    //function if any error occurs
    func errorMessageVM() -> Void
    {
        mLoginVCPro?.errorMessage()
    }
}
