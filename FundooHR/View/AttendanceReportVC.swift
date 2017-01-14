//
//  AttendanceReportVC.swift
//  FundooHR
//
//  Created by BridgeLabz on 10/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit

class AttendanceReportVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource {
    
    
        @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var Attcount: UILabel!
    @IBOutlet weak var AttStatus: UILabel!
    @IBOutlet weak var selectAllBtn: UIButton!
    
    
    var flag : Bool = false
    var companies: [String] = ["BridgeLabz","GreyTip","Meru","Valuepitch","Craftsville","Nect Education","Finacus"]
    var companiesData : [String]!
 
    var names: [String] = ["Amith","Anand","Eshwar","Zakki","Vishwas","Bushan","Greshma","Hema","John","Jeeva","Kamal","Laxman","Ajith","Frenzy","Indhu","Manoj","Naveen","Divakar YN", "Chandra", "Darshan", "Dilip", "Diganth","Chethan", "Charan", "Ramesh", "Rakesh","Roopesh", "Rajesh", "Santhosh", "Sanjay","Sree Prasad", "Sunith", "Swamy", "Sugam","Pramodh", "Punith", "Pretham", "Pankaj"]
    var nameData: [String]!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        Attcount.layer.cornerRadius = 10
        Attcount.layer.masksToBounds = true
        companiesData = companies
        nameData = names
        // Do any additional setup after loading the view.
    }

    @IBAction func selectAllCheckBoxClicked(_ sender: Any) {
        flag = true
        selectAllBtn.imageView?.image = #imageLiteral(resourceName: "checked.png")
//selectAllCheckBoxClicked(selectAllBtn)
        collectionView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return companiesData.count
    }
    
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AttRepCollCell
        if flag {
            cell.lab.text = companiesData[indexPath.row]
            cell.collCellCheckBox.imageView?.image = #imageLiteral(resourceName: "checked.png")
            return cell
        }else{
        cell.lab.text = companiesData[indexPath.row]
        //cell.collCellCheckBox.imageView?.image = #imageLiteral(resourceName: "checked.png")
        return cell
        }
    }
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return names.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! AttTabCell
        cell.labInTabCel.text = "0 Leave"
        cell.labInTabCel?.textAlignment = .right
        cell.textLabel?.text = nameData[indexPath.row]
        //cell.textLabel?.textAlignment = .justified
        //cell.checkButton?.contentEdgeInsets.left
        cell.textLabel?.textColor = UIColor.darkGray
        cell.textLabel?.font = UIFont(name:"Avenir", size:12)
        cell.imageView?.image = #imageLiteral(resourceName: "unchecked.png")
        
        return cell
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
