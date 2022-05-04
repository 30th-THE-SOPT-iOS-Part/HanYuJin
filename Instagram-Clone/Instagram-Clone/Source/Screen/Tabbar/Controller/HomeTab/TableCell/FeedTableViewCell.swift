//
//  FeedTableViewCell.swift
//  Instagram-Clone
//
//  Created by 한유진 on 2022/04/30.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    static let identifier = "FeedTableViewCell"
    
    @IBOutlet weak var authorImage: UIButton!
    @IBOutlet weak var authorLabel1: UIButton!
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var commentDescription: UIButton!
    @IBOutlet weak var content: UIButton!
    @IBOutlet weak var authorLabel2: UIButton!
    @IBOutlet weak var likeDescription: UIButton!
    @IBOutlet weak var bookMarkButton: UIButton!
    @IBOutlet weak var dmButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setData(_ feedData:FeedDataModel){
        feedImage.image = feedData.feedImage
        authorImage.setImage(feedData.authorImage, for: .normal)
        content.setTitle(feedData.content, for: .normal)
        authorLabel1.setTitle(feedData.author, for: .normal)
        authorLabel2.setTitle(feedData.author, for: .normal)
        commentDescription.setTitle(feedData.commentDescription, for: .normal)
        likeDescription.setTitle(feedData.likeDescription, for: .normal)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func likeButtonClicked(_ sender: UIButton) {
        print(sender.currentImage ?? "no")
        let imageName = sender.currentImage ==  UIImage(named:"icn_unlike") ? "icn_like" : "icn_unlike"
        sender.setImage(UIImage(named: imageName), for: .normal)
    }
    
}
