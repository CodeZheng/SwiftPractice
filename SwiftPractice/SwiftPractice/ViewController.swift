//
//  ViewController.swift
//  SwiftPractice
//
//  Created by admin on 23/02/2017.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuBtn: UIBarButtonItem!
    //MARK:- 懒加载
    fileprivate lazy var pushBtn : UIButton = {
        let pushBtn = UIButton(type: UIButtonType.custom)
        pushBtn.setTitle("push", for: .normal)
        pushBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20);
        pushBtn.setTitleColor(UIColor.red, for: .normal)
        pushBtn.backgroundColor = UIColor.green
        return pushBtn
    }()
    
    var secondVC : SecondViewController = SecondViewController(backgroundColor: UIColor.white)
    
    @IBAction func showMenu(_ sender: Any) {
        let button = sender as! UIButton
        button.isSelected = !button.isSelected
        let angle = button.isSelected ? (M_PI_4) : 0.0
        button.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
    }

    //MARK:-
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController {
    func setupUI() {
        pushBtn.frame = CGRect(x: self.view.frame.size.width/2 - 50, y: 200, width: 100, height: 100)
        pushBtn.addTarget(self, action:#selector(push(sender:)) , for: .touchUpInside)
        self.view.addSubview(pushBtn)
    }
    
    func push(sender : UIButton) {
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
}
