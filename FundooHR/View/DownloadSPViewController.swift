//
//  DownloadSPViewController.swift
//  FundooHR
//
//  1. class which is used to download the salarypayslip file from the server
//
//  Created by BridgeLabz on 02/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit

class DownloadSPViewController: UIViewController {

    //outlet to display the todays date
    @IBOutlet weak var todaysDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    todaysDate.text = CurrentDate

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtomClicked(_ sender: Any) {
        
//        self.performSegue(withIdentifier: "gobacktosalaryslip", sender: nil)
        self.navigationController?.popViewController(animated: true)
        
    }
    
        
}
