//
//  AttendanceReportViewModel.swift
//  FundooHR
//
//  1. viewmodel class for the attendance viewcontroller which makes the call from to the controller to fetch the data, and receives the dta from controller
//
//  Created by BridgeLabz on 24/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit

class AttendanceReportViewModel: NSObject,AttendanceVMProtocol
{
    //variable of attendance report controller class
    var mAttendanceReportController : AttendanceReportController?
    
    //array of object type vaariable which holds the attendance data object
    var mAttendanceArray : [AttendanceModel] = []
    
    //variable of array type which holds the string values
    var mCompaniesArray : [String] = []
    
    //variable of array type which holds the objects of attendance model in sorted order
    var mSortArray : [AttendanceModel] = []
    
    //variable of the VCProtocol
    var attendanceVCPro : AttendanceVCProtocol?
    
    
    //constructor of the viewmodel class
    init(attendanceVCObj : AttendanceVCProtocol)
    {
        super.init()
        attendanceVCPro = attendanceVCObj
        //creating the object of controllerclass and passing the self object as a parameter
        mAttendanceReportController = AttendanceReportController(attendanceVMProtocolObj: self)
    }

    
    
    //function which is called from the viewcontroller to fetch the data from the controller
    func fetchAttendanceRecord()
    {
        //invoking the method of the controller
        mAttendanceReportController?.fetchAttendanceDetails()
    }
    
    
    //function to receive the data from the controller and aving in this class
    func sendAttendanceDetails(attendanceArray attRecord : [AttendanceModel], companiesList vmlist : [String])
    {
        if attRecord.count >= 1
        {
            mCompaniesArray = vmlist
            mAttendanceArray = attRecord
            mSortArray = mAttendanceArray
            attendanceVCPro?.reloadAttendanceData()
        }
        else
        {
            //if data is not received then again calling the method to fetch the data
            mAttendanceReportController?.fetchAttendanceDetails()
        }
    }
}
