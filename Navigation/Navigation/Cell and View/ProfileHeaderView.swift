//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Семён Пряничников on 30.03.2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraint()

        deactivateZoomAvatarConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var avatarWidthConstraint: NSLayoutConstraint!
    var avatarHeightConstraint: NSLayoutConstraint!
    var avatarLeadingAnchorConstraint: NSLayoutConstraint!
    var avatarTopConstraint: NSLayoutConstraint!
    var avatarXConstraint: NSLayoutConstraint!
    var avatarYConstraint: NSLayoutConstraint!

    var tappedAvatarWidthConstraint: NSLayoutConstraint!
    var tappedAvatarHeightConstraint: NSLayoutConstraint!
    
    func setupView() {
        contentView.addSubview(fullNameLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(setStatusButton)
        contentView.addSubview(statusTextField)
        contentView.addSubview(transparentView)
        addSubview(fullAvatarImageView)

        setupGesture()
        backgroundColor = .systemGray5
    }
   ///recognizer
    let tapGestureRecognizer = UITapGestureRecognizer()
    let profileViewController = ProfileViewController()
    func setupGesture() {
        self.tapGestureRecognizer.addTarget(self, action: #selector(self.handleTapGesture(_:)))
        self.avatarImageView.addGestureRecognizer(self.tapGestureRecognizer)
    }

    var isTappedAvatar = false
    @objc func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.tapGestureRecognizer === gestureRecognizer else { return }
        let profileViewController =  ProfileViewController()
        profileViewController.view.addSubview(fullAvatarImageView)
//        fullAvatarImageView.alpha = 1
//        UIImageView.animate(withDuration: 0.5) {
//            self.expandedAvatar()
//            self.isTappedAvatar = true
//            self.profileViewController.view.layoutIfNeeded()
//        }
        //profileViewController.profileTableView.reloadData()
    }

    func expandedAvatar() {
        activateZoomAvatarConstraints()
        transparentView.alpha = 0.5
//        transparentView.addSubview(fullAvatarView)
//        avatarImageView.centerXAnchor.constraint(equalTo: transparentView.centerXAnchor).isActive = true
//        avatarImageView.centerYAnchor.constraint(equalTo: transparentView.centerYAnchor).isActive = true
//        avatarImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
//        avatarImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setupConstraint() {
        //Для кнопки установки статуса
        setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 46).isActive = true
        setStatusButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        setStatusButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        setStatusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        setStatusButton.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        
        //Для лейбла с именем
        fullNameLabel.topAnchor.constraint(equalTo:  contentView.topAnchor, constant: 27).isActive = true
        fullNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20).isActive = true
        
        //Для аватарки
        avatarTopConstraint = fullAvatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16)
        avatarLeadingAnchorConstraint = fullAvatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        avatarHeightConstraint = fullAvatarImageView.heightAnchor.constraint(equalToConstant: 100)
        avatarWidthConstraint = fullAvatarImageView.widthAnchor.constraint(equalToConstant: 100)
        avatarXConstraint = fullAvatarImageView.centerXAnchor.constraint(equalTo: transparentView.centerXAnchor)
        avatarYConstraint = fullAvatarImageView.centerYAnchor.constraint(equalTo: transparentView.centerYAnchor)
        tappedAvatarWidthConstraint = fullAvatarImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        tappedAvatarHeightConstraint = fullAvatarImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor)

        avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        //Для лейбла со статусом
        statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -16).isActive = true
        statusLabel.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor).isActive = true
        statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20).isActive = true
        
        //Для текстфилда статуса
        statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -16).isActive = true
        statusTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20).isActive = true
        statusTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

        //Полупрозрачного вью
//        transparentView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
//        transparentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
//        transparentView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true

        //Для тапнутого аватара
        fullAvatarImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        fullAvatarImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        fullAvatarImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
    }

    func activateZoomAvatarConstraints() {
        NSLayoutConstraint.deactivate([avatarWidthConstraint, avatarHeightConstraint, avatarLeadingAnchorConstraint, avatarTopConstraint])
        NSLayoutConstraint.activate([avatarXConstraint, avatarYConstraint, tappedAvatarWidthConstraint, tappedAvatarHeightConstraint])
    }

    func deactivateZoomAvatarConstraints() {
        NSLayoutConstraint.deactivate([avatarXConstraint, avatarYConstraint, tappedAvatarWidthConstraint, tappedAvatarHeightConstraint])
        NSLayoutConstraint.activate([avatarWidthConstraint, avatarHeightConstraint, avatarLeadingAnchorConstraint, avatarTopConstraint])
    }

    lazy var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Batman"
        fullNameLabel.textColor = .black
        fullNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return fullNameLabel
    }()
    
    lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.text = "Waiting for something..."
        statusLabel.textColor = .black
        statusLabel.font = UIFont.systemFont(ofSize: 14)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()
    
    lazy var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.cornerRadius = 50
        avatarImageView.alpha = 1
        avatarImageView.clipsToBounds = true
        avatarImageView.image = UIImage(named: "BatmanPhoto")
        return avatarImageView
    }()

    lazy var fullAvatarImageView: UIImageView = {
        let fullAvatarImageView = UIImageView()
        fullAvatarImageView.translatesAutoresizingMaskIntoConstraints = false
        fullAvatarImageView.alpha = 0
        fullAvatarImageView.isUserInteractionEnabled = true
        fullAvatarImageView.layer.borderWidth = 3
        fullAvatarImageView.layer.borderColor = UIColor.white.cgColor
        fullAvatarImageView.layer.cornerRadius = 50
        fullAvatarImageView.clipsToBounds = true
        fullAvatarImageView.image = UIImage(named: "BatmanPhoto")
        return fullAvatarImageView
    }()
    
    lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.layer.cornerRadius = 12
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.setTitle("Set status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowOffset.width = 4
        setStatusButton.layer.shadowOffset.height = 4
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return setStatusButton
    }()
    
    @objc func buttonPressed() {
        if statusTextField.text?.isEmpty == true {
            statusTextField.layer.borderColor = UIColor.systemRed.cgColor
        }
        else {
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusLabel.text = statusText
        statusTextField.text = ""
        }
    }
    
    lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.layer.cornerRadius = 12
        statusTextField.backgroundColor = .white
        statusTextField.font = UIFont.systemFont(ofSize: 15)
        statusTextField.textColor = .black
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.placeholder = "What is new?"
        statusTextField.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: statusTextField.frame.height))
        statusTextField.leftViewMode = .always
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        statusTextField.clipsToBounds = true
        return statusTextField
    }()
    
    private var statusText = ""
    
    @objc func statusTextChanged(_ textField: UITextField) {
        if let text = statusTextField.text {
            statusText = text
        }
    }

    lazy var transparentView: UIView = {
        let transparentView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        //transparentView.translatesAutoresizingMaskIntoConstraints = false
        transparentView.alpha = 0
        transparentView.backgroundColor = .black
        return transparentView
    }()
}
