//
//  SearchViewController.swift
//  FundooHR
//
//  Created by BridgeLabz on 12/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate
{
    @IBOutlet weak var searchCollection: UICollectionView!
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var slideMenu: UIButton!
    
    var data = [String]()
    var arrayData = [EngineerDetails]()
    
    var finalEmpData:[EngineerDetails]?
    
    var EngineerViewModelObj : EngineerDetailsViewModel?
    var alphabets: [String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    var filteredData: [String]!
    let CollectionCell = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EngineerViewModelObj = EngineerDetailsViewModel()
        EngineerViewModelObj?.sVCObj = self
        EngineerViewModelObj?.callFromViewModelToController()
        self.finalEmpData = EngineerViewModelObj?.sortedArray

//        data = ["Amith","Anand","Eshwar","Zakki","Vishwas","Bushan","Greshma","Hema","John","Jeeva","Kamal","Laxman","Ajith","Frenzy","Indhu","Manoj","Naveen","Divakar YN", "Chandra", "Darshan", "Dilip", "Diganth","Chethan", "Charan", "Ramesh", "Rakesh","Roopesh", "Rajesh", "Santhosh", "Sanjay","Sree Prasad", "Sunith", "Swamy", "Sugam","Pramodh", "Punith", "Pretham", "Pankaj"]
        self.searchTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        //gives the seperate view, SlideBar.
        slideMenu.addTarget(self.revealViewController(), action:
            #selector(SWRevealViewController.revealToggle(_:)),
                              for: .touchUpInside)
        
        self.searchCollection.dataSource = self
        self.searchTableView.dataSource = self
        self.searchTableView.delegate = self
        self.searchBar.delegate = self
        self.searchBar.layer.borderColor = UIColor.black.cgColor
        self.searchBar.layer.borderWidth = 1
        self.searchBar.layer.cornerRadius = 20.0
        self.searchBar.clipsToBounds = true
        searchCollection.dataSource = self
        searchBar.delegate = self
        
        //print(data.sorted(by: {$0 < $1}))
        //filteredData = data.sorted(by: {$0 < $1})
        // Do any additional setup after loading the view.
    }
    
    func reloadFinalData()
    {
        self.searchCollection.reloadData()
        finalEmpData = EngineerViewModelObj?.sortedArray
        print(finalEmpData!)
    }
    
    func printFetchedData()
    {
    let sortedArray = arrayData.sorted{ $0.engName! < $1.engName! }
    print("Sorted Array is \(sortedArray)")
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.alphabets.count;
        
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.searchTableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = self.alphabets[indexPath.row]
       // cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.textColor = UIColor.darkGray;
        
        cell.textLabel?.font = UIFont(name:"Avenir", size:12)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        var txt : String?
        txt = (alphabets[indexPath.row])
         print(txt!)
        let numberOfSections = self.searchTableView.numberOfSections
        let numberOfRows = self.searchTableView.numberOfRows(inSection: numberOfSections-1)
        let Cell = tableView.cellForRow(at: indexPath)
            Cell?.textLabel?.textColor = UIColor.blue
//        searchCollection.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
        
        let indexPath = IndexPath(row: numberOfRows-1 , section: numberOfSections-1)
        self.searchTableView.scrollToRow(at: indexPath, at: UITableViewScrollPosition.middle, animated: true)
        //invoke the searchBar method
        searchBar(searchBar, textDidChange: txt!)
        searchCollection.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    
    let deselectedCell = tableView.cellForRow(at: indexPath as IndexPath)!
    deselectedCell.textLabel?.textColor = UIColor.black
    
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var finalArr = [String]()
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        
        var x : Int = 0
        for _ in finalEmpData!{
        let obj = (finalEmpData?[x])! as EngineerDetails
        let na = obj.engName
        print(na!)
            let dat = na
            x += 1
            self.finalArr.append(dat!)
        }
        print("fetched Names From array is \(finalArr)")
    
        finalArr = searchText.isEmpty ? data : finalArr.filter({(dataString: String) -> Bool in
            // If dataItem matches the searchText, return true to include it
            
            return dataString.range(of: searchText, options: .caseInsensitive) != nil
        })
        
        let filteredByNameArray = finalEmpData?.filter {
            finalArr.contains($0.engName!)
        }
        //finalEmpData = []
        finalEmpData = filteredByNameArray
        searchCollection.reloadData()
        //        print("filteredByNameArray123456 is as follows \(filteredByNameArray)")
//        let obj1 : [EngineerDetails] = filteredByNameArray!
//        print("objects is\(obj1)")
//        print("fetched Names after searching is \(finalArr)")
//        
//        var y : Int = 0
//        for _ in finalArr{
//            let str = (finalArr[y]) as String
//                let z : Int = 0
//            for _ in finalArr{
//                    if str == ((finalEmpData?[z])! as EngineerDetails).engName{
//                        print("NAme Exists\(str)")
//                        searchCollection.reloadData()
//                    }
//            }
//            y += 1
//        }
               // searchCollection.reloadData()
    }
}


extension SearchViewController : UICollectionViewDataSource
{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell, for: indexPath) as! SearchCollViewCell
        //let temp = EngineerViewModelObj?.sortedArray[indexPath.row]
        let temp = finalEmpData?[indexPath.row]
        cell.EngineerName.text = temp?.engName
        cell.EngineerCompany.text = temp?.engCompany
        cell.EngineerEmail.text = temp?.engEmail
        cell.EngineerJob.text = temp?.engJob
        cell.EngineerMobNo.text = temp?.engMobile
        
        cell.contentView.layer.cornerRadius = 8
        cell.layer.cornerRadius = 8
        cell.layer.shadowOpacity = 0.6
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 0.2)
        cell.layer.shadowRadius = 2.0
        cell.layer.masksToBounds = false
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        //return (EngineerViewModelObj?.sortedArray.count)!
        return (finalEmpData?.count)!
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

