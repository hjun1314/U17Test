//
//  mineVC.swift
//  U17Test
//
//  Created by hjun on 2020/9/1.
//  Copyright © 2020 hjun. All rights reserved.
//

import UIKit

class mineVC: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = .top
    }
    
   override func setupLayout() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.edges.equalTo(self.view.snp.edges).priority(.low)
        }
        collectionView.register(mineCell.self, forCellWithReuseIdentifier: "cellid")
        collectionView.parallaxHeader.view = head
        collectionView.parallaxHeader.height = headHeight
        collectionView.parallaxHeader.minimumHeight = navigarionHeight
        collectionView.parallaxHeader.mode = .fill
    }
    
    override func configNavBar() {
        super.configNavBar()
        navigationController?.barStyle(.clear)
        collectionView.contentOffset = CGPoint(x: 0, y: -collectionView.parallaxHeader.height)
    }
    
    //MARK: ----collectionviewDelegate&DataSource------
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath) as! mineCell
        cell.dict = titleArr[indexPath.item]
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = floor(Double(screenWidth - 40.0) / 3.0)
        return CGSize(width: width, height: (width * 0.75 + 30))
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
          if scrollView.contentOffset.y >= -(scrollView.parallaxHeader.minimumHeight) {
              navigationController?.barStyle(.theme)
              navigationItem.title = "我的"
          } else {
              navigationController?.barStyle(.clear)
              navigationItem.title = ""
          }
      }
    
    
    private let headHeight: CGFloat = 300
    lazy var titleArr : Array = {
        return [["icon":"sep_register", "title": "签到"],
                      ["icon":"sep_mywallet", "title": "钱包"],
                      ["icon":"sep_subscription", "title": "订阅"],
                      ["icon":"sep_fengyintu", "title": "封印图"],
                      ["icon":"sep_theme", "title": "皮肤"],
                      ["icon":"myvotebiao", "title": "我的投票"],
                      ["icon":"sep_help", "title": "帮助反馈"],
                      ["icon":"sep_beijing", "title": "首都网警"],
                      ["icon":"sep_auther", "title": "作者中心"],
                      ["icon":"sep_setting", "title": "设置"]]
    }()
    
    lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    lazy var head : mineHeadView = {
       return mineHeadView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: headHeight))
    }()
    lazy var navigarionHeight : CGFloat = {
        return navigationController?.navigationBar.frame.maxY ?? 0
    }()
    
}
