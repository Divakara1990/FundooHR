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
    var mRepContVMVar : SalaryPaySlipVM?
    
    //variable holds service class
    var mFetchSalaryDetailsVAR: FetchReportsDetails?
    
    //variables holds protocol delegate
    var pSalaryVMPro : SalaryPaySlipVMProtocol?
    
    
    //function invoked from viewModel
    func fetchSalaryDetails()
    {
        //creating an object of service class
        mFetchSalaryDetailsVAR = FetchReportsDetails()
        mFetchSalaryDetailsVAR?.pSalaryControllerPro = self
        //invoking the function of service class to make rest api
        mFetchSalaryDetailsVAR?.fetchFromFireBase()
    }
    
    
    //receiving the data from the service class
    func receiveFetchedSalaryDetails(paySlipArray array : [PaySlipModel])
    {
        print("controller array is \(array)")
        //sending the received data from services to the viewmodel
        pSalaryVMPro?.receieveSalaryData(salSlipArray: array)
    }
}
