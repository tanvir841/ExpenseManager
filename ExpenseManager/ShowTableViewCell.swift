//
//  ShowTableViewCell.swift
//  ExpenseManager
//
//  Created by Tanvir on 12/29/19.
//  Copyright © 2019 tanvir841. All rights reserved.
//

import UIKit

class ShowTableViewCell: UITableViewCell {

    @IBOutlet weak var describe: UILabel!
    @IBOutlet weak var amount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
