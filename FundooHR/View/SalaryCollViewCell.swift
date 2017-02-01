//
//  SalaryCollViewCell.swift
//  FundooHR
//
//  1. salary collection view cell class
//  2. contains the outlets of the data which should be displayed inside the collectionview cell
//
//  Created by BridgeLabz on 26/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class SalaryCollViewCell: UICollectionViewCell {
   
    //outlet to checkbox button which is inside the cell
    @IBOutlet weak var cellCB: UIButton!
    
    //outlet to store the employee name in the label
    @IBOutlet weak var collLabel: UILabel!
    
    //outlet to store the employee status
    @IBOutlet weak var status: UILabel!
    
    //outlet to store the employee company
    @IBOutlet weak var company: UILabel!
}
