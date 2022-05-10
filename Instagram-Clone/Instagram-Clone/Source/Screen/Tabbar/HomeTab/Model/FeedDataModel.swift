//
//  FeedDataModel.swift
//  Instagram-Clone
//
//  Created by 한유진 on 2022/05/03.
//

import UIKit

struct FeedDataModel {
    let authorImageName:String
    var authorImage : UIImage? {
        return UIImage(named:authorImageName)
    }
    let feedImageName :String
    var feedImage:UIImage? {
        return UIImage(named: feedImageName)
    }
    let likes : Int
    var likeDescription : String? {
        return "좋아요 \(likes)개"
    }
    let author : String
    let content : String
    let comment : Int
    var commentDescription: String?{
        return "댓글 \(comment)개 모두 보기"
    }
}
extension FeedDataModel{
    static let sampleData : [FeedDataModel] = [
        FeedDataModel(authorImageName: "avatar1", feedImageName: "postImage1", likes: 10, author: "avatar1", content: "기회는 일어나는 것이 아니라 만들어내는 것이다.", comment: 19),
        FeedDataModel(authorImageName: "avatar2", feedImageName: "postImage2", likes: 11, author: "avatar2", content: "기회는 일어나는 것이 아니라 만들어내는 것이다.", comment: 11),
        FeedDataModel(authorImageName: "avatar3", feedImageName: "postImage3", likes: 30, author: "avatar1", content: "기회는 일어나는 것이 아니라 만들어내는 것이다.", comment: 39),
        FeedDataModel(authorImageName: "avatar4", feedImageName: "postImage4", likes: 40, author: "avatar1", content: "기회는 일어나는 것이 아니라 만들어내는 것이다.", comment: 49),
        FeedDataModel(authorImageName: "avatar5", feedImageName: "postImage5", likes: 50, author: "avatar1", content: "기회는 일어나는 것이 아니라 만들어내는 것이다.", comment: 59),
        FeedDataModel(authorImageName: "avatar6", feedImageName: "postImage6", likes: 60, author: "avatar1", content: "기회는 일어나는 것이 아니라 만들어내는 것이다.", comment: 69),
        FeedDataModel(authorImageName: "avatar1", feedImageName: "postImage1", likes: 10, author: "avatar1", content: "기회는 일어나는 것이 아니라 만들어내는 것이다.", comment: 19),
        FeedDataModel(authorImageName: "avatar2", feedImageName: "postImage2", likes: 11, author: "avatar2", content: "기회는 일어나는 것이 아니라 만들어내는 것이다.", comment: 11),
        FeedDataModel(authorImageName: "avatar3", feedImageName: "postImage3", likes: 30, author: "avatar1", content: "기회는 일어나는 것이 아니라 만들어내는 것이다.", comment: 39),
        FeedDataModel(authorImageName: "avatar4", feedImageName: "postImage4", likes: 40, author: "avatar1", content: "기회는 일어나는 것이 아니라 만들어내는 것이다.", comment: 49),
        FeedDataModel(authorImageName: "avatar5", feedImageName: "postImage5", likes: 50, author: "avatar1", content: "기회는 일어나는 것이 아니라 만들어내는 것이다.", comment: 59),
        FeedDataModel(authorImageName: "avatar6", feedImageName: "postImage6", likes: 60, author: "avatar1", content: "기회는 일어나는 것이 아니라 만들어내는 것이다.", comment: 69)
    ]
}
