//
//  SearchViewController.swift
//  FundooHR
//
//  1. view for the searching and displaying the employee details
//  2. contains the uicollectionview and tableview to display the data in the form of objects
//  3. contains the delegate methods of searchbar, collectionview & tableview
//
//  Created by BridgeLabz on 12/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

//Global Variables declared outside the class



class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, EmployeeVCProtocol
{
    //outlet to the label to display the current date
    @IBOutlet weak var todaysDate: UILabel!
    
    //outlet for collectionview
    @IBOutlet weak var searchCollection: UICollectionView!
    
    //outlet for tableview
    @IBOutlet weak var searchTableView: UITableView!
    
    //outlet for searchBar
    @IBOutlet weak var searchBar: UISearchBar!
    
    //outlet for menu button(which slides from left side)
    @IBOutlet weak var slideMenu: UIButton!
    
    //outlet for the loading indicator
    @IBOutlet weak var loader: UIActivityIndicatorView!
    

    
    //boolean variable used to avoid rest api call for second time
    //var mFlagState : Bool = true
    
    //variable for model object
    var mFinalEmpData:[EngineerDetails]?
    
    //variable of engineerdetails(model) object
    var mArrayData = [EngineerDetails]()
    
    //variable for viewmodel class
    var mEngineerViewModelObj : EngineerDetailsViewModel?
    
    //array to store the alphabets in the rightside of the view
    var mAlphabets: [String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    //declaring the cell name of collectionview cell
    let mCollectionCell = "cell"
    
    //variable to hold the array of strings
    var mFinalArr = [String]()
    
    //variable to store the empid, used to send for next view controller
    var mEid : String?
    
    var mCount : Int = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //gives the seperate view, SlideBar, using swrevealviewcontroller
        slideMenu.addTarget(self.revealViewController(), action:
            #selector(SWRevealViewController.revealToggle(_:)),
            for: .touchUpInside)
        
            //storing the viewmodel object in the variable
            mEngineerViewModelObj = EngineerDetailsViewModel(employeeVCObj: self)
            //until data comes the loader will be loading
            self.loader.startAnimating()
            //invoking the function which is in viewmodel to fetch the employee details
            mEngineerViewModelObj?.getEngineerDetails()
        
        
        //storing the sorted array in the variable of object type
        mFinalEmpData = mEngineerViewModelObj?.mSortedDataInVM
        
        //tableview datasource and delegates to the class
        self.searchTableView.dataSource = self
        self.searchTableView.delegate = self
        
        //searchbar delegate
        self.searchBar.delegate = self
        
        //setting the properties for the search bar
        self.searchBar.layer.borderColor = UIColor.black.cgColor
        self.searchBar.layer.borderWidth = 1
        self.searchBar.layer.cornerRadius = 20.0
        self.searchBar.clipsToBounds = true
        
        //setting the current date
        todaysDate.text = CurrentDate
    
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //function to reload the data when the data is fetched from server and ready to display in the viewmodel
    func reloadFinalData()
    {
         mCount += 1
         mFinalEmpData = mEngineerViewModelObj?.mSortedDataInVM
        
        //collectionview datasource and delegate
          searchCollection.dataSource = self
          searchCollection.delegate = self
    }
    
    
    
    //TableView Delegate & DataSource methods
    //to declare the number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return mAlphabets.count;
    }
    
    
    //to define the contents of the table rows
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
     {
        let cell:UITableViewCell = self.searchTableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = mAlphabets[indexPath.row]
        cell.textLabel?.textColor = UIColor.darkGray;
        cell.textLabel?.font = UIFont(name:"Avenir", size:12)
        return cell
     }
    
    
    //delegate function when the particular row is selected in tableview
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("You selected cell #\(indexPath.row)!")
        var text : String?
        text = (mAlphabets[indexPath.row])
         print(text!)
        
        //changing the color of the alphabet when that particular is selected
        let Cell = tableView.cellForRow(at: indexPath)
        Cell?.textLabel?.textColor = UIColor.blue
        
        //function to scroll to the particular employee in the collection view when the alphabet is clicked in the tableview
        tableAlphabetClicked(alpha: text!, row : indexPath)
        
    }
    
    
    //table view delegate method to change the color of the alphabet when it is deselected to the normal color
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)
    {
        let deselectedCell = tableView.cellForRow(at: indexPath as IndexPath)!
        deselectedCell.textLabel?.textColor = UIColor.black
    }
    

    
