//
//  InvoiceCollViewCell.swift
//  FundooHR
//
//  1. class for the uicollectionviewcell which is used inside the invoiceview controller
//
//  Created by BridgeLabz on 03/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit

class InvoiceCollViewCell: UICollectionViewCell {
    
    //outlet for the label used inside the cell
    @IBOutlet weak var invoiceCollLabel: UILabel!
    
    //outlet for tableview which is inside the collectionviewcell
    @IBOutlet weak var tableView: UITableView!
    
    //outlet for the checkbox button
    @IBOutlet weak var collCheckBox: UIButton!
    
}
