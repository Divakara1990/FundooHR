//
//  Utility.swift
//  FundooHR
//
//  1. utility class which contains the methods frequently used
//
//  Created by BridgeLabz on 25/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit

class Utility: NSObject {
    
    //function used to display the error message when the user gives invalid credentials
    func displayErrorMessage(message:String, view:UIViewController)
    {
        //setting the alertview which needs to be displayed
        let alertView = UIAlertController.init(title: "ERROR !!!!!", message: message, preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction.init(title: "Ok", style: .default, handler: nil)
        alertView.addAction(action)
        //presenting the alertview
        view.present(alertView, animated: true, completion:nil)
    }
    
    
    //function to fetch the email which is stored in the NSUser Defaults whenever v need
    func fetchEmail() -> String
    {
        let preferences = UserDefaults.standard
        let mEmailIDlabel = preferences.string(forKey: "emailID")
        print(mEmailIDlabel!)
        return mEmailIDlabel!
    }
    
    
    //function which is used to fetch the token which is saved when the login is successfull, and fetched 
    func fetchToken() -> String
    {
        let preferences = UserDefaults.standard
        let mToken = preferences.string(forKey: "tokenData")
        print(mToken!)
        return mToken!
    }

    //function to validate the user credentials at client side using regular expression
    func isValidLoginCredential(emailId:String, password:String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
        let passwordRegex = "^([a-zA-Z0-9@*#]{8,15})$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let pwdTest = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        
        if emailTest.evaluate(with: emailId) && pwdTest.evaluate(with: password)
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    
}
