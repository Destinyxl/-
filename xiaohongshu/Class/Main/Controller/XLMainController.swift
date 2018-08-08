//
//  XLMainController.swift
//  xiaohongshu
//
//  Created by 冯晓林 on 2018/8/4.
//  Copyright © 2018年 FXL. All rights reserved.
//

import UIKit

class XLMainController: UIViewController, SGPageTitleViewDelegate, SGPageContentScrollViewDelegate {
    
    var naviBottomLine: UIImageView?
    
    var titleView: SGPageTitleView?
    var contentView: SGPageContentScrollView?
    
    let titles = ["关注", "发现", "附近"]
    
    // MARK : life circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .gray

        getNavibottomImageLine()
        
        creatViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        naviBottomLine?.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        naviBottomLine?.isHidden = false
    }
    
    func creatViews() {
        
        let leftItemButton = UIButton(frame: CGRect(x: 0, y: 0, width: 15, height: 12))
        leftItemButton.setBackgroundImage(UIImage(named: "icon_hamburger_25"), for: .normal)
        leftItemButton.addTarget(self, action:  #selector(self.leftBarItem), for: .touchUpInside)
        let leftItem = UIBarButtonItem(customView: leftItemButton)
        self.navigationItem.leftBarButtonItem = leftItem
        
        view.addSubview(searchView)
        
        let config = SGPageTitleViewConfigure()
        config.showBottomSeparator = false
        config.titleAdditionalWidth = 1
        config.titleColor = UIColor.myGray
        config.titleSelectedColor = UIColor.black
        
        titleView = SGPageTitleView(frame: CGRect(x: 0, y: 0, width: 200, height: 30), delegate: self, titleNames: titles, configure: config)
        self.navigationItem.titleView = titleView
        
        let childVC = [XLFocusController(), XLDiscoverController(), XLNearController()]
        
        contentView = SGPageContentScrollView(frame: CGRect(x: 0, y: searchView.frame.maxY, width: self.view.width, height: self.view.height - searchView.frame.maxY - XLTabBarHeight), parentVC: self, childVCs: childVC)
        contentView?.delegatePageContentScrollView = self
        self.view.addSubview(contentView!)
        
    }
    
    func getNavibottomImageLine() {
        
        for tview in self.navigationController!.navigationBar.subviews {
            if NSStringFromClass(type(of: tview)) == "_UIBarBackground" {
                for sub in tview.subviews {
                    if sub .isKind(of: UIImageView.self) {
                        naviBottomLine = sub as? UIImageView
                    }
                }
            }
        }
    }
    
    @objc func leftBarItem() {
        
    }
    
    lazy var searchView: XLMainSearchView = {
        let topView = XLMainSearchView(frame: CGRect(x: 0, y: -1, width: self.view.width, height: 50))
        topView.backgroundColor = UIColor.white
        return topView
    }()

}

extension XLMainController {
    func pageTitleView(_ pageTitleView: SGPageTitleView!, selectedIndex: Int) {
        contentView?.setPageContentScrollViewCurrentIndex(selectedIndex)
    }
    
    func pageContentScrollView(_ pageContentScrollView: SGPageContentScrollView!, progress: CGFloat, originalIndex: Int, targetIndex: Int) {
        titleView?.setPageTitleViewWithProgress(progress, originalIndex: originalIndex, targetIndex: targetIndex)
    }
}
