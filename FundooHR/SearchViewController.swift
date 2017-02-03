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
    var mFlagState : Bool = true
    
    //variable for model object used for searchbar
    var mFinalEmpData:[EngineerDetails]?
    
    //variable for model object used for alphabet clicked
    var mFinalTabelData : [EngineerDetails]?
    
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
    
    //used while setting the number of items in collectionview
    var mCount : Int = 0
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //gives the seperate view, SlideBar, using swrevealviewcontroller
        slideMenu.addTarget(self.revealViewController(), action:
            #selector(SWRevealViewController.revealToggle(_:)),
            for: .touchUpInside)
        
        if mFlagState
        {
            //storing the viewmodel object in the variable
            mEngineerViewModelObj = EngineerDetailsViewModel(employeeVCObj: self)
            //until data comes the loader will be loading
            self.loader.startAnimating()
            //invoking the function which is in viewmodel to fetch the employee details
            mEngineerViewModelObj?.getEngineerDetails()
        }//end of if block
        
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
    }//end of viewDidLoad() method
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }//end of didReceiveMemoryWarning() method
    
    
    //function to reload the data when the data is fetched from server and ready to display in the viewmodel
    func reloadFinalData()
    {
        mCount += 1
        mFinalEmpData = mEngineerViewModelObj?.mSortedDataInVM
        
        //collectionview datasource and delegate
        searchCollection.dataSource = self
        searchCollection.delegate = self
    }//end of reloadFinalData() method
    
    
    
    //TableView Delegate & DataSource methods
    
    //to declare the number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return mAlphabets.count;
    }//end of the tablevies numberfRowsInSection()

    
    
    //to define the contents of the table rows
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
     {
        let cell:UITableViewCell = self.searchTableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = mAlphabets[indexPath.row]
        cell.textLabel?.textColor = UIColor.darkGray;
        cell.textLabel?.font = UIFont(name:"Avenir", size:12)
        return cell
     }//end of tableviews cellForRowAt index() method
    
    
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
    }//end of tableviews didSelectRowAt indexpath() method
    
    
    //table view delegate method to change the color of the alphabet when it is deselected to the normal color
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)
    {
        let deselectedCell = tableView.cellForRow(at: indexPath as IndexPath)!
        deselectedCell.textLabel?.textColor = UIColor.black
    }//end of didDeselectRowAt indexpath() method
    

    
