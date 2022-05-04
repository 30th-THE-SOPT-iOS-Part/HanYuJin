//
//  StoryCollectionViewCell.swift
//  Instagram-Clone
//
//  Created by 한유진 on 2022/04/30.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    static let identifier = "StoryCollectionViewCell"
    
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setData(storyData:StoryDataModel){
        authorImageView.image = UIImage(named: storyData.authorImage)
        authorNameLabel.text = storyData.authorNameLabel
    }
}
