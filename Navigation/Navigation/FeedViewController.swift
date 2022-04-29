//
//  FeedViewController.swift
//  Navigation
//
//  Created by Семён Пряничников on 29.03.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "Заголовок поста")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        //Старая кнопка, до stackView
        //        self.view.addSubview(self.button)
        //        self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -120).isActive = true
        //        self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        //        self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        //        self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.view.addSubview(self.buttonStackView)
        buttonStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        buttonStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("К посту", for: .normal)
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var secondButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Ко второму посту", for: .normal)
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func actionButton() {
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
        postViewController.titlePost = post.title
    }
    
    private lazy var buttonStackView: UIStackView = {
        let buttonStackView = UIStackView()
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.backgroundColor = .gray
        buttonStackView.spacing = 20
        buttonStackView.axis = .vertical
        buttonStackView.insertArrangedSubview(button, at: 0)
        buttonStackView.insertArrangedSubview(secondButton, at: 1)
        return buttonStackView
    }() 
}
