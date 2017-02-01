//
//  ReportsViewController.swift
//  FundooHR
//
//  1. Reports ViewController class
//  2. displays the main content of the reports
//
//  Created by BridgeLabz on 25/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class ReportsViewController: UIViewController {
    
    //outlet for menu button to use the slide menu viewcontroller
    @IBOutlet weak var slideMenu1: UIButton!
    
    //outlet to display the date
    @IBOutlet weak var date: UILabel!
    
    //outlet for collectionview
    @IBOutlet weak var reportCollView: UICollectionView!
    
    //outlet for view
    @IBOutlet weak var secondaryReportView: UIView!
    
    //outlet for report heading label
    @IBOutlet weak var reportLabel: UILabel!
    
    
    //variable of string type array contains report headings
    var mReportData = ["Salary Payslip","Attendance Report","Invoice"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //brings the slide menu from left side of the view, using swreveal viewcontroller
        slideMenu1.addTarget(self.revealViewController(), action:
            #selector(SWRevealViewController.revealToggle(_:)),
            for: .touchUpInside)
        
        //setting the datasource and delegates of collection view
        self.reportCollView.dataSource = self
        self.reportCollView.delegate = self
        
        //setting the properties to the collection view cell
        self.secondaryReportView.layer.shadowColor = UIColor.black.cgColor
        self.secondaryReportView.layer.shadowOpacity = 0.5
        self.secondaryReportView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.secondaryReportView.layer.shadowRadius = 2.0
        
        //displaying the date in the required formate
        date.text = CurrentDate
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



//extending the reports viewcontroller to define the datasource and delegates methods
extension ReportsViewController : UICollectionViewDataSource, UICollectionViewDelegate
{
    //functions to define the number of sections in collectionview
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    //function to define the number of items in each section of collectionview
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mReportData.count
    }
    
    
    //function to define the contents to be displayed in each cell of collectionview
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reportcell", for: indexPath) as! ReportCollectionViewCell
        
        cell.reportCellHeading?.text = mReportData[indexPath.row]
        //setting the properties to the collectionview cell
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
    
    
    //function of delegate method to perform segue when the particular cell is clicked
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        if indexPath.row == 0 {
           self.performSegue(withIdentifier: "gotoSalaryPayslip", sender: nil)
        }
        else if indexPath.row == 1 {
            self.performSegue(withIdentifier: "gotoAttendanceReport", sender: nil)
        }
        else{
            self.performSegue(withIdentifier: "gotoInvoiceReport", sender: nil)
        }
        
    }
}
