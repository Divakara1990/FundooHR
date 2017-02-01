//
//  AttendanceModel.swift
//  FundooHR
//
//  1. model class which contains the properties of the attendancereport model
//
//  Created by BridgeLabz on 24/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit

class AttendanceModel: NSObject {
    
    //variable stores the employee name
    var mName : String?
    //variable stores the total number of leave counts
    var mleave : String?
    
    
    //constructor which initializes the values
    init(EngineerName Name : String, EngineerLeave leave : String)
    {
        
        self.mName = Name
        self.mleave = leave
    }

}
