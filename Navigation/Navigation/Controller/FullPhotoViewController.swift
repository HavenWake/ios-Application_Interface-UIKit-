//
//  FullPhotoViewController.swift
//  Navigation
//
//  Created by Семён Пряничников on 28.04.2022.
//

import UIKit

class FullPhotoViewController: UIViewController {

    var imageCell: String?

    private lazy var photoImage: UIImageView = {
        let imageView = UIImageView()
        if let imageCell = imageCell {
            imageView.image = UIImage(named: imageCell)
        }
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var closeButton: UIButton = {
        let closeButton = UIButton(type: .close)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.isUserInteractionEnabled = true
        closeButton.addTarget(self, action: #selector(closePicture), for: .touchUpInside)
        closeButton.isHidden = false
        closeButton.alpha = 1
        return closeButton
    }()

    @objc func closePicture() {
        view.isHidden = true
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    private func setupView() {
        view.addSubview(photoImage)
        view.addSubview(closeButton)
        view.backgroundColor = .white

        closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true

        NSLayoutConstraint.activate([
            photoImage.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            photoImage.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            photoImage.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            
        ])
    }
}
