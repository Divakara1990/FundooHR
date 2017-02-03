//
//  AttRepCollCell.swift
//  FundooHR
//
//  1. class for collectionviewcell of attrepviewcontroller
//  2. contains the outlets used inside the cell
//
//  Created by BridgeLabz on 10/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit

class AttRepCollCell: UICollectionViewCell
{
    //outlet for the label holds the value of string type
    @IBOutlet weak var lab: UILabel!
    
    //outlet for the table used inside the collectionviewcell
    @IBOutlet weak var tableView: UITableView!
    
    //outlet for the button used inside the collectionviewcell
    @IBOutlet weak var collCellCheckBox: UIButton!
}