//Scroll to the particular position when the alphabet is clicked
    
    func tableAlphabetClicked(alpha : String, row : IndexPath)
    {
        //variable to declare the indexpath
        var mIndexpath : NSIndexPath?
        
        //variable to store the int value
        var mIndex2 : Int = 0
        mFinalEmpData = mEngineerViewModelObj?.mSortedDataInVM
        var mx2 : Int = 0
        for _ in mFinalEmpData!
        {
            let obj = (mFinalEmpData?[mx2])! as EngineerDetails
            
            let name = obj.engName
            print(name!)
            if (name?.hasPrefix(alpha))!
            {
                mIndex2 = (mFinalEmpData?.index(of: obj))!
                print(mIndex2)
                //converting the int value to the indexpath because the scrolltoItem method accepts the indexpath
                mIndexpath = IndexPath(item: mIndex2, section: 0) as NSIndexPath?
                print(mIndexpath!)
                break
            }
            mx2 += 1
        }
        if mx2 == (mFinalEmpData?.count)!
        {
            return
        }
        else
        {
            self.searchCollection.scrollToItem(at: mIndexpath as! IndexPath, at: .top, animated: true)
        }

    }
    
    
    //SearchBar Delegate Method
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        //variable used to search using searchbar
        let mData = [String]()
        
        mFinalEmpData = mEngineerViewModelObj?.mSortedDataInVM
        var mx : Int = 0
        for _ in mFinalEmpData!
        {
            let obj = (mFinalEmpData?[mx])! as EngineerDetails
            let na = obj.engName
            let dat = na
            mx += 1
            mFinalArr.append(dat!)
        }
        print("fetched Names From array is \(mFinalArr)")
    
        mFinalArr = searchText.isEmpty ? mData : mFinalArr.filter({(dataString: String) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return dataString.range(of: searchText, options: .caseInsensitive) != nil
        })
         print("------------------>\(mFinalArr)")
        
        if searchText.isEmpty == true
        {
            mFinalEmpData = mEngineerViewModelObj?.mSortedDataInVM
            searchCollection.reloadData()
        }
        else
        {
            let filteredByNameArray = mFinalEmpData?.filter {
                    mFinalArr.contains($0.engName!)
                }
        
                mFinalEmpData = filteredByNameArray
                searchCollection.reloadData()
        }
    }
}


//collectionview datasource method, which displays the contents of the cell( employee details)
extension SearchViewController : UICollectionViewDataSource, UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mCollectionCell, for: indexPath) as! SearchCollViewCell
        
        let temp = mFinalEmpData?[indexPath.row]
        
        cell.EngineerName.text = temp?.engName
        cell.EngineerCompany.text = temp?.engCompany
        cell.EngineerEmail.text = temp?.engEmail
        cell.EngineerJob.text = temp?.engJob
        cell.EngineerMobNo.text = temp?.engMobile
        
        //defining the collectionview cell properties
        cell.contentView.layer.cornerRadius = 8
        cell.layer.cornerRadius = 8
        cell.layer.shadowOpacity = 0.6
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 0.2)
        cell.layer.shadowRadius = 2.0
        cell.layer.masksToBounds = false
        
        return cell
    }

    
    
    //to define the number of items in the sections of collectionview
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        if(mCount == 0){
        return 0
        }else{
            self.loader.stopAnimating()
            return (mFinalEmpData?.count)!
        }
    }

    
    //delegate function of collection view, executes when the collectioncell is selected
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
    
        let row = indexPath.row
        print(indexPath.row)
        
        let obj = mFinalEmpData?[row]
        print(obj!)
        mEid = obj?.engID
        print(mEid!)
        
        let destinationVC = NextViewController()
        destinationVC.id = mEid
        
        self.performSegue(withIdentifier: "gotoNextViewController", sender: self)
    }
    
    //UIViewController method which is used to perform the segues and can send the data from one controller to the other 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "gotoNextViewController"
        {
            let slide = segue.destination as! NextViewController
            slide.id = mEid
        }
    }

}
