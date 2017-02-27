//
//  popupMenuView.swift
//  SwiftPractice
//
//  Created by admin on 23/02/2017.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

protocol PopupMenuDelegate {
    func changeBackgroundRed()
    func changeBackgroundGreen()
    func changeBackgroundBlue()
    func changeBackgroundOrange()
}

class popupMenuView: UIView {
    
    //MARK:- delegate
    var delegate : PopupMenuDelegate?
    
    //MARK:- 重写构造函数
    init(frame: CGRect, delegate:PopupMenuDelegate) {
        super.init(frame: frame)
        self.frame = frame
        self.delegate = delegate
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
            btn.tag = i
            btn.frame = CGRect(x: 10, y: 10+i*50, width: 80, height: 40)
            self.addSubview(btn)
        }
    }
    
    func btnAction(sender:UIButton) {
        switch sender.tag {
        case 0:
            sender.setTitle("red", for: .normal)
            self.delegate?.changeBackgroundRed()
        case 1:
            sender.setTitle("green", for: .normal)
            self.delegate?.changeBackgroundGreen()
        case 2:
            sender.setTitle("blue", for: .normal)
            self.delegate?.changeBackgroundBlue()
        case 3:
            sender.setTitle("orange", for: .normal)
            self.delegate?.changeBackgroundOrange()
        default:
            break
        }
    }
}
