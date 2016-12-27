//
//  AttendanceReportViewController.swift
//  FundooHR
//
//  Created by BridgeLabz on 27/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class AttendanceReportViewController: UIViewController {

    @IBOutlet weak var outerTabelView: UITableView!
    
   var companies: [String] = ["BridgeLabz","GreyTip","Meru","Valuepitch","Craftsville","Nect Education","Finacus"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("count is #\(self.companies.count)")
        return self.companies.count;
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.outerTabelView.dequeueReusableCell(withIdentifier: "cell")! 
        
        cell.textLabel?.text = self.companies[indexPath.row]
    
        cell.textLabel?.textColor = UIColor.darkGray;
        cell.textLabel?.font = UIFont(name:"Avenir", size:12)
        
        
        return cell
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
