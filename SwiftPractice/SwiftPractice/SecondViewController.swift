//
//  SecondViewController.swift
//  SwiftPractice
//
//  Created by admin on 23/02/2017.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,PopupMenuDelegate {
    
    let orientation = UIDeviceOrientationIsPortrait(UIDevice.current.orientation)
    
    fileprivate lazy var playView : UIView = {
        let playView = UIView();
        playView.frame = CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: 200)
        playView.backgroundColor = UIColor.gray
        playView.alpha = 0.5
        return playView
    }()
    
    fileprivate lazy var topView : UIView = {
        let topView = UIView(frame: CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: 30))
        topView.backgroundColor = UIColor(red: 58.1/255, green: 53.2/255, blue: 51.3/255, alpha: 0.2)
        return topView
    }()
    
    fileprivate lazy var bottomView : UIView = {
       let bottomView = UIView(frame: CGRect(x: 0, y: 214, width: UIScreen.main.bounds.width, height: 50))
        bottomView.backgroundColor = UIColor(red: 58.1/255, green: 53.2/255, blue: 51.3/255, alpha: 0.2)
        return bottomView
    }()
    
    
    var popupMenu : popupMenuView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    //MARK:- 构造函数
    init(backgroundColor:UIColor) {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = backgroundColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- popup delegate method
    func changeBackgroundRed() {
        self.view.backgroundColor = UIColor.red
    }
    
    func changeBackgroundGreen() {
        self.view.backgroundColor = UIColor.green
    }
    
    func changeBackgroundBlue() {
        self.view.backgroundColor = UIColor.blue
    }
    
    func changeBackgroundOrange() {
        self.view.backgroundColor = UIColor.orange
    }
    
    //MARK:- MemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SecondViewController {
    
    func setupUI() {
        let orientation = UIInterfaceOrientationIsPortrait(UIApplication.shared.statusBarOrientation)
        self.navigationController?.navigationBar.isHidden = orientation ? false : true
        playView.frame = orientation ? CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: 200) : CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        self.view.addSubview(playView)
        self.view.addSubview(topView)
        self.view.addSubview(bottomView)
        addRightBarButton()
        popupMenu = popupMenuView(frame: CGRect(x: UIScreen.main.bounds.width-110, y: 69, width: 100, height: 210), delegate: self)
        popupMenu?.isHidden = true
        popupMenu?.addButton(count: 4)
        popupMenu?.backgroundColor = UIColor.purple
        self.view.addSubview(popupMenu!)
    }
    
    func addRightBarButton() {
        let button = UIButton(type: UIButtonType.custom)
        button.setBackgroundImage(UIImage(named: "+"), for: .normal)
        button.addTarget(self, action: #selector(showMenu(sender:)), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    func showMenu(sender:UIButton) {
        self.popupMenu?.isHidden = !self.popupMenu!.isHidden
        sender.isSelected = !sender.isSelected
        let name = sender.isSelected ? "x" : "+"
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 8.0, options: .curveEaseIn, animations: {
            sender.setBackgroundImage(UIImage(named: name), for: .normal)
        }, completion: nil)
    }
}
