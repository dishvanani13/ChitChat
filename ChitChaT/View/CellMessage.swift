//
//  CellMessageControllerTableViewCell.swift
//  ChitChaT
//
//  Created by Disha Limbani on 2024-02-04.
//

import UIKit

class CellMessage: UITableViewCell {

    @IBOutlet weak var messageBubble: UIView!
    
    @IBOutlet weak var rightImgView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var leftImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
