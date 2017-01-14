//
//  DashboardViewController.swift
//  FundooHR
//
//  Created by BridgeLabz on 12/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    
    @IBOutlet weak var slideBarButton: UIButton!
   
    @IBOutlet weak var secondaryView: UIView!
    @IBOutlet weak var dashboardCollection: UICollectionView!
    @IBOutlet weak var dashLabel: UILabel!
    
    var EngineerViewModelObj = EngineerDetailsViewModel()
    
    var dashBoardData = ["Attendance Summary","Attendance Fallout","Leave Summary","Engineers","Clients","Reports"]
    var dashData : [String]!
    
//    var date : String?
//    var date1 = Date()
    
    var fieldName : String? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //gives the seperate view, SlideBar.
        slideBarButton.addTarget(self.revealViewController(), action:
            #selector(SWRevealViewController.revealToggle(_:)),
            for: .touchUpInside)
        
        self.dashboardCollection.dataSource = self
        self.dashboardCollection.delegate = self
        self.secondaryView.layer.shadowColor = UIColor.black.cgColor
        self.secondaryView.layer.shadowOpacity = 0.5
        self.secondaryView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.secondaryView.layer.shadowRadius = 2.0
        dashboardCollection.dataSource = self
        
        if fieldName != nil{
            dashLabel.text = fieldName
        }
        
        dashData = dashBoardData
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension DashboardViewController : UICollectionViewDataSource, UICollectionViewDelegate
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dashData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashBoard Cells", for: indexPath) as! DashCollectionViewCell
        
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd MMMM YYYY"
        cell.dashBoardHeading?.text = dashData[indexPath.row]
        cell.contentView.layer.cornerRadius = 8
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.cyan.cgColor
        cell.contentView.backgroundColor = UIColor.white
        cell.layer.shadowOpacity = 0.6
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 0.2)
        cell.layer.shadowRadius = 2.0
        cell.layer.masksToBounds = false
//        if indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2{
//            date1 = Date.init(timeIntervalSince1970: Double((dashVM?.jsonTimeStamp)! / 1000))
//            print(date1!)
//            cell.dateLabel.text = formatter.string(from: date1! as Date)
//        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == 3 {
         
                self.performSegue(withIdentifier: "gotoEngineers", sender: nil)
        }
        else if indexPath.row == 5 {
            self.performSegue(withIdentifier: "gotoReports", sender: nil)
        }
        
    }

    
}

