//
//  ReportsController.swift
//  FundooHR
//
//  1. controller class which controls the flow of the salary setails of the employee
//  Created by BridgeLabz on 12/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit

class ReportsController: NSObject, SalaryPaySlipControllerProtocol{
    
    //variable holds viewmodel class type
    var mrepContVMVar : SalaryPaySlipVM?
    
    //variable holds service class
    var mfetchSalaryDetailsVAR: FetchReportsDetails?
    
    //variables holds protocol delegate
    var pdelegate2A : SalaryPaySlipVMProtocol?
    
    
    //function invoked from viewModel
    func fetchSalaryDetails()
    {
        //creating an object of service class
        mfetchSalaryDetailsVAR = FetchReportsDetails()
        mfetchSalaryDetailsVAR?.pdelegate1A = self
        //invoking the function of service class to make rest api
        mfetchSalaryDetailsVAR?.fetchFromFireBase()
    }
    
    
    //receiving the data from the service class
    func receiveFetchedSalaryDetails(paySlipArray array : [paySlipModel])
    {
        print("controller array is \(array)")
        //sending the received data from services to the viewmodel
        pdelegate2A?.receieveSalaryData(salSlipArray: array)
    }
}
