//
//  protocols.swift
//  FundooHR
//
//  1. protocol class which contains the protocols, each protocol contains the specific methods 
//
//  Created by BridgeLabz on 06/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import Foundation
import UIKit


// protocols for login flow
protocol LoginVMProtocol
{
    func checkReceivedLoginStatus(token1:String, status1:Int,message1: String)
    func errorMessageVM()
}

protocol LoginCotrollerProtocol
{
    func loginSuccessful(token: String, status : Int, message: String)
    func errorMessageCtrl()
}

protocol LoginVCProtocol
{
    func saveReceivedToken(tokn1 : String , status :Int, mess : String )
    func errorMessage()
}



//protocol for the engineer details controller class
protocol EmployeeControllerProtocol
{
    func fetchEngineerDetails()
    func sendEmployeeDetails(engDetailArray:[EngineerDetails])
}

protocol EmployeeVMProtocol
{
    func sendEngineerDetails(edArray:[EngineerDetails])
}

protocol EmployeeVCProtocol
{
    func reloadFinalData()
}



// protocols for attendancereports flow
protocol AttendanceSlipControllerProtocol
{
    func fetchAttendanceDetails()
    func sendReceivedAttendanceReportDetails(attendanceArray array : [AttendanceModel], companiesList list : [String])
}

protocol AttendanceVMProtocol
{
    func sendAttendanceDetails(attendanceArray array : [AttendanceModel], companiesList list : [String])
}

protocol AttendanceVCProtocol
{
    func reloadAttendanceData()
}


//protocols for the salary payslip flow
protocol SalaryPaySlipControllerProtocol
{
    func fetchSalaryDetails()
    func receiveFetchedSalaryDetails(paySlipArray array : [PaySlipModel])
}

protocol SalaryPaySlipVMProtocol
{
    func receieveSalaryData(salSlipArray array: [PaySlipModel])
}

