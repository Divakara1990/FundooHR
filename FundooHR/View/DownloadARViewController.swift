//
//  DownloadARViewController.swift
//  FundooHR
//
//  Created by BridgeLabz on 02/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit

class DownloadARViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //outlet for the tableview
    @IBOutlet weak var tableView: UITableView!
    
    //outlet to hold the current date
    @IBOutlet weak var todaysDate: UILabel!
   
   
    //array of string type which holds the file names
    var mArray = ["meru.zip","craftsville.zip","bridgelabz.zip","greytip.zip","nexteducation.zip"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
        
        todaysDate.text = CurrentDate
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
