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
       
    var data = [String]()
   
    var alphabets: [String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    var filteredData: [String]!
    let CollectionCell = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = ["Amith","Anand","Eshwar","Zakki","Vishwas","Bushan","Greshma","Hema","John","Jeeva","Kamal","Laxman","Ajith","Frenzy","Indhu","Manoj","Naveen","Divakar YN", "Chandra", "Darshan", "Dilip", "Diganth","Chethan", "Charan", "Ramesh", "Rakesh","Roopesh", "Rajesh", "Santhosh", "Sanjay","Sree Prasad", "Sunith", "Swamy", "Sugam","Pramodh", "Punith", "Pretham", "Pankaj"]
        self.searchTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
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
        
        print(data.sorted(by: {$0 < $1}))
        filteredData = data.sorted(by: {$0 < $1})
        
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("count is #\(self.alphabets.count)")
        return self.alphabets.count;
        
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.searchTableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
       // cell.textLabel?.textColor = UIColor (colorLiteralRed: 149, green: 189, blue: 238, alpha: 0)
        
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
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SearchViewController : UICollectionViewDataSource
{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell, for: indexPath) as! SearchCollViewCell
        // cell.backgroundColor = UIColor(colorLiteralRed: 0.240, green: 0.234, blue: 0.237, alpha: 1.00)
        
        cell.EngineerName?.text = filteredData[indexPath.row]
        cell.contentView.layer.cornerRadius = 8
        cell.layer.cornerRadius = 8
        //cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.6
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 0.2)
        cell.layer.shadowRadius = 2.0
        cell.layer.masksToBounds = false
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return filteredData.count
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        
        filteredData = searchText.isEmpty ? data : data.filter({(dataString: String) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return dataString.range(of: searchText, options: .caseInsensitive) != nil
        })
        
        searchCollection.reloadData()
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

