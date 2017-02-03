//
//  EngineerDetails.swift
//  FundooHR
//
//  1. Model class which is used to transfer the object from one place to another
//
//  Created by BridgeLabz on 20/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class EngineerDetails: NSObject
{
    //variable which stores the employee name
    var mEngName : String?
    
    //variable which stores the employee job type
    var mEngStatus : String?
    
    //variable which stores the employee company
    var mEngCompany : String?
    
    //variable which stores the employee mobile number
    var mEngMobile : String?
    
    //variable which stores the employee emailid
    var mEngEmail : String?
    
    //variable which stores the employee unique ID
    var mEngID : String?
    
    
    //constructor which initializes the all details of the employee
    init(EngineerName name : String, EngineerStatus status : String, EngineerCompany company : String, EngineerMobile mobile : String, EngineerEmail  email : String, EngineerID eid : String)
    {
       
        self.mEngName = name
        self.mEngStatus = status
        self.mEngCompany = company
        self.mEngMobile = mobile
        self.mEngEmail = email
        self.mEngID = eid
    }
}
