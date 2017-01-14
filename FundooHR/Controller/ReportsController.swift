//
//  ReportsController.swift
//  FundooHR
//
//  Created by BridgeLabz on 12/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit

class ReportsController: NSObject, controllerDelegateA{
    var repContVMVar : SalaryPaySlipVM?
    var fetchSalaryDetailsVAR: FetchReportsDetails?
    
    var delegate2A : DataSenderDelegateA?
    var delegate1A : ServicesDelegateA?
    
    func callFromContToSer()
    {
        fetchSalaryDetailsVAR = FetchReportsDetails()
        fetchSalaryDetailsVAR?.delegate1A = self
        fetchSalaryDetailsVAR?.callRestApiToFetchSalaryData()
    }
}
