//
//  XLMainSearchView.swift
//  xiaohongshu
//
//  Created by 冯晓林 on 2018/8/7.
//  Copyright © 2018年 FXL. All rights reserved.
//

import UIKit
import SnapKit

class XLMainSearchView: UIView {
    
    let searchBar = UISearchBar(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)

        searchBar.placeholder = "zhanweifu"
        self.addSubview(searchBar)
        searchBar.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().offset(-20)
            make.height.equalToSuperview().offset(-10)
        }
        
        for sub1 in searchBar.subviews {
            sub1.backgroundColor = .white
            if sub1 .isKind(of: UIView.self) {
                for sub2 in sub1.subviews {
                    if sub2 .isKind(of: NSClassFromString("UISearchBarBackground")!) {
                        sub2.removeFromSuperview()
                    }
                    if sub2 .isKind(of: NSClassFromString("UISearchBarTextField")!) {
                        sub2.backgroundColor = UIColor.myGray
                    }
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
