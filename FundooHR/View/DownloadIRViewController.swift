//
//  DownloadIRViewController.swift
//  FundooHR
//
//  Created by BridgeLabz on 02/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit

class DownloadIRViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    //outlet fo rthe tableview
    @IBOutlet weak var tableView: UITableView!
    
    //outlet to display the current date in view
    @IBOutlet weak var todaysDate1: UILabel!
    
    //variable for array of string type
    var mArray = ["meru.zip","craftsville.zip","bridgelabz.zip","greytip.zip","nexteducation.zip"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting datasource and delegates of the tableview
        tableView.dataSource = self
        tableView.delegate = self
        
        todaysDate1.text = CurrentDate

    }

   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return mArray.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell:UITableViewCell = self.tableView!.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = self.mArray[indexPath.row]
        cell.textLabel?.textColor = UIColor.darkGray;
        cell.textLabel?.textAlignment = .center
        
        cell.textLabel?.font = UIFont(name:"Avenir", size:16)
        cell.textLabel?.textColor = UIColor(colorWithHexValue: 0x6FB8D9)
        
        return cell
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
