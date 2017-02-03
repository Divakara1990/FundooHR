//
//  SlideMenuTableViewCell.swift
//  FundooHR
//
//  1. SlideMenu's tableview cell
//  2. label is used inside the tableviewcell to hold the value
//
//  Created by BridgeLabz on 16/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class SlideMenuTableViewCell: UITableViewCell
{
    //label to display the content
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }//end of the awakeFromNib() function

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }//end of the setSelected() function
}//end of the class
