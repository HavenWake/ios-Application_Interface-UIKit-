//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Семён Пряничников on 29.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
    let topView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        self.view.addSubview(topView)
        self.topView.backgroundColor = .white
        self.view.addSubview(self.profileHeaderView)
    }
    
    override func viewWillLayoutSubviews() {
        let viewHeight = view.frame.height
        let viewWidth = view.frame.width
        self.profileHeaderView.frame = CGRect(x: 0, y: 100, width: viewWidth, height: viewHeight)
        self.topView.frame = CGRect(x: 0, y: 0, width: viewWidth, height: 100)
    }
}
