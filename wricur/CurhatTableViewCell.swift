//
//  CurhatTableViewCell.swift
//  wricur
//
//  Created by user on 11/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//

import UIKit

class CurhatTableViewCell: UITableViewCell {
    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var subtitleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
