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
        self.topView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 100)
        profileHeaderViewSetup()
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


        //Для кнопки установки статуса
        self.profileHeaderView.setStatusButton.topAnchor.constraint(equalTo: profileHeaderView.avatarImageView.bottomAnchor, constant: 46).isActive = true
        self.profileHeaderView.setStatusButton.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor, constant: -16).isActive = true
        self.profileHeaderView.setStatusButton.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 16).isActive = true
        self.profileHeaderView.setStatusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        //Для newButton
        self.profileHeaderView.newButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.profileHeaderView.newButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.profileHeaderView.newButton.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
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

    func profileHeaderViewSetup() {
        self.profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        self.profileHeaderView.addSubview(self.profileHeaderView.setStatusButton)
        self.profileHeaderView.addSubview(self.profileHeaderView.fullNameLabel)
        self.profileHeaderView.addSubview(self.profileHeaderView.avatarImageView)
        self.profileHeaderView.addSubview(self.profileHeaderView.statusLabel)
        self.profileHeaderView.addSubview(self.profileHeaderView.statusTextField)
        self.profileHeaderView.addSubview(self.profileHeaderView.newButton)

        //Настройка тени
        self.profileHeaderView.layer.shadowOffset.width = 4
        self.profileHeaderView.layer.shadowOffset.height = 4
        self.profileHeaderView.layer.shadowRadius = 4
        self.profileHeaderView.layer.shadowOpacity = 0.7
        self.profileHeaderView.layer.shadowColor = UIColor.black.cgColor
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
