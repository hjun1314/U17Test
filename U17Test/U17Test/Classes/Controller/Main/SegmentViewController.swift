//
//  SegmentViewController.swift
//  U17Test
//
//  Created by hjun on 2020/9/4.
//  Copyright © 2020 hjun. All rights reserved.
//

import UIKit
import HMSegmentedControl
enum SegmentStyle {
    case none
    case navgationBarSegment
    case topTabbar
}

class SegmentViewController: BaseViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = vcs.firstIndex(of: viewController) else {return nil}
        let beforeIndex = index - 1
        guard beforeIndex >= 0 else {
            return nil
        }
        return vcs[beforeIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = vcs.firstIndex(of: viewController) else { return nil }
               let afterIndex = index + 1
               guard afterIndex <= vcs.count - 1 else { return nil }
               return vcs[afterIndex]

    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let viewController = pageViewController.viewControllers?.last,
                let index = vcs.firstIndex(of: viewController) else {
                    return
            }
            currentSelectIndex = index
            segment.setSelectedSegmentIndex(UInt(index), animated: true)
            guard titles != nil && segmentStyle == Optional.none else { return }
            navigationItem.title = titles[index]
    }
    
    var segmentStyle : SegmentStyle!
    lazy var segment : HMSegmentedControl = {
        return HMSegmentedControl().then { $0.addTarget(self, action: #selector(changeIndex(segment:)), for: .valueChanged)
        
        }
    }()
    
    lazy var pageVc : UIPageViewController = {
        return UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }()
    
    private var vcs: [UIViewController]!
    private var titles:[String]!
    private var currentSelectIndex: Int = 0
    convenience init(titles: [String] = [],vcs : [UIViewController] = [],segmentStyle:SegmentStyle = .none){
        self.init()
        self.titles = titles
        self.vcs = vcs
        self.segmentStyle = segmentStyle
    }
    
    @objc func changeIndex(segment:UISegmentedControl) {
        let index = segment.selectedSegmentIndex
        if  currentSelectIndex != index {
            let target:[UIViewController] = [vcs[index]]
            let direction : UIPageViewController.NavigationDirection = currentSelectIndex > index ? .reverse : .forward
            pageVc.setViewControllers(target, direction: direction, animated: false) { (finish) in
                self.currentSelectIndex = index
            }
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func setupLayout() {
        guard let vcs = vcs else {return}
        addChild(pageVc)
        view.addSubview(pageVc.view)
        pageVc.delegate = self
        pageVc.dataSource = self
        pageVc.setViewControllers([vcs[0]], direction: .forward, animated: false, completion: nil)
    
        switch  segmentStyle {
        case .none?:
            pageVc.view.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
        case .navgationBarSegment?:
            segment.backgroundColor = .clear
            segment.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black,
                                           NSAttributedString.Key.font:UIFont.systemFont(ofSize: 18)]
            segment.selectedTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black,
            NSAttributedString.Key.font:UIFont.systemFont(ofSize: 28)]
            
            segment.selectionIndicatorLocation = .none
            segment.backgroundColor = .white
            view.addSubview(segment)
            segment.frame = CGRect(x: 0, y: 50, width: screenWidth, height: 40)
            pageVc.view.snp.makeConstraints { (make) in
                make.edges.equalToSuperview()
            }
            
        case .topTabbar:
            segment.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                           NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
            segment.selectedTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(r: 127, g: 221, b: 146),
                                                   NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
            segment.selectionIndicatorLocation = .bottom
            segment.selectionIndicatorColor = UIColor(r: 127, g: 221, b: 146)
            segment.selectionIndicatorHeight = 2
            segment.borderType = .bottom
            segment.borderColor = UIColor.lightGray
            segment.borderWidth = 0.5
            
            view.addSubview(segment)
            segment.snp.makeConstraints{
                $0.top.left.right.equalToSuperview()
                $0.height.equalTo(40)
            }
            
            pageVc.view.snp.makeConstraints{
                $0.top.equalTo(segment.snp.bottom)
                $0.left.right.bottom.equalToSuperview()
            }
            default: break

        }
        guard let titles = titles else {return}
        segment.sectionTitles = titles
        currentSelectIndex = 0
        segment.selectedSegmentIndex = UInt(currentSelectIndex)
    }

}
