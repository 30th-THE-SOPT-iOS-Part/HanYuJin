//
//  HomeTabViewController.swift
//  Instagram-Clone
//
//  Created by 한유진 on 2022/04/18.
//

import UIKit

class HomeTabViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    // MARK:- Views
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        let collectionViewNib = UINib(nibName: StoryCollectionViewCell.identifier, bundle: nil)

        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(collectionViewNib, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
        collectionView.frame = CGRect(x: 0, y: 0, width:  UIScreen.main.bounds.width, height: 8 + 72 + 8)
        return collectionView
    }()
    
    // MARK:- LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()

        let tableViewNib = UINib(nibName: FeedTableViewCell.identifier, bundle: nil)
        tableView.register(tableViewNib, forCellReuseIdentifier: FeedTableViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = collectionView
//        tableView.addSubview(collectionView)
    }

}
// MARK:- TableView Delegate
extension HomeTabViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
}
extension HomeTabViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier, for: indexPath) as? FeedTableViewCell else { return UITableViewCell() }
        cell.setData(FeedDataModel.sampleData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FeedDataModel.sampleData.count
    }
}

// MARK:- CollectionView Delegate
extension HomeTabViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StoryDataModel.sampleData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as? StoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setData(storyData: StoryDataModel.sampleData[indexPath.row])
        return cell
    }
}
extension HomeTabViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 58, height: 72)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section:Int) ->UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 6, bottom: 8, right: 6)
        //전체 콜렉션뷰와 그 위아래좌우간격
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}
