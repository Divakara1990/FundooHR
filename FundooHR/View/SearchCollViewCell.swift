//
//  SearchCollViewCell.swift
//  FundooHR
//
//  1. created the outlets of the collectionviewcell of searchviewcontroller
//
//  Created by BridgeLabz on 16/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class SearchCollViewCell: UICollectionViewCell
{
    //outlet for the image inside the collectionviewcell
    @IBOutlet weak var EngineerImage: UIImageView!
    
    //outlet for name
    @IBOutlet weak var EngineerName: UILabel!
    
    //outlet for type of a job
    @IBOutlet weak var EngineerJob: UILabel!
    
    //outlet for employee email
    @IBOutlet weak var EngineerEmail: UILabel!
    
    //outlet for employee contact number
    @IBOutlet weak var EngineerMobNo: UILabel!
    
    //outlet for company
    @IBOutlet weak var EngineerCompany: UILabel!
    
}//end of the class
