//
//  popupMenuView.swift
//  SwiftPractice
//
//  Created by admin on 23/02/2017.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class popupMenuView: UIView {
    
    //MARK:- 重写构造函数
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension popupMenuView {
    //MARK:- 添加button
    func addButton(count:Int) {
        for i in 0..<count {
            let btn = UIButton(type: UIButtonType.custom)
            btn.setTitle(String(i), for: .normal)
            btn.layer.borderWidth = 2
            btn.layer.borderColor = UIColor.black.cgColor
            btn.addTarget(self, action: #selector(btnAction(sender:)), for: .touchUpInside)
        }
    }
    
    func btnAction(sender:UIButton) {
        
    }
}
