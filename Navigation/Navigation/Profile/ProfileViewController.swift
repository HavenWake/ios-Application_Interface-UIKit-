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
        self.topView.backgroundColor = .lightGray
        self.view.addSubview(self.profileHeaderView)
        self.topView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 100)
        setupConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        
    }
    
    private func setupConstraints() {
        //Для profileHeaderView
        self.profileHeaderView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.profileHeaderView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        //Для newButton
        self.profileHeaderView.newButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.profileHeaderView.newButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.profileHeaderView.newButton.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    }
}
