//
//  homeVC.swift
//  U17Test
//
//  Created by hjun on 2020/9/1.
//  Copyright © 2020 hjun. All rights reserved.
//

import UIKit

class homeVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    lazy var bannerView : LLCycleScrollView = {
        let cycleScrollView = LLCycleScrollView()
        cycleScrollView.backgroundColor = UIColor.background
        cycleScrollView.autoScrollTimeInterval = 3
        cycleScrollView.placeHolderImage = UIImage(named: "normal_placeholder_h")
        cycleScrollView.coverImage = UIImage(named: "normal_placeholder_h")
        cycleScrollView.pageControlBottom = 20
        cycleScrollView.titleBackgroundColor = .clear
        cycleScrollView.pageControlPosition = .left
        cycleScrollView.customPageControlStyle = .image
        cycleScrollView.pageControlInActiveImage = UIImage(named: "finishobj")
        cycleScrollView.lldidSelectItemAtIndex = didSelectBanner(index:)
        return cycleScrollView
    }()
    
    lazy var collectionView : UICollectionView = {
        let layOut = UCollectionViewSectionBackgroundLayout()
        layOut.minimumLineSpacing = 10
        layOut.minimumInteritemSpacing = 5
        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layOut)
        collectionView.backgroundColor = .white
        collectionView.alwaysBounceVertical = true
        collectionView.contentInset = UIEdgeInsets(top: screenHeight / 2, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = collectionView.contentInset
        return collectionView
    }()
    
    private func didSelectBanner(index: NSInteger) {
        print("轮播图被点击了...")

    }
    
    override func setupLayout() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        view.addSubview(bannerView)
        bannerView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(collectionView.contentInset.top)
        }
    }

}
