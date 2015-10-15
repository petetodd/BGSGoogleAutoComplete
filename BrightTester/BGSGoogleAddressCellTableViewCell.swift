//
//  BGSGoogleAddressCellTableViewCell.swift
//  BrightTester
//
//  Created by Peter Todd Air on 15/10/2015.
//  Copyright © 2015 Bright Green Star. All rights reserved.
//

import UIKit

class BGSGoogleAddressCellTableViewCell: UITableViewCell {

    @IBOutlet weak var lblAddress: UILabel!
    var strGoogleID: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell()
    {
        
    }

}
