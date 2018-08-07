//
//  XLTabBarView.swift
//  xiaohongshu
//
//  Created by 冯晓林 on 2018/8/6.
//  Copyright © 2018年 FXL. All rights reserved.
//

import UIKit

protocol XLTabBarButtonClickDelegate: class {
    func XLTabBarButtonClick(tag: Int)
}

class XLTabBarView: UIView {
    
    var delegate: XLTabBarButtonClickDelegate?
    
    @IBOutlet weak var MainTabButton: UIButton!
    @IBOutlet weak var ShopTabButton: UIButton!
    @IBOutlet weak var CenterTabButton: UIButton!
    @IBOutlet weak var MessageTabButton: UIButton!
    @IBOutlet weak var MineTabButton: UIButton!
    

    static func loadNibView() -> XLTabBarView {
        return Bundle.main.loadNibNamed("XLTabBarView", owner: self, options: nil)?.first as! XLTabBarView
    }
    
    // MARK : tabbuttom's controll
    @IBAction func MainTabClick(_ sender: UIButton) {
        delegateFunc(button: sender)
    }
    @IBAction func ShopTabClick(_ sender: UIButton) {
        delegateFunc(button: sender)
    }
    @IBAction func CenterTabClick(_ sender: UIButton) {
        delegateFunc(button: sender)
    }
    @IBAction func MessageTabClick(_ sender: UIButton) {
        delegateFunc(button: sender)
    }
    @IBAction func MineTabClick(_ sender: UIButton) {
        delegateFunc(button: sender)
    }
    
    func delegateFunc(button: UIButton) {
        delegate?.XLTabBarButtonClick(tag: button.tag)
    }

}
