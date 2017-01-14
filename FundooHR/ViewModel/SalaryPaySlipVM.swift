//
//  SalaryPaySlipVM.swift
//  FundooHR
//
//  Created by BridgeLabz on 12/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit

class SalaryPaySlipVM: NSObject, DataSenderDelegateA{
    var salVCObj : SalaryPayslipViewController?
    
    var reportControllerVar : ReportsController?
   var delegateA:controllerDelegateA?
    
    func callFromVMToCSalDetails()
    {
        reportControllerVar = ReportsController()
        reportControllerVar?.repContVMVar = self
        reportControllerVar?.delegate2A = self
        reportControllerVar?.callFromContToSer()
    }
}
