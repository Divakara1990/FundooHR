//
//  EngineerDetails.swift
//  FundooHR
//
//  Created by BridgeLabz on 20/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class EngineerDetails: NSObject
{
    var engiImage : UIImage?
    var engName : String?
    var engJob : String?
    var engCompany : String?
    var engMobile : String?
    var engEmail : String?
    
    
    init(EngineerImage Image : UIImage, EngineerName Name : String, EngineerJob Job : String, EngineerCompany Company : String, EngineerMobile Mobile : String, EngineerEmail  Email : String)
    {
        self.engiImage = Image
        self.engName = Name
        self.engJob = Job
        self.engCompany = Company
        self.engMobile = Mobile
        self.engEmail = Email
    }
}
