//
//  AttendanceReportVC.swift
//  FundooHR
//
//  1. viewcontroller class in MVVM structure which makes use of collectionview and tableview to maintain the attendance data
//  2. contains the outlets which is used inside the view
//
//  Created by BridgeLabz on 10/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit

class AttendanceReportVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource, AttendanceVCProtocol
{
    //outlet for activity indicator
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    //outlet to store the current date
    @IBOutlet weak var currentDate: UILabel!
    
    //outlet for collectionview used inside the viewcontroller
    @IBOutlet weak var collectionView: UICollectionView!
    
    //outlet for label which holds the attendance count
    @IBOutlet weak var Attcount: UILabel!
    
    //outlet for label which holds the attendance status
    @IBOutlet weak var AttStatus: UILabel!
    
    //outlet for generate button
    @IBOutlet weak var generateBtn: UIButton!
    
    //outlet for select all button
    @IBOutlet weak var selectAllBtn: UIButton!
    
    
    //variable of attendance report viewmodel class type
    var mAttendanceSlipVMobj : AttendanceReportViewModel?
   
    //variable which holds the array of string type data, which is used to display inside the collectionviewcell
    var mCompanies: [String] = ["BridgeLabz","GreyTip","Meru","Valuepitch","Craftsville","Nect Education","Finacus"]
    
    //variable of array type which stores the strings inside the array
    var mNames: [String] = ["Amith","Anand","Eshwar","Zakki","Vishwas","Bushan","Greshma","Hema","John","Jeeva","Kamal","Laxman","Ajith","Frenzy","Indhu","Manoj","Naveen","Divakar YN", "Chandra", "Darshan", "Dilip", "Diganth","Chethan", "Charan", "Ramesh", "Rakesh","Roopesh", "Rajesh", "Santhosh", "Sanjay","Sree Prasad", "Sunith", "Swamy", "Sugam","Pramodh", "Punith", "Pretham", "Pankaj"]
    
    //variables to hold the images checked and unchecked
    let mChecked = UIImage(named: "checked.png") as UIImage!
    let mUnchecked = UIImage(named: "unchecked.png") as UIImage!
    
    //variable to hold the boolean value
    var mFlag : Bool = false
    
    //variable contains the array of object type(attendance model)
    var mFinalAttData : [AttendanceModel]?
    
    //variable of int type and assigning it to zero
    var mRow1 : Int = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.loader.startAnimating()
        
        //creating the object of AttendanceslipViewModel and storing in the variable
        mAttendanceSlipVMobj = AttendanceReportViewModel(attendanceVCObj: self)
        
        //invoking the method which is present in the viewmodel
        mAttendanceSlipVMobj?.fetchAttendanceRecord()

        //setting the properties of the generate button
        generateBtn.layer.cornerRadius = 8
        generateBtn.layer.masksToBounds = true
        //setting the properties of the label which holds the attendance count
        Attcount.layer.cornerRadius = 10
        Attcount.layer.masksToBounds = true
        
        //assigning the currentDate(golbal variable value) to the view controller label
        currentDate.text = CurrentDate
    }
    
    //after getting the data from the rest api, function to reload the data of the view
    func reloadAttendanceData()
    {
        self.collectionView.reloadData()
        mFinalAttData = mAttendanceSlipVMobj?.mSortArray
    }
    
    
    //function used to perform the checkbox selectall operation
    @IBAction func selectAllCheckBoxClicked(_ sender: Any)
    {
        if (selectAllBtn.imageView?.image != mChecked)
        {
            selectAllBtn.setImage(mChecked!, for: .normal)
            mFlag = true
            generateBtn.backgroundColor = UIColor(colorWithHexValue: 0x6FB8D9)
            collectionView.reloadData()
        }
        else
        {
            selectAllBtn.setImage(mUnchecked!, for: .normal)
            generateBtn.backgroundColor = UIColor.clear
            mFlag = false
            collectionView.reloadData()
        }
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//uicollectionview datasource and delegates methods
    @available(iOS 6.0, *)
    //function to set the number of items for the collectionview
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if (mAttendanceSlipVMobj?.mCompaniesArray.count)! == 0
        {
            return 0
        }
        else
        {
            self.loader.stopAnimating()
            return (mAttendanceSlipVMobj?.mCompaniesArray.count)!
        }
    }
    
   
    //datasource method used to display the contents of the collectionview cell
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AttRepCollCell
        
        cell.lab.text = mAttendanceSlipVMobj?.mCompaniesArray[indexPath.row]
        mRow1 = indexPath.row
        cell.tableView.reloadData()
        
        if mFlag
        {
            cell.collCellCheckBox.imageView?.image = mChecked
            cell.tableView.reloadData()
            return cell
        }
        else
        {
            cell.collCellCheckBox.imageView?.image = mUnchecked
            cell.tableView.reloadData()
            return cell
        }
    }
    
    
    //datasource method of the uitableviewcell, to set the number of the rows in section
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return mFinalAttData!.count
    }
    
    
    //datasource method used to display the contents of the table cell
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! AttTabCell
        
        cell.labInTabCel.text = mFinalAttData?[indexPath.row].mName
        let temp = mFinalAttData?[indexPath.row].mleave!
        
        let x = Int(temp!)
        if x! >= 2
        {
            cell.leaveCount.text = temp! + " L"
            cell.leaveCount.textColor = UIColor(colorWithHexValue: 0xE35656)
            cell.textLabel?.font = UIFont(name:"Avenir", size:12)
            
        }
        else
        {
            cell.leaveCount.text = temp! + " L"
            cell.leaveCount.textColor = UIColor(colorWithHexValue: 0x18880D)
            cell.textLabel?.font = UIFont(name:"Avenir", size:12)
            
        }
        
        
        if mFlag
        {
            cell.tabCheckBox.imageView?.image = mChecked
        }
        else
        {
            cell.tabCheckBox.imageView?.image = mUnchecked
        }
        return cell
    }
}
