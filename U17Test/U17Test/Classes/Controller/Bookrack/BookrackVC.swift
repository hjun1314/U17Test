//
//  BookrackVC.swift
//  U17Test
//
//  Created by hjun on 2020/9/1.
//  Copyright © 2020 hjun. All rights reserved.
//

import UIKit

class BookrackVC: SegmentViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .default
    }
    override func configNavBar() {
        super.configNavBar()
        navigationController?.navigationBar.isHidden = true
        navigationController?.barStyle(.clear)
        
    }

    

}
