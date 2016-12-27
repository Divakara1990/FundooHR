//
//  ViewController.swift
//  FundooHR
//
//  Created by BridgeLabz on 07/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Notifies when the Simulator is changed from Portrait to Landscape mode and vice versa.
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
        self.secondView.layer.cornerRadius = 10
        self.loginButton.layer.cornerRadius = 5
        
        self.secondView.layer.shadowColor = UIColor.black.cgColor
        self.secondView.layer.shadowOpacity = 0.4
       // self.secondView.layer.shadowOffset.width = 0
        
        self.secondView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.secondView.layer.shadowRadius = 1.3
        
        self.logoImage.layer.shadowColor = UIColor.black.cgColor
        self.logoImage.layer.shadowOpacity = 0.5
        self.logoImage.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.logoImage.layer.shadowRadius = 2.0
        //self.secondView.layer.shadowOffset.height = 2
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
        emailField.underlined()
        
//        self.emailField.layer.borderWidth = 1
//        self.emailField.layer.borderColor = UIColor(red:222/255.0, green:225/255.0, blue:227/255.0, alpha: 1.0).cgColor
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



}

