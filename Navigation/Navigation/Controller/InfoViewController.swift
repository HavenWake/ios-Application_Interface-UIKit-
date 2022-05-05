//
//  InfoViewController.swift
//  Navigation
//
//  Created by Семён Пряничников on 30.03.2022.
//

import UIKit

class InfoViewController: UIViewController {

    private lazy var alertButton: UIButton = {
        let alertButton = UIButton()
        alertButton.backgroundColor = .black
        alertButton.setTitle("Alert", for: .normal)
        alertButton.layer.cornerRadius = 12
        alertButton.setTitleColor(.white, for: .normal)
        alertButton.addTarget(self, action: #selector(alertButtonAction), for: .touchUpInside)
        alertButton.translatesAutoresizingMaskIntoConstraints = false
        return alertButton
    }()
    
    @objc func alertButtonAction() {
        let alert = UIAlertController(title: "Внимание", message: "Подтвердить операцию?", preferredStyle: .alert)
        let noButton = UIAlertAction(title: "Нет", style: .cancel) { (action) in print("Операция не подтверждена")}
        let yesButton = UIAlertAction(title: "Да", style: .default) {(action) in print("Операция подтверждена")}
        alert.addAction(yesButton)
        alert.addAction(noButton)
        present(alert, animated:  true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        view.addSubview(self.alertButton)
        self.alertButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.alertButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -120).isActive = true
        self.alertButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.alertButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}
