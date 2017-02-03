//
//  InvoiceTableViewCell.swift
//  FundooHR
//
//  1. class for the tableviewcell which is used inside the collectionviewcell of invoiceviewcontroller
//  2. contains the outleta for the objects which is used
//
//  Created by BridgeLabz on 03/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit

class InvoiceTableViewCell: UITableViewCell
{
    //outlet for the label to display the name
    @IBOutlet weak var tabLabel: UILabel!
    
    //outlet of the label to store the leavecount
    @IBOutlet weak var leaveCount: UILabel!
    
    //outlet to the button to use as a checkbox
    @IBOutlet weak var tabCellCheckBox: UIButton!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}
