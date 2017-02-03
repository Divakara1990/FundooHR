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

class PaySlipModel: NSObject
{
    //variable which holds the employee name
    var mEngName : String?
    
    //variable which holds the employee status(job type)
    var mEngStatus : String?
    
    //variable which holds the employee company
    var mEngCompany : String?
    
    
    //constructor which initializes all the variable values
    init(EngineerName name : String, EngineerStatus status : String, EngineerCompany company : String)
    {
        self.mEngName = name
        self.mEngStatus = status
        self.mEngCompany = company
    }
}
