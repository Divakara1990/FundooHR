//
//  AttTabCell.swift
//  FundooHR
//
//  1. class for the tableviewcell which is used inside the collectionviewcell of attrepViewcontroller
//  2. contains the outlets of the tableviewcell
//
//  Created by BridgeLabz on 10/01/17.
//  Copyright © 2017 BridgeLabz. All rights reserved.
//

import UIKit

class AttTabCell: UITableViewCell {

    //outlet to hold the leave count
    @IBOutlet weak var leaveCount: UILabel!
    
    //outlet used to perform the checkbox operation iside the tableviewcell
    @IBOutlet weak var tabCheckBox: UIButton!
    
    //outlet to display the content inside the tableview
    @IBOutlet weak var contentLabel: UILabel!
    
    //outlet to display the data inside the label
    @IBOutlet weak var labInTabCel: UILabel!
    
       override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
