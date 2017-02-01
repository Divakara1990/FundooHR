//
//  SalaryPaySlipVM.swift
//  FundooHR
//
//  1. viewmodel for salaryviewcontroller
//  2. sends request to controller
//  3. receives data from controller
//  4. passing the data from one class to another by creating the object and sending that object to other
//
//  Created by BridgeLabz on 12/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit

class SalaryPaySlipVM: NSObject, SalaryPaySlipVMProtocol{
   
    //variable holds viewcontroller
    var mSalVCObj : SalaryPayslipViewController?
    
    //variable to hold the controller
    var mReportControllerVar : ReportsController?
    
    //variable to hold the delegates
    var mDelegateA:SalaryPaySlipControllerProtocol?
    
    //variable to hold the object of class payslipmodel
    var mEmpSalArray : [paySlipModel] = []
    
    //variable to store the sorted array
    var mSortArray : [paySlipModel] = []
    
    
    //function called from viewcontroller
    func fetchSalaryData()
    {
        //creating the object of controller
        mReportControllerVar = ReportsController()
        mReportControllerVar?.mrepContVMVar = self
        mReportControllerVar?.pdelegate2A = self
        //invoking the method which is in controller
        mReportControllerVar?.fetchSalaryDetails()
    }
    
    
    //receives the data which comes from controller
    func receieveSalaryData(salSlipArray array : [paySlipModel]) -> Void
    {
        print("ViewModel array is \(array)")
        if array.count >= 1
        {
            mEmpSalArray = array
            mSortArray = mEmpSalArray.sorted{$0.engName! < $1.engName!}
            print(mSortArray)
            //invoking the method which is in the viewcontroller
            mSalVCObj?.reloadFinalData()
            
        }
    }
}
