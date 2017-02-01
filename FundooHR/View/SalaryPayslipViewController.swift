//
//  SalaryPayslipViewController.swift
//  FundooHR
//
//  1. contains the outlets of the class
//  2. collectionview is used to display the employees salaryslip details
//
//  Created by BridgeLabz on 25/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class SalaryPayslipViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
   
    //outlet for activity indicator
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    //outlet for checkbox(select all)
    @IBOutlet weak var selectAllCB: UIButton!
    
    //outlet for collectionview
    @IBOutlet weak var salaryCollView: UICollectionView!
    
    //outlet to store the total employee count
    @IBOutlet weak var empCount: UILabel!
    
    //outlet for button
    @IBOutlet weak var generateBtn: UIButton!
    
    //outlet for menu button
    @IBOutlet weak var slideMenu: UIButton!
    
    //outlet to store the current date
    @IBOutlet weak var todaysDate: UILabel!
   
    
    //variable to store the object of paySlipModel class type
    var mFinalSalData : [paySlipModel]?
    
    //variable of salarypayslip viewmodel type
    var mSalPaySlipVMVar : SalaryPaySlipVM?
    
    //variable for a boolean
    var mBool : Bool = false
    
    //variable to store the integer value
    var mButtonRow : Int?
    
    //variable to store the array of integer values
    var mArr:[Int] = []
    
    //setting the images to the variables
    let mChecked = UIImage(named: "checked.png") as UIImage!
    let mUnchecked = UIImage(named: "unchecked.png") as UIImage!
    var mFlag : Bool = true

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //creating the object of salaryslipViewModel and storing in the variable
        mSalPaySlipVMVar = SalaryPaySlipVM()
        mSalPaySlipVMVar?.mSalVCObj = self
        
        self.loader.startAnimating()
        //invoking the method which is present in the viewmodel
        mSalPaySlipVMVar?.fetchSalaryData()
        
        //setting the datasource and delegate functions
        self.salaryCollView.dataSource = self
        self.salaryCollView.delegate = self
        
        //gives the seperate view, SlideBar.
        slideMenu.addTarget(self.revealViewController(), action:
            #selector(SWRevealViewController.revealToggle(_:)),
                                  for: .touchUpInside)
        //setting the properties of the label and button
        empCount.layer.cornerRadius = 8
        empCount.layer.masksToBounds = true
        generateBtn.layer.cornerRadius = 8
        generateBtn.layer.masksToBounds = true
        //setting the date formatter and assigning the date to the variable todaysDate.
       
        todaysDate.text = CurrentDate
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //function executes when the data is fetched from the server successfully
    func reloadFinalData(){
        
        //assigning the sorted array to the variable of object type
        mFinalSalData = mSalPaySlipVMVar?.mSortArray
        //reloading the collection view
        self.salaryCollView.reloadData()
    }

    
    //function, shud be executed when the selectall button is clicked
    @IBAction func selectAllClicked(_ sender: Any) {
        //checking if the butten is checked or unchecked
        if (selectAllCB.imageView?.image != mChecked){
            selectAllCB.setImage(mChecked!, for: .normal)
            generateBtn.backgroundColor = UIColor(colorWithHexValue: 0x6FB8D9)
            salaryCollView.reloadData()
            mFlag = true
            
        }else{
            selectAllCB.setImage(mUnchecked!, for: .normal)
            generateBtn.backgroundColor = UIColor.clear
            mFlag = false
            salaryCollView.reloadData()
        }
    }
    
    //function when the normal checkbox is clicked
    @IBAction func subCheckBoxClicked(_ sender: UIButton)
    {
        
        mButtonRow = sender.tag
        mArr.append(mButtonRow!)
        mBool = true
        //converting the integer value to the indexpath
        let indexPath : IndexPath = IndexPath(item: mButtonRow!, section: 0);
        //reloading the particular cell based on the cell which is clicked by taking the indexpath
        salaryCollView.reloadItems(at: [indexPath])
    }
    
    //uicollectionview datasource function to define the number of sections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //datasource function to declare the number of items in each section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.loader.stopAnimating()
        return (mSalPaySlipVMVar?.mSortArray.count)!
    }
    
    //datasource function to define what to be displayed in each cell of uicollectionview
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "salarycell", for: indexPath) as! SalaryCollViewCell
        //storing the object in the temp variable
        let temp = mFinalSalData?[indexPath.row]
        cell.contentView.backgroundColor = UIColor.white
        cell.collLabel.text = temp?.engName
        cell.company.text = temp?.engCompany
        cell.status.text = temp?.engStatus
        
        //sending the indexpath.row value to the function subcheckboxclicked using the tag
        cell.cellCB.tag = indexPath.row
        cell.cellCB.addTarget(self,action : #selector(SalaryPayslipViewController.subCheckBoxClicked(_:)),
                              for:.touchUpInside)
        
        //condition to check the selectall button
        if mFlag {
            cell.cellCB.imageView?.image = mChecked
        }else{
            cell.cellCB.imageView?.image = mUnchecked
        }
        
        //condition to check when the particular checkbox is clicked
        if mBool{
            for i in mArr{
                if i == indexPath.row{
                    if cell.cellCB.imageView?.image == mUnchecked{
                        cell.cellCB.imageView?.image = mChecked
                    }else{
                        cell.cellCB.imageView?.image = mUnchecked
                    }
                }
            }
            mBool = false
        }

        return cell
    }
    
    
    //delegate function of uicollectionview class which will execute when the cell is selected
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "salarycell", for: indexPath) as! SalaryCollViewCell
        
        if (cell.cellCB.imageView?.image != mChecked)
        {
        cell.cellCB.setImage(mChecked, for: .normal)
        }
        else
        {
            cell.cellCB.setImage(mUnchecked, for: .normal)
        }
    }
    

}
//extension of the UIcolor class which is used to set the color using hexadecimal value
extension UIColor {
    convenience init(colorWithHexValue value: Int, alpha:CGFloat = 1.0){
        self.init(
            red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(value & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
