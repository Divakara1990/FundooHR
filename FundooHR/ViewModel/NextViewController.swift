//
//  NextViewController.swift
//  FundooHR
//
//  Created by BridgeLabz on 27/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    
    @IBOutlet weak var employeeID: UILabel!
    
    var id : String?
    var index : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        employeeID.text = id
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
   

 
}
