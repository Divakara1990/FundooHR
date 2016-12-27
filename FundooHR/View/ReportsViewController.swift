//
//  ReportsViewController.swift
//  FundooHR
//
//  Created by BridgeLabz on 25/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class ReportsViewController: UIViewController {

  
    @IBOutlet weak var reportCollView: UICollectionView!
    
    @IBOutlet weak var secondaryReportView: UIView!
    @IBOutlet weak var reportLabel: UILabel!
    
    var reportData = ["Salary Payslip","Attendance Report","Invoice"]
    var repfinalData : [String]!
    
    var repFieldName : String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.reportCollView.dataSource = self
        self.secondaryReportView.layer.shadowColor = UIColor.black.cgColor
        self.secondaryReportView.layer.shadowOpacity = 0.5
        self.secondaryReportView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.secondaryReportView.layer.shadowRadius = 2.0
        reportCollView.dataSource = self
        
        if repFieldName != nil{
            reportLabel.text = repFieldName
        }
        repfinalData = reportData
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

extension ReportsViewController : UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return repfinalData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reportcell", for: indexPath) as! ReportCollectionViewCell
        
        cell.reportCellHeading?.text = repfinalData[indexPath.row]
        cell.contentView.layer.cornerRadius = 8
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.cyan.cgColor
        cell.contentView.backgroundColor = UIColor.white
        cell.layer.shadowOpacity = 0.6
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 0.2)
        cell.layer.shadowRadius = 2.0
        cell.layer.masksToBounds = false
        return cell
    }
}
