//
//  DashCollectionViewCell.swift
//  FundooHR
//
//  1. class for the dashboard collectionviewcell
//  2. contains the outlets of the property which is declared inside the cell
//
//  Created by BridgeLabz on 16/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class DashCollectionViewCell: UICollectionViewCell {
   
    //outlet for the dashboard content
    @IBOutlet weak var dashBoardHeading: UILabel!
    
    //outlet to display the date inside the cell
    @IBOutlet weak var dashBoardDate: UILabel!
    
    //outlet for the menu logo
    @IBOutlet weak var dashBoardLogo: UIImageView!
}
