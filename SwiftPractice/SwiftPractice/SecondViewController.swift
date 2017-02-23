//
//  SecondViewController.swift
//  SwiftPractice
//
//  Created by admin on 23/02/2017.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    init(backgroundColor:UIColor) {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = backgroundColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SecondViewController {
    func setupUI() {
        self.view.addSubview(playView)
        self.view.addSubview(topView)
        self.view.addSubview(bottomView)
        buttonAddAction()
    }
    
    func buttonAddAction() {
        
    }
    
    
    
}
