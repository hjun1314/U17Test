//
//  BaseViewController.swift
//  U17Test
//
//  Created by hjun on 2020/9/1.
//  Copyright © 2020 hjun. All rights reserved.
//

import UIKit
import SnapKit
import Then
import Reusable
import Kingfisher
class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.background
        setupLayout()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configNavBar()
    }
    
    func setupLayout() {}

    
    func configNavBar()  {
        guard let navi = navigationController else {
            return
        }
        if  navi.visibleViewController == self {
            navi.barStyle(.theme)
            navi.disablePopGesture = false
            navi.setNavigationBarHidden(false, animated: true)
            if navi.viewControllers.count > 1 {
                navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backGreen"), target: self, action: #selector(pressBack))
            }
        }
    }
    @objc func pressBack() {
        navigationController?.popViewController(animated: true)
    }
    
}
extension BaseViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}

