//
//  EngineerDetailsController.swift
//  FundooHR
//
//  Created by BridgeLabz on 20/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class EngineerDetailsController: NSObject, controllerDelegate
{
   var fetchEngineerDetailsVar = FetchEngineerDetails()
    var engineerDetailsVM : EngineerDetailsViewModel?
    var fetchEngineerDetailsVAR: FetchEngineerDetails?
    
    var delegate2 : DataSenderDelegate?
    var delegate1 : ServicesDelegate?
    
     func callFromControllerToServices()-> Void
     {
        fetchEngineerDetailsVAR = FetchEngineerDetails()
        fetchEngineerDetailsVAR?.delegate1 = self
        fetchEngineerDetailsVAR?.callRestApiToFetchEngineersData()
    }
    
    func recieveDataFromServices(engDetailArray :[EngineerDetails]) -> Void {
        delegate2?.recieveDataFromController(edArray:engDetailArray)
        }
}
