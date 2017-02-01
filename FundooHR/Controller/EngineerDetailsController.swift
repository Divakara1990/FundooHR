//
//  EngineerDetailsController.swift
//  FundooHR
//
//  1. controller class which controlles the data flow
//  2. receives data from the services
//
//  Created by BridgeLabz on 20/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class EngineerDetailsController: NSObject, EmployeeControllerProtocol
{
    //variable to store the service class
    var mFetchEngineerDetails: FetchEngineerDetails?
    
    //variable to store the protocol
    var pEmpVMPro : EmployeeVMProtocol?
    
    //constructor which is used to initialize the values passess the object to the services
    init(employeeVmProtocolObj : EmployeeVMProtocol)
    {
        super.init()
        pEmpVMPro = employeeVmProtocolObj
        //creating the object of the service class and sending the current object
        mFetchEngineerDetails = FetchEngineerDetails(employeeControllerObj: self)
        
    }
    
    //function called from the viewmodel
     func fetchEngineerDetails()-> Void
     {
        //calling the function which is present in the services
        mFetchEngineerDetails?.fetchEmployeeDetails()
    }
    
    
    //receiving the data from the services
    func sendEmployeeDetails(engDetailArray :[EngineerDetails]) -> Void {
    
        //sending the received data from services to the viewmodel
        pEmpVMPro?.sendEngineerDetails(edArray:engDetailArray)
        
        }
}
