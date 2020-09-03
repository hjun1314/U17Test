//
//  TabbarController.swift
//  U17Test
//
//  Created by hjun on 2020/9/1.
//  Copyright © 2020 hjun. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
         setupAddChildVC()
        selectedIndex = 1
    }
    
    func setupAddChildVC() {
        //社区
        let communityVc = CommunityVC()
        addChildController(childController: communityVc, title: "社区", image: UIImage(named: "tab_today"), selectImage: UIImage(named: "tab_today_selected"))
        
        let homeVc = homeVC()
        addChildController(childController: homeVc, title: "发现", image: UIImage(named: "tab_find"), selectImage: UIImage(named: "tab_find_selected"))

        let bookSegmentVc = BookrackVC()
        addChildController(childController: bookSegmentVc, title: "书架", image: UIImage(named: "tab_book"), selectImage: UIImage(named: "tab_book_selected"))

        let mineVc = mineVC()
        addChildController(childController: mineVc, title: "我的", image: UIImage(named: "tab_mine"), selectImage: UIImage(named: "tab_mine_selected"))

        
        
    }
    func addChildController(childController : UIViewController , title :String? ,image :UIImage?,selectImage :UIImage?)  {
        childController.title = title
        childController.tabBarItem = UITabBarItem(title: nil, image: image?.withRenderingMode(.alwaysOriginal), selectedImage: selectImage?.withRenderingMode(.alwaysOriginal))
        if UIDevice.current.userInterfaceIdiom == .phone {
            childController.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
        addChild(NavViewController(rootViewController: childController))
    }
    
}
extension TabbarController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let select = selectedViewController else {
            return .lightContent
        }
        return select.preferredStatusBarStyle
    }
}
