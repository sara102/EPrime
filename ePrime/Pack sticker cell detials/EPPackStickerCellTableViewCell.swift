//
//  EPPackStickerCellTableViewCell.swift
//  ePrime
//
//  Created by Sara Abdulraheem on 3/20/18.
//  Copyright © 2018 singleclic. All rights reserved.
//

import UIKit

class EPPackStickerCellTableViewCell: UITableViewCell {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var keyLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupCell(key:String,value:String)-> Void
    {
        self.keyLabel.text = key
        self.valueLabel.text = value
    }
}
