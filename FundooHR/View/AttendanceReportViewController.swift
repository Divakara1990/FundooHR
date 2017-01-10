//
//  AttendanceReportViewController.swift
//  FundooHR
//
//  Created by BridgeLabz on 27/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class AttendanceReportViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var attendanceTableView: UITableView?
    @IBOutlet weak var attendanceCollView: UICollectionView!
    
   var companies: [String] = ["BridgeLabz","GreyTip","Meru","Valuepitch","Craftsville","Nect Education","Finacus"]
    
    var companiesData : [String]!
    
    var companiesFieldName : String? = nil
    
    var names: [String] = ["Amith","Anand","Eshwar","Zakki","Vishwas","Bushan","Greshma","Hema","John","Jeeva","Kamal","Laxman","Ajith","Frenzy","Indhu","Manoj","Naveen","Divakar YN", "Chandra", "Darshan", "Dilip", "Diganth","Chethan", "Charan", "Ramesh", "Rakesh","Roopesh", "Rajesh", "Santhosh", "Sanjay","Sree Prasad", "Sunith", "Swamy", "Sugam","Pramodh", "Punith", "Pretham", "Pankaj"]
    var nameData: [String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.attendanceCollView.delegate = self
        self.attendanceCollView.dataSource = self
//        self.attendanceTableView.dataSource = self
//        self.attendanceTableView.delegate = self
        
        // Do any additional setup after loading the view.
        companiesData = companies
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("count is #\(self.names.count)")
        return self.names.count;
        
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.attendanceTableView!.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = self.names[indexPath.row]
        // cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.textColor = UIColor.darkGray;
        
        cell.textLabel?.font = UIFont(name:"Avenir", size:12)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        var txt : String?
        txt = (names[indexPath.row])
        print(txt!)
        let numberOfSections = self.attendanceTableView?.numberOfSections
        let numberOfRows = self.attendanceTableView?.numberOfRows(inSection: numberOfSections!-1)
        
        //        searchCollection.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
        
        let indexPath = IndexPath(row: numberOfRows!-1 , section: numberOfSections!-1)
        self.attendanceTableView?.scrollToRow(at: indexPath, at: UITableViewScrollPosition.middle, animated: true)
        //invoke the searchBar method
        
        attendanceCollView.reloadData()
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

extension AttendanceReportViewController : UICollectionViewDataSource, UICollectionViewDelegate
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return companiesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "attendance cell", for: indexPath) as! AttendanceCollViewCell
        
        cell.collLabel?.text = companiesData[indexPath.row]
        cell.contentView.layer.cornerRadius = 0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.cyan.cgColor
        cell.contentView.backgroundColor = UIColor.white
        cell.layer.shadowOpacity = 0.6
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 0.2)
        cell.layer.shadowRadius = 2.0
        cell.layer.masksToBounds = false
        return cell
    }
    

}

