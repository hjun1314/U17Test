//
//  Global.swift
//  U17Test
//
//  Created by hjun on 2020/9/1.
//  Copyright © 2020 hjun. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import SnapKit
import MJRefresh

//MARK: 应用默认颜色
extension UIColor {
    class var background: UIColor {
        return UIColor(r: 242, g: 242, b: 242)

    }
    
    class var theme: UIColor {
           return UIColor(r: 27, g: 221, b: 142)

       }
}

extension String {
    static let searchHistoryKey = "searchHistoryKey"
    static let sexTypeKey = "sexTypeKey"
    
}
extension NSNotification.Name {
    static let USexTypeDidChange = NSNotification.Name("USexTypeDidChange")

}

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

var isIphoneX :Bool {
    let screenHeight = UIScreen.main.nativeBounds.size.height
    if  screenHeight == 2436 || screenHeight == 1792 || screenHeight == 2688 || screenHeight == 1624 {
        return true
    }
    return false
}

var topVC : UIViewController? {
    var resultVC: UIViewController?
    
    return resultVC
}
