//
//  ViewController.swift
//  FundooHR
//
//  Purpose:
//  1. Viewcontroller for Login
//  2. Login page in MVVM design
//
//  Created by BridgeLabz on 07/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit


class ViewController: UIViewController, LoginVCProtocol{

    //outlet for company image
    @IBOutlet weak var logoImage: UIImageView!
    
    //outlet for view
    @IBOutlet weak var secondView: UIView!
    
    //outlet for email textfield
    @IBOutlet weak var emailField: UITextField!
    
    //outlet for password textfield
    @IBOutlet weak var passwordField: UITextField!
    
    //outlet for login button
    @IBOutlet weak var loginButton: UIButton!
    
    //outlet for the label to display while loading
    @IBOutlet weak var loadingLabel: UILabel!
    
    //outlet for displaying the loading indicator
    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    
    
    
    //variable of loginviewmodel type
    var mLoginVM : LoginViewModel?
    
    //variable to store the login token
    var mloginToken : String?
    
    //variable to store the email
    var mEmail : String?
    
    //var to store the password
    var mPassword : String?
    
    //var to hold the mesage string
    var mCheck : String?
    
    //variable to store the utility object
    var mUtilVar = Utility()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //passing current Class Object to LoginViewModel
        mLoginVM?.mLoginVCPro = self
        
        //Notifies when the Simulator is changed from Portrait to Landscape mode and vice versa.
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
        //setting view corner radius
        self.secondView.layer.cornerRadius = 10
        
        //setting the shadowcolor of the view
        self.secondView.layer.shadowColor = UIColor.black.cgColor
        self.secondView.layer.shadowOpacity = 0.4
        self.secondView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.secondView.layer.shadowRadius = 1.3
        
        //setting buttons corner radius
        self.loginButton.layer.cornerRadius = 5
        
        //setting properties for company images
        self.logoImage.layer.shadowColor = UIColor.black.cgColor
        self.logoImage.layer.shadowOpacity = 0.5
        self.logoImage.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.logoImage.layer.shadowRadius = 2.0
        
        //hiding the loading label initially
        self.loadingLabel.isHidden = true
        
        //hiding the loader symbol initially
        self.activityLoader.isHidden = true
        
        //invoking the function to underline the textfield
        emailField.underlined()
        passwordField.underlined()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Function to Underline when the Simulator is rotated
    func rotated() {
        if UIDeviceOrientationIsLandscape(UIDevice.current.orientation) {
            print("Landscape")
            emailField.underlined()
            passwordField.underlined()
        }
        
        if UIDeviceOrientationIsPortrait(UIDevice.current.orientation) {
            print("Portrait")
            emailField.underlined()
            passwordField.underlined()
        }
        
    }
    
    //validating the user from the response which v got from the RestApi
    func saveReceivedToken(tokn1 : String , status :Int, mess : String ) -> Void
    {
        if status == 200
        {
            mloginToken = tokn1
           // self.saveInCoreData(saveToken: tokn1, emailID1 : mEmail!)
            
            //saving the token in NSUserDefaults
            self.saveINUserDefaults(saveToken: tokn1, emailID: mEmail!)
            self.loadingLabel.isHidden = true
            self.activityLoader.stopAnimating()
            self.activityLoader.isHidden = true
            //if the condition is true then performing the segue to the dashboard
            self.performSegue(withIdentifier: "gotoDashboard", sender: nil)
        }
    }
    
    
    //function which saves the token and the emailid in the userdefaults
    func saveINUserDefaults(saveToken :String , emailID :String) -> Void{
        let preferences = UserDefaults.standard
        preferences.setValuesForKeys(["tokenData": saveToken])
        preferences.setValuesForKeys(["emailID": emailID])
        preferences.synchronize()
    }
    
    
    //function to execute when any error occurred while loging in
    func errorMessage() -> Void{
        
        self.loadingLabel.isHidden = true
        self.activityLoader.stopAnimating()
        self.activityLoader.isHidden = true
        
        //setting the alert view box
        let alertView = UIAlertController.init(title: "Error!!!", message : "Something Problem Occurred", preferredStyle: UIAlertControllerStyle.alert)
        
        let action = UIAlertAction.init(title: "ok", style: .default, handler :nil)
        //adding the action to the box
        alertView.addAction(action)
        //presenting the alertbox
        self.present(alertView, animated: true, completion :nil)
    }
    
    
    @IBAction func LoginButtonPressed(_ sender: Any)
    {
        //variable to store the email entered
        mEmail = emailField.text
        
        //variable to store the password entered
        mPassword = passwordField.text
        
        //Checking the User as entered the Username & password
        if emailField.text! == "" || passwordField.text! == ""{
            //checking the emailfield
            if emailField.text! == ""{
                mCheck = "please Enter the emailID"
                emailField.text = ""
            }
            //checking the password field
            if passwordField.text == ""{
                //if both email and password field is empty, asking the user to enter the both emailid and password
                if mCheck != nil{
                    mCheck! += " & password"
                }
                else{
                    mCheck = "Please Enter the Password"
                }
                //invoke the utility method to display the alertbox message
                mUtilVar.displayErrorMessage(message: mCheck!, view: self)
            }
        }
        else
        {
                //if both fields are entered then validating the credentials using the utility method
                if mUtilVar.isValidLoginCredential(emailId: mEmail!, password: mPassword!)
                {
                    //creating the object of viewmodel in viewcontroller(this will execute the constructor of the LoginViewModel by sending the emailid and password
                    mLoginVM = LoginViewModel(loginVCObj: self, emailId: mEmail!, password: mPassword!)
                    
                    self.activityLoader.isHidden = false
                    self.loadingLabel.isHidden = false
                    self.activityLoader.startAnimating()
                    //invoking the viewmodel method
                    mLoginVM?.sendLoginCredentials()
                    
                }
                else
                {
                    //if the entered credentials is not valid then invoke the utility method to display the error message
                    mUtilVar.displayErrorMessage(message: "Please Enter the Valid EmailID & Password", view: self)
                    //making both fields empty
                    emailField.text = ""
                    passwordField.text = ""
                }
            }
        }
}
