//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Семён Пряничников on 30.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Batman"
        fullNameLabel.textColor = .black
        fullNameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18.0)
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return fullNameLabel
    }()
    
    lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.text = "Waiting for something..."
        statusLabel.textColor = .black
        statusLabel.font = UIFont(name: "HelveticaNeue", size: 14.0)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()
    
    lazy var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.cornerRadius = 50
        avatarImageView.clipsToBounds = true
        avatarImageView.image = UIImage(named: "BatmanPhoto")
        return avatarImageView
    }()
    
    lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.setTitle("Set status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return setStatusButton
    }()
    
    @objc func buttonPressed() {
        statusLabel.text = statusText
    }
    
    lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.layer.cornerRadius = 12
        statusTextField.backgroundColor = .white
        statusTextField.font = UIFont(name: "HelveticaNeue", size: 15.0)
        statusTextField.textColor = .black
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
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
    
    lazy var newButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.setTitle("New Button", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.backgroundColor = .systemBlue
        return setStatusButton
    }()
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(setStatusButton)
        addSubview(fullNameLabel)
        addSubview(avatarImageView)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(newButton)
        
        //Настройка тени
        layer.shadowOffset.width = 4
        layer.shadowOffset.height = 4
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.7
        layer.shadowColor = UIColor.black.cgColor
    }
    
    func setupConstraints() {
        //Для кнопки установки статуса
        setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 46).isActive = true
        setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        setStatusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //Для лейбла с именем
        fullNameLabel.topAnchor.constraint(equalTo:  topAnchor, constant: 27).isActive = true
        fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20).isActive = true
        
        //Для аватарки
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
        statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20).isActive = true
        statusTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
