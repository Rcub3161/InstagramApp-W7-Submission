//
//  PostsTableViewCell.swift
//  InstagramApp
//
//  Created by Ryan Linehan on 3/5/16.
//  Copyright © 2016 Ryan Linehan. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostsTableViewCell: UITableViewCell {

    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postedImageView: PFImageView!

    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
