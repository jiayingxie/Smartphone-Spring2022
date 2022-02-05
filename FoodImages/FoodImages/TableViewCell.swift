//
//  TableViewCell.swift
//  FoodImages
//
//  Created by Jiaying Xie on 2/4/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblCell: UILabel!
    @IBOutlet weak var imgViewCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
