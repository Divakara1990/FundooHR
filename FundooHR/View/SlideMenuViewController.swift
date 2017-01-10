//
//  SlideMenuViewController.swift
//  FundooHR
//
//  Created by BridgeLabz on 16/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class SlideMenuViewController: UIViewController {

    
    @IBOutlet weak var slideTableView: UITableView!
    var dashBoard : DashboardViewController?
    
    var array = ["Dashboard","Engineers","Attendance Summary","Reports","Clients"]
    override func viewDidLoad() {
        super.viewDidLoad()
        slideTableView.dataSource = self
        slideTableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        
//        var indexpath : IndexPath?
//        indexpath = slideTableView.indexPathForSelectedRow
//        let dash = segue.destination as! DashboardViewController
//        let name = array[(indexpath?.row)!]
//        dash.fieldName = name
//    }
}

extension SlideMenuViewController : UITableViewDataSource, UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! SlideMenuTableViewCell
        
        cell.label.text = array[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "gotoDashboard", sender: nil)
            break
        case 1:
            self.performSegue(withIdentifier: "gotoEngineers", sender: nil)
            break
        case 2:
            self.performSegue(withIdentifier: "gotoDashboard", sender: nil)
            break
        case 3:
            self.performSegue(withIdentifier: "gotoReports", sender: nil)
            break
        case 4:
            self.performSegue(withIdentifier: "gotoDashboard", sender: nil)
            break
        default:
            NSNull.self
        }
    }
}
