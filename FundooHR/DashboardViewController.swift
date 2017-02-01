//
//  DashboardViewController.swift
//  FundooHR
//
//  1. Dashboard View Controller used to display the contents of Dashboard
//  2. makes use of collectionview to display the contents
//  3. holds the library for slideBar(swrevealviewcontroller)
//
//  Created by BridgeLabz on 12/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

//global variable which can be used in all views without creating the object
var CurrentDate : String?

class DashboardViewController: UIViewController {

    //outlet fr menu button(which gives the view from left side)
    @IBOutlet weak var slideBarButton: UIButton!
    
    //outlet for view
    @IBOutlet weak var secondaryView: UIView!
    
    //outlet for collectionview which is used
    @IBOutlet weak var dashboardCollection: UICollectionView!
    
    //outlet for label to display the heading
    @IBOutlet weak var dashLabel: UILabel!
    
    //outlet to display the date
    @IBOutlet weak var todaysDate: UILabel!
    
    
    
    //array stores the contents of dashboard
    var mDashBoardData = ["Attendance Summary","Attendance Fallout","Leave Summary","Engineers","Clients","Reports"]
    
    //variable to store the date formatter object
    let mFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //gives the seperate view, SlideBar.
        slideBarButton.addTarget(self.revealViewController(), action:
            #selector(SWRevealViewController.revealToggle(_:)),
            for: .touchUpInside)
        //connecting the datasource and delegates of collectionview
        self.dashboardCollection.dataSource = self
        self.dashboardCollection.delegate = self
        
        //setting the layer properties
        self.secondaryView.layer.shadowColor = UIColor.black.cgColor
        self.secondaryView.layer.shadowOpacity = 0.5
        self.secondaryView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.secondaryView.layer.shadowRadius = 2.0
        
        //setting the current date
        mFormatter.setLocalizedDateFormatFromTemplate("dd-MMMM-yyyy")
        CurrentDate = mFormatter.string(from: Date())
        todaysDate.text = CurrentDate
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



//collectionview datasource and delegate methods
extension DashboardViewController : UICollectionViewDataSource, UICollectionViewDelegate
{
    
    //method to declare the number of sections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    //method to define the number of items in section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mDashBoardData.count
    }
    
    
    //method to display the contents of the collectionview
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //defining the cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashBoard Cells", for: indexPath) as! DashCollectionViewCell
        
        cell.dashBoardHeading?.text = mDashBoardData[indexPath.row]
        cell.dashBoardDate.text = CurrentDate
        cell.contentView.layer.cornerRadius = 8
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.cyan.cgColor
        cell.contentView.backgroundColor = UIColor.white
    
        //setting the properties for the cell
        cell.layer.shadowOpacity = 0.6
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 0.2)
        cell.layer.shadowRadius = 2.0
        cell.layer.masksToBounds = false
        return cell
    }
    
    
    //performing the segue operations when clicked on the particular cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == 3 {
                self.performSegue(withIdentifier: "gotoEngineers", sender: nil)
        }
        else if indexPath.row == 5 {
            self.performSegue(withIdentifier: "gotoReports", sender: nil)
        }
    }
}

