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
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var commentDescription: UIButton!
    @IBOutlet weak var likeDescription: UIButton!
    @IBOutlet weak var bookMarkButton: UIButton!
    @IBOutlet weak var dmButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    // MARK: - Feed Data Model 연결
    func setData(_ feedData:FeedDataModel){
        feedImage.image = .load(named: feedData.feedImageName)
        authorImage.setImage(feedData.authorImage, for: .normal)
        authorLabel1.setTitle(feedData.author, for: .normal)
        commentDescription.setTitle(feedData.commentDescription, for: .normal)
        content.attributedText = attributeString(profileName: feedData.feedImageName, content: feedData.content)
        likeDescription.setTitle(feedData.likeDescription, for: .normal)
    }
    // MARK: - IBAction
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func likeButtonClicked(_ sender: UIButton) {
        let imageName = sender.currentImage ==  UIImage(named:"icn_unlike") ? "icn_like" : "icn_unlike"
        sender.setImage(UIImage(named: imageName), for: .normal)
    }
}
extension FeedTableViewCell {
    
    func attributeString(profileName : String, content : String) -> NSAttributedString {
        
        let profileNameFont = UIFont.systemFont(ofSize: 12, weight: .semibold)
        let profileNameAttr: [NSMutableAttributedString.Key: Any] = [
            .font: profileNameFont,
        ]
        
        let contentFont = UIFont.systemFont(ofSize: 10, weight: .medium)
        let contentFontAttr: [NSMutableAttributedString.Key: Any] = [
            .font: contentFont,
        ]
        let profileNameAttributedString = NSMutableAttributedString(string: "\(profileName) ", attributes: profileNameAttr)
        
        let contentAttributedString = NSMutableAttributedString(string: "\(content) ", attributes: contentFontAttr)
        
        profileNameAttributedString.append(contentAttributedString)
        
        return profileNameAttributedString
    }
}
