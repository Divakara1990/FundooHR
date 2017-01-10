//
//  InvoiceCollViewCell.swift
//  FundooHR
//
//  Created by BridgeLabz on 03/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit

class InvoiceCollViewCell: UICollectionViewCell {
    
    @IBOutlet weak var invoiceCollLabel: UILabel!
    
    @IBOutlet weak var tableViewInColl: UITableView!
    
    
    var names: [String] = ["Amith","Anand","Eshwar","Zakki","Vishwas","Bushan","Greshma"]
    var nameData: [String]!


    
}

extension InvoiceCollViewCell : UITableViewDelegate, UITableViewDataSource
{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("count is #\(self.names.count)")
        return self.names.count;
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableViewInColl.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
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
        let numberOfSections = self.tableViewInColl.numberOfSections
        let numberOfRows = self.tableViewInColl.numberOfRows(inSection: numberOfSections-1)
        
        //        searchCollection.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
        
        let indexPath = IndexPath(row: numberOfRows-1 , section: numberOfSections-1)
        self.tableViewInColl.scrollToRow(at: indexPath, at: UITableViewScrollPosition.middle, animated: true)
        //invoke the searchBar method
        
        tableViewInColl.reloadData()
    }

    
}
