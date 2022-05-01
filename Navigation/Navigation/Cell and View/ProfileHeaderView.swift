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

        backgroundColor = .systemGray5
    }

   ///recognizer
    let tapGestureRecognizer = UITapGestureRecognizer() 
    
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
        avatarImageView.addGestureRecognizer(self.tapGestureRecognizer)
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.cornerRadius = 50
        avatarImageView.alpha = 1
        avatarImageView.clipsToBounds = true
        avatarImageView.image = UIImage(named: "BatmanPhoto")
        return avatarImageView
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
}
