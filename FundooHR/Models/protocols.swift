//
//  protocols.swift
//  FundooHR
//
//  Created by BridgeLabz on 06/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import Foundation
import UIKit

protocol controllerDelegate {
    
    func recieveDataFromServices(engDetailArray:[EngineerDetails])
    func callFromControllerToServices()
}

protocol controllerDelegateA {
    //salary PaySlip Method
    func callFromContToSer()
}

protocol DataSenderDelegate {
    func recieveDataFromController(edArray:[EngineerDetails])
}

protocol DataSenderDelegateA {
    
}


protocol ServicesDelegate {
    
    func callRestApiToFetchEngineersData()
}

protocol ServicesDelegateA {
    
    func callRestApiToFetchSalaryData()
}



protocol LoginVMProtocol{
    func userLoginStatus(token1:String, status1:Int,message1: String)
    func errorMessageVM()
}

protocol LoginCotrollerProtocol {
   func receiveLoginStatus(token: String, status : Int, message: String)
    func errorMessageCtrl()
}


protocol ReportsProtocol {
    func callRestApiToFetchSalaryData()
}
