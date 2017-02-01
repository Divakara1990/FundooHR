//
//  EngineerDetailsViewModel.swift
//  FundooHR
//
//  1. viewmodel class of the search
//  2. makes the call to the service
//  3. receives the data which is coming from the controller
//  4. makes use of protocols to pass the data from one class to another
//
//  Created by BridgeLabz on 20/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

//variable to hold the data received from the controller in model(object) form
var mEngDetailArray:[EngineerDetails] = []

//variable which holds the controller class type
var mEngineerDetailsController : EngineerDetailsController?

//variable for delegate
var pEmpConDelegate:EmployeeControllerProtocol?

//variable to VCProtocol
var pEmpVCPro : EmployeeVCProtocol?

class EngineerDetailsViewModel: NSObject, EmployeeVMProtocol
{
    //variable to store the sorted array of object type
    var mSortedDataInVM : [EngineerDetails]?
    
    //constructor which is used to pass the object to the next class
    init(employeeVCObj : EmployeeVCProtocol)
    {
        super.init()
        pEmpVCPro = employeeVCObj
        mEngineerDetailsController = EngineerDetailsController(employeeVmProtocolObj: self)
    }
    
    //function to call from viewmodel to controller
    func getEngineerDetails()
    {
        //calling the method which is present in the controller
        mEngineerDetailsController?.fetchEngineerDetails()
    }
    
    // function to receive the data which is coming from controller
    func sendEngineerDetails(edArray engRecord:[EngineerDetails]) -> Void
    {
        print(engRecord.count)
        if engRecord.count >= 1
        {
            mEngDetailArray = engRecord
            mSortedDataInVM = mEngDetailArray.sorted{ $0.engName! < $1.engName! }
            pEmpVCPro?.reloadFinalData()
        }
        else
        {
            mEngineerDetailsController?.fetchEngineerDetails()
        }
    }
}
