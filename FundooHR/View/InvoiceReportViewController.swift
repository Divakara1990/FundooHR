//
//  InvoiceReportViewController.swift
//  FundooHR
//
//  1. viewcontroller class which contains the details of the invoice reports
//  2. makes use of both collectionview and tableview "tableview inside a collectionviewcell"
//
//  Created by BridgeLabz on 30/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class InvoiceReportViewController: UIViewController
{
    //outlet for selectall button
    @IBOutlet weak var selectAllBtn: UIButton!
    
    //outlet for collectionview
    @IBOutlet weak var invoiceCollView: UICollectionView!
    
    //outlet for date
    @IBOutlet weak var invoiceDate: UILabel!
    
    //outlet for generate button
    @IBOutlet weak var generateBtn: UIButton!
    
    //outlet to hold the count of the attendance
    @IBOutlet weak var attCount: UILabel!
    
    //data to be displayed inside the collectionviewcell
    var mCompanies: [String] = ["BridgeLabz","GreyTip","Meru","Valuepitch","Craftsville","Nect Education","Finacus"]
    
    //data to be displayed inside the tableviewcell
    var mNames: [String] = ["Amith","Anand","Eshwar","Zakki","Vishwas","Bushan","Greshma","Hema","John","Jeeva","Kamal","Laxman","Ajith","Frenzy","Indhu","Manoj","Naveen","Divakar YN", "Chandra", "Darshan", "Dilip", "Diganth","Chethan", "Charan", "Ramesh", "Rakesh","Roopesh", "Rajesh", "Santhosh", "Sanjay","Sree Prasad", "Sunith", "Swamy", "Sugam","Pramodh", "Punith", "Pretham", "Pankaj"]
   
    //variables to hold the images to perform the checkbox
    let mChecked = UIImage(named: "checked.png") as UIImage!
    let mUnchecked = UIImage(named: "unchecked.png") as UIImage!
    var mFlag : Bool = false
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //setting the properties to the generate button
        generateBtn.layer.cornerRadius = 8
        generateBtn.layer.masksToBounds = true
        
        //setting the properties to the label(account count)
        attCount.layer.cornerRadius = 10
        attCount.layer.masksToBounds = true
        
        //assigning the date to the label
        invoiceDate.text = CurrentDate
               // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //function executes when the select all button is clicked
    @IBAction func selectAllBtnClicked(_ sender: Any)
    {
        //checking if the clicked button is checked or unchecked
        if (selectAllBtn.imageView?.image != mChecked)
        {
            selectAllBtn.setImage(mChecked!, for: .normal)
            mFlag = true
            //setting the background color of the generate button
            generateBtn.backgroundColor = UIColor(colorWithHexValue: 0x6FB8D9)
            invoiceCollView.reloadData()
        }
        else
        {
            selectAllBtn.setImage(mUnchecked!, for: .normal)
            generateBtn.backgroundColor = UIColor.clear
            mFlag = false
            invoiceCollView.reloadData()
        }

    }

}


//datasource and delegates methods of the UICollectionview and UITableview
extension InvoiceReportViewController : UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource
{
    @available(iOS 6.0, *)
    //function to set the number of items in the section of the collectionview
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return mCompanies.count
    }
    
    //function to display the contents to be displayed inside the each cell of collectionview
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "invoice cell", for: indexPath) as! InvoiceCollViewCell
        
        cell.invoiceCollLabel.text = mCompanies[indexPath.row]
        if mFlag {
            cell.collCheckBox.imageView?.image = mChecked
            cell.tableView.reloadData()
            return cell
        }else{
            cell.collCheckBox.imageView?.image = mUnchecked
            cell.tableView.reloadData()
            return cell
        }
    }
    
    
    //function to display the number of rows to be difined in the tableview
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return mNames.count
    }
    
    //function to display the contents of the tableviewcell.
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InvoiceTableViewCell
        cell.tabLabel?.text = mNames[indexPath.row]
        
        if mFlag {
            cell.tabCellCheckBox.imageView?.image = mChecked
        }
        else{
            cell.tabCellCheckBox.imageView?.image = mUnchecked
        }
        cell.textLabel?.textColor = UIColor.darkGray
        cell.textLabel?.font = UIFont(name:"Avenir", size:12)
        return cell
    }
}

