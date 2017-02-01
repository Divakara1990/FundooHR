//
//  paySlipModel.swift
//  FundooHR
//
//  1. model class which contains the property of the salary payslip model
//
//  Created by BridgeLabz on 12/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit

class paySlipModel: NSObject {

    //variable which holds the employee name
    var engName : String?
    
    //variable which holds the employee status(job type)
    var engStatus : String?
    
    //variable which holds the employee company
    var engCompany : String?
    
    
    //constructor which initializes all the variable values
    init(EngineerName Name : String, EngineerJob Job : String, EngineerCompany Company : String)
    {
        
        self.engName = Name
        self.engStatus = Job
        self.engCompany = Company
    }

}
