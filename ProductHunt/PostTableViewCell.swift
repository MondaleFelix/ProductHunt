//
//  PostTableViewCell.swift
//  ProductHunt
//
//  Created by Mondale on 4/17/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {


    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentsCountLabel: UILabel!
    
    @IBOutlet weak var votesCountLabel: UILabel!
    
    var post: Post? {
       // Runs every time the post variable is set
       didSet {
          // make sure we return if post doesn't exist
          guard let post = post else { return }
          // Assign our UI elements to their post counterparts
          nameLabel.text = post.name
          taglineLabel.text = post.tagline
          commentsCountLabel.text = "Comments: \(post.commentsCount)"
          votesCountLabel.text = "Votes: \(post.votesCount)"
          // We'll write this next!
          updatePreviewImage()
       }
    }
    
    func updatePreviewImage() {
       // make sure we return if post doesn't exist
       guard let post = post else { return }
       // assign the placeholder image to the UI element
       previewImageView.image = UIImage(named: "placeholder")
    }
}
