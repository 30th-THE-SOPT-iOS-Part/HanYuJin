//
//  FeedTableViewCell.swift
//  Instagram-Clone
//
//  Created by 한유진 on 2022/04/30.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    static let identifier = "FeedTableViewCell"
    
    @IBOutlet weak var likeDescription: UILabel!
    @IBOutlet weak var authorLabel1: UILabel!
    @IBOutlet weak var authorLabel2: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var commentDescription: UILabel!
    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var feedImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(_ feedData:FeedDataModel){
        feedImage.image = feedData.feedImage
        authorLabel1.text = feedData.author
        authorLabel2.text = feedData.author
        likeDescription.text = feedData.likeDescription
        commentDescription.text = feedData.commentDescription
        authorImage.image = feedData.authorImage
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
