//
//  paySlipModel.swift
//  FundooHR
//
//  Created by BridgeLabz on 12/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit

class paySlipModel: NSObject {

    var engName : String?
    var engStatus : String?
    var engCompany : String?
    
    init(EngineerName Name : String, EngineerJob Job : String, EngineerCompany Company : String)
    {
        
        self.engName = Name
        self.engStatus = Job
        self.engCompany = Company
            }

}
