//
//  XLMainViewModel.swift
//  xiaohongshu
//
//  Created by 冯晓林 on 2018/8/6.
//  Copyright © 2018年 FXL. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class XLMainViewModel: NSObject {
    
    
    func getTitles() {
        
        let url = "https://www.xiaohongshu.com" + "/api/sns/v2/homefeed/categories?"
        let time = Date().timeIntervalSince1970
        let para = ["deviceId": deviceId,
                    "sid": "session.1217765818268069563",
                    "t": time] as [String: Any]
        
        Alamofire.request(url, parameters: para).responseJSON { (response) in
            print("\(JSON(response.data as Any))")
            //            print("\(response.result)")
        }
        
    }
    
    

}
