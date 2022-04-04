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
        self.profileHeaderView.addSubview(self.profileHeaderView.setStatusButton)
        self.profileHeaderView.addSubview(self.profileHeaderView.fullNameLabel)
        self.profileHeaderView.addSubview(self.profileHeaderView.avatarImageView)
        self.profileHeaderView.addSubview(self.profileHeaderView.statusLabel)
        self.profileHeaderView.addSubview(self.profileHeaderView.statusTextField)
        
        self.profileHeaderView.layer.shadowOffset.width = 4
        self.profileHeaderView.layer.shadowOffset.height = 4
        self.profileHeaderView.layer.shadowRadius = 4
        self.profileHeaderView.layer.shadowOpacity = 0.7
        self.profileHeaderView.layer.shadowColor = UIColor.black.cgColor
        
        setupConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        let viewHeight = view.bounds.height
        let viewWidth = view.bounds.width
        self.profileHeaderView.frame = CGRect(x: 0, y: 100, width: viewWidth, height: viewHeight)
        self.topView.frame = CGRect(x: 0, y: 0, width: viewWidth, height: 100)
    }
    
    private func setupConstraints() {
        //Для кнопки
        self.profileHeaderView.setStatusButton.topAnchor.constraint(equalTo: profileHeaderView.avatarImageView.bottomAnchor, constant: 46).isActive = true
        self.profileHeaderView.setStatusButton.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor, constant: -16).isActive = true
        self.profileHeaderView.setStatusButton.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 16).isActive = true
        self.profileHeaderView.setStatusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //Для лейбла с именем
        self.profileHeaderView.fullNameLabel.topAnchor.constraint(equalTo:  profileHeaderView.topAnchor, constant: 27).isActive = true
        self.profileHeaderView.fullNameLabel.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor, constant: -16).isActive = true
        self.profileHeaderView.fullNameLabel.leadingAnchor.constraint(equalTo: profileHeaderView.avatarImageView.trailingAnchor, constant: 20).isActive = true
        
        //Для аватарки
        self.profileHeaderView.avatarImageView.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 16).isActive = true
        self.profileHeaderView.avatarImageView.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 16).isActive = true
        self.profileHeaderView.avatarImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.profileHeaderView.avatarImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        //Для лейбла со статусом
        self.profileHeaderView.statusLabel.bottomAnchor.constraint(equalTo: profileHeaderView.statusTextField.topAnchor, constant: -16).isActive = true
        self.profileHeaderView.statusLabel.trailingAnchor.constraint(equalTo: profileHeaderView.fullNameLabel.trailingAnchor).isActive = true
        self.profileHeaderView.statusLabel.leadingAnchor.constraint(equalTo: profileHeaderView.avatarImageView.trailingAnchor, constant: 20).isActive = true
        
        //Для текстфилда статуса
        self.profileHeaderView.statusTextField.bottomAnchor.constraint(equalTo: profileHeaderView.setStatusButton.topAnchor, constant: -16).isActive = true
        self.profileHeaderView.statusTextField.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor, constant: -16).isActive = true
        self.profileHeaderView.statusTextField.leadingAnchor.constraint(equalTo: profileHeaderView.avatarImageView.trailingAnchor, constant: 20).isActive = true
        self.profileHeaderView.statusTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