//Scroll to the particular position when the alphabet is clicked
    func tableAlphabetClicked(alpha : String, row : IndexPath)
    {
        //variable to declare the indexpath
        var mIndexpath : NSIndexPath?
        
        //variable to store the int value
        var mIndex2 : Int = 0
        
        //variable to iterate the array of objects
        var mx2 : Int = 0
        
        mFinalTabelData = mEngineerViewModelObj?.mSortedDataInVM
        
        //iterating the for loop
        for _ in mFinalTabelData!
        {
            //taking each object that is each employee record
            let obj = (mFinalTabelData?[mx2])! as EngineerDetails
            
            //in that model object fetching name of the employee
            let name = obj.mEngName
            
            //checking if the name starts with the character user clicked on
            if (name?.hasPrefix(alpha))!
            {
                //finding the index of the employee in the array, which is used to scroll to the particular position
                mIndex2 = (mFinalTabelData?.index(of: obj))!
                
                //converting the int value to the indexpath because the scrolltoItem method accepts the indexpath
                mIndexpath = IndexPath(item: mIndex2, section: 0) as NSIndexPath?
                
                break
            }//end of the if block
            mx2 += 1
        }//end of for loop
        
        //checking the condition if the array does not contain employee whose name starts with which user clicked
        if mx2 == (mFinalTabelData?.count)!
        {
            //return nothing
            return
        }//end of the if block
        else
        {
            //if found scroll to that particular position
            self.searchCollection.scrollToItem(at: mIndexpath as! IndexPath, at: .top, animated: true)
        }//end of the else block
        
    }//end of tableAlphabetClicked()
    
    
    //SearchBar Delegate Method
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        //variable used to search using searchbar
        let mData = [String]()
        
        //variable used to iterate the for loop
        var mx : Int = 0
        
        //hiding the tableview when performing the search operation
        self.searchTableView.isHidden = true
        
        //storing the data
        mFinalEmpData = mEngineerViewModelObj?.mSortedDataInVM
        
        //for loop to check which cell is visible in the view and if the indexpath of the cell is at the end then scroll to the top position
        for cell in self.searchCollection.visibleCells
        {
            //taking the indexpath of the visible cell
            let indexPath = self.searchCollection.indexPath(for: cell)
            let zero : Int = 0
            //converting the number zeor to the indexpath
            let numIndex = IndexPath(item: zero, section: 0) as IndexPath?
            //checking if the indexpath is equal to number zero, if yes do nothing, if no scroll to the top position
            if indexPath != numIndex
            {
                //scrolling to the top position
                self.searchCollection.scrollToItem(at: numIndex!, at: .top, animated: true)
                break
            }//end of the if block
        }//end of the for loop
        
        
        //iterating the for loop
        for _ in mFinalEmpData!
        {
            //fetching the object from the array of objects
            let obj = (mFinalEmpData?[mx])! as EngineerDetails
            //fetching the name from that onject
            let na = obj.mEngName
            let dat = na
            //incrementing the value to fetch the next employee name
            mx += 1
            //storing this name to a different array
            mFinalArr.append(dat!)
        }//end of for loop
    
        //filtering the names which has the text which user typed in search bar and storing it in the array
        mFinalArr = searchText.isEmpty ? mData : mFinalArr.filter({(dataString: String) -> Bool in
            
            // If dataItem matches the searchText, return true to include it
            return dataString.range(of: searchText, options: .caseInsensitive) != nil
        })
        
        //checking if the searchbar  doesn't contains the data or not
        if searchText.isEmpty == true
        {
            //if yes then show thw table view and set the final data array
            self.searchTableView.isHidden = false
            mFinalEmpData = mEngineerViewModelObj?.mSortedDataInVM
            searchCollection.reloadData()
        }//end of if loop
        else
        {
            //filter the fetched names from the array of objects, based on the array names we added
            let filteredByNameArray = mFinalEmpData?.filter
            {
                mFinalArr.contains($0.mEngName!)
            }//end of filter function
                //variable use to iterate the forloop
                var y : Int = 0
                var firstArray : [EngineerDetails] = []
                var secondArray : [EngineerDetails] = []
            
                for _ in filteredByNameArray!
                {
                    //fetching the object in array to group them in two different ways
                    // 1. which searches the particular object from the filtered array
                    let obj = (filteredByNameArray?[y])! as EngineerDetails
                    let name = obj.mEngName
                    //checking the condition to check it has prefix of wat searchbar contains
                    if (name?.hasPrefix(searchText))!
                    {
                        //if yes add to first array
                        firstArray.append(obj)
                        y += 1
                    }//end of if block
                    else
                    {
                        //if no add to the second array
                        secondArray.append(obj)
                        y += 1
                    }//end of else block
                }//end of for loop
            
                //adding that both arrays to the final array which is used to reload the collectionview
                mFinalEmpData = firstArray + secondArray
            
                //checking if the user entered the name which doesn't exist, if yes display the alertbox
                if mFinalEmpData?.count == 0
                {
                    //setting the alert view box
                    let alertView = UIAlertController.init(title: nil, message : "NO NAME FOUND", preferredStyle: UIAlertControllerStyle.alert)
                    
                    let action = UIAlertAction.init(title: "ok", style: .default)
                    {
                        UIAlertAction in
                        self.searchBar.text = ""
                        self.searchTableView.isHidden = false
                        self.mFinalEmpData = self.mEngineerViewModelObj?.mSortedDataInVM
                        self.searchCollection.reloadData()
                    }//end of alertview
                    
                    //adding the action to the box
                    alertView.addAction(action)
                    //presenting the alertbox
                    self.present(alertView, animated: true, completion :nil)
                
                }//end of if block
                searchCollection.reloadData()
            }//end of outer else condition
    }//end of the searchs textDidChange() function
}//end of the class


//collectionview datasource method, which displays the contents of the cell( employee details)
extension SearchViewController : UICollectionViewDataSource, UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mCollectionCell, for: indexPath) as! SearchCollViewCell
        
        let temp = mFinalEmpData?[indexPath.row]
        
        cell.EngineerName.text = temp?.mEngName
        cell.EngineerCompany.text = temp?.mEngCompany
        cell.EngineerEmail.text = temp?.mEngEmail
        cell.EngineerJob.text = temp?.mEngStatus
        cell.EngineerMobNo.text = temp?.mEngMobile
        
        //defining the collectionview cell properties
        cell.contentView.layer.cornerRadius = 8
        cell.layer.cornerRadius = 8
        cell.layer.shadowOpacity = 0.6
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 0.2)
        cell.layer.shadowRadius = 2.0
        cell.layer.masksToBounds = false
        
        return cell
    }//end of collection views cellForItemAt indexpath() method

    
    
    //to define the number of items in the sections of collectionview
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        //first time it ll execute hence setting it to nill, because the data is not yet received from the server
        if(mCount == 0)
        {
            return 0
        }//end of if block
        else
        {
            self.loader.stopAnimating()
            return (mFinalEmpData?.count)!
        }//end of else block
    }//end of the collection views numberOfItemsInSection() method

    
    //delegate function of collection view, executes when the collectioncell is selected
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let row = indexPath.row
        print(indexPath.row)
        
        let obj = mFinalEmpData?[row]
        mEid = obj?.mEngID
        print(mEid!)
        
        let destinationVC = NextViewController()
        destinationVC.id = mEid
        
        self.performSegue(withIdentifier: "gotoNextViewController", sender: self)
    }//end of collection views didSelectItemAt() mrthod
    
    
    //UIViewController method which is used to perform the segues and can send the data from one controller to the other 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "gotoNextViewController"
        {
            let slide = segue.destination as! NextViewController
            slide.id = mEid
        }//end of the if block
    }//end of the prepare() function
}//end of the extension class
