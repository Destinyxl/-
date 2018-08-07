//
//  XLTabBarController.swift
//  xiaohongshu
//
//  Created by 冯晓林 on 2018/8/4.
//  Copyright © 2018年 FXL. All rights reserved.
//

import UIKit

class XLTabBarController: UITabBarController, XLTabBarButtonClickDelegate {
    
    func XLTabBarButtonClick(tag: Int) {
        guard tag != 100 else { return }
        self.selectedIndex = tag
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewControllers()

        setTabBar()
    }
    
    func setTabBar() {
        
        self.tabBar.isHidden = true
        
        let myTabView = XLTabBarView.loadNibView()
        myTabView.delegate = self
        myTabView.frame = CGRect(x: 0, y: self.view.bounds.height - XLTabBarHeight, width: self.view.bounds.width, height: XLTabBarHeight)
        self.view.addSubview(myTabView)
        
    }
    
    /// 添加子控制器
    private func addChildViewControllers() {
        setChildViewController(XLMainController(), title: "首页", imageName: "")
        setChildViewController(XLShopController(), title: "商城", imageName: "")
        setChildViewController(XLMessageController(), title: "消息", imageName: "")
        setChildViewController(XLMineController(), title: "我的", imageName: "")
    }
    
    /// 初始化子控制器
    private func setChildViewController(_ childController: UIViewController, title: String, imageName: String) {
        
        childController.navigationItem.title = title
        // 添加导航控制器为 TabBarController 的子控制器
        addChildViewController(XLNavigationController(rootViewController: childController))
    }

}
