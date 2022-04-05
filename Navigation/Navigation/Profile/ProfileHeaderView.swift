//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Семён Пряничников on 30.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {

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

    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
