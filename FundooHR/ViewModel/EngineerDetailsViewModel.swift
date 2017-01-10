//
//  EngineerDetailsViewModel.swift
//  FundooHR
//
//  Created by BridgeLabz on 20/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class EngineerDetailsViewModel: NSObject, DataSenderDelegate
{
    var EngineerDetailsControllerObj = EngineerDetailsController()
    var engDetailArray:[EngineerDetails] = []
    var EngineerDetailsControllerVAR : EngineerDetailsController?
    var delegate:controllerDelegate?
    var sortedArray: [EngineerDetails] = []
    var sVCObj:SearchViewController?
    
    
    func callFromViewModelToController()
    {
        EngineerDetailsControllerVAR = EngineerDetailsController()
        EngineerDetailsControllerVAR?.engineerDetailsVM = self
        EngineerDetailsControllerVAR?.delegate2 = self
        EngineerDetailsControllerVAR?.callFromControllerToServices()
    }
    

    func recieveDataFromController(edArray engRecord:[EngineerDetails]) -> Void
    {
        if engRecord.count >= 1
        {
            engDetailArray = engRecord
            print("APi Data is \(engDetailArray)")
             sortedArray = engDetailArray.sorted{ $0.engName! < $1.engName! }
            print("Sorted Array is \(sortedArray)")
           sVCObj?.reloadFinalData()
        }
        else
        {
            EngineerDetailsControllerVAR?.callFromControllerToServices()
        }
    }
}
