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
    var engName : String?
    
    //variable which stores the employee job type
    var engJob : String?
    
    //variable which stores the employee company
    var engCompany : String?
    
    //variable which stores the employee mobile number
    var engMobile : String?
    
    //variable which stores the employee emailid
    var engEmail : String?
    
    //variable which stores the employee unique ID
    var engID : String?
    
    
    //constructor which initializes the all details of the employee
    init(EngineerName Name : String, EngineerJob Job : String, EngineerCompany Company : String, EngineerMobile Mobile : String, EngineerEmail  Email : String, EngineerID EID : String)
    {
       
        self.engName = Name
        self.engJob = Job
        self.engCompany = Company
        self.engMobile = Mobile
        self.engEmail = Email
        self.engID = EID
    }
}
