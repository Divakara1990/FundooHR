//
//  AttendanceReportController.swift
//  FundooHR
//
//  1. controller class for the attendance viewcontroller
//  2. contains the functions to send and receive the data from viewmodel to services and vice-versa
//
//  Created by BridgeLabz on 24/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit

class AttendanceReportController: NSObject, AttendanceSlipControllerProtocol {


    //variable for the service class of fetchattendancereport
    var mfetchAttendanceDetails : FetchAttendanceReport?
    
    //variable of datadelegate
    var pAttendanceVMPro : AttendanceVMProtocol?
    
    //constructor which is used to initialize the values passess the object to the services
    init(attendanceVMProtocolObj : AttendanceVMProtocol)
    {
        super.init()
        pAttendanceVMPro = attendanceVMProtocolObj
        mfetchAttendanceDetails = FetchAttendanceReport(attendanceControllerObj: self)
        
    }

    
    
    //function which invoked from the viewmodel to fetch the data
    func fetchAttendanceDetails() {
        
        //invoking the service class method to fetch the data
        mfetchAttendanceDetails?.fetchAttendanceReportDetails()
    }
    
    
    //function to receive the from the services class by using the protocol
    func sendReceivedAttendanceReportDetails(attendanceArray array : [AttendanceModel], companiesList list : [String]) {
        
        //sending the received data from services to the viewmodel
        pAttendanceVMPro?.sendAttendanceDetails(attendanceArray : array, companiesList : list)
    }
}
