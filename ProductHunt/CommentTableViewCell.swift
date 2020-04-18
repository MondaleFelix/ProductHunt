//
//  CommentTableViewCell.swift
//  ProductHunt
//
//  Created by Mondale on 4/17/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    
    @IBOutlet weak var commentTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
