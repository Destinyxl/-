//
//  XLTabBarController.swift
//  xiaohongshu
//
//  Created by 冯晓林 on 2018/8/4.
//  Copyright © 2018年 FXL. All rights reserved.
//

import UIKit

class XLTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildViewControllers()
        
    }
    
    /// 添加子控制器
    private func addChildViewControllers() {
        setChildViewController(XLMainController(), title: "首页", imageName: "help")
        setChildViewController(XLShopController(), title: "商城", imageName: "keyboard")
        setChildViewController(XLMessageController(), title: "消息", imageName: "mine")
        setChildViewController(XLMineController(), title: "我的", imageName: "mine")
    }
    
    /// 初始化子控制器
    private func setChildViewController(_ childController: UIViewController, title: String, imageName: String) {
        
        childController.tabBarItem.image = UIImage(named: "tabbar_" + imageName + "_normal")?.withRenderingMode(.alwaysOriginal)
        childController.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        childController.title = title
        // 添加导航控制器为 TabBarController 的子控制器
        addChildViewController(XLNavigationController(rootViewController: childController))
    }

}
