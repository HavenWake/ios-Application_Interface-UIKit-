//
//  FullPhoto.swift
//  Navigation
//
//  Created by Семён Пряничников on 30.04.2022.
//

import UIKit

class FullPhotoView: UIView {

    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = .white
        self.alpha = 0
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(transparentView)
        addSubview(fullPhotoImageView)
        addSubview(closeButton)
    }

    lazy var fullPhotoImageView: UIImageView = {
        let fullPhotoImageView = UIImageView()
        fullPhotoImageView.translatesAutoresizingMaskIntoConstraints = false
        fullPhotoImageView.isUserInteractionEnabled = true
        fullPhotoImageView.layer.borderWidth = 3
        fullPhotoImageView.layer.borderColor = UIColor.white.cgColor
        fullPhotoImageView.layer.cornerRadius = 50
        fullPhotoImageView.clipsToBounds = true
        fullPhotoImageView.image = UIImage(named: "silentHill")
        return fullPhotoImageView
    }()

    lazy var transparentView: UIView = {
        let transparentView = UIView()
        transparentView.translatesAutoresizingMaskIntoConstraints = false
        transparentView.alpha = 0
        transparentView.backgroundColor = .black
        return transparentView
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

    @objc private func closePicture() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            self.alpha = 0
            self.transform = .identity
        }
    }

    private func setupConstraints() {
        self.fullPhotoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.fullPhotoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.fullPhotoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.fullPhotoImageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        self.fullPhotoImageView.heightAnchor.constraint(equalTo: widthAnchor).isActive = true

        closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }


}
