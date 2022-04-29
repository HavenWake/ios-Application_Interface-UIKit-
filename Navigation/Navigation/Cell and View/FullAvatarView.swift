//
//  FullAvatarView.swift
//  Navigation
//
//  Created by Семён Пряничников on 29.04.2022.
//

import UIKit

class FullAvatarView: UIView {

    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = .white
        setupView()
        setupConstraints()
        setupGesture()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(transparentView)
        addSubview(avatarImageView)
        addSubview(closeButton)
    }

    private var avatarXConstraint: NSLayoutConstraint?
    private var avatarYConstraint: NSLayoutConstraint?
    private var avatarWidthConstraint: NSLayoutConstraint?
    private var avatarHeightConstraint: NSLayoutConstraint?
    private var avatarTopConstraint: NSLayoutConstraint?
    private var avatarLeadingConstraint: NSLayoutConstraint?
    private var avatarTrallingConstraint: NSLayoutConstraint?

    private func decreaseAvatarConstraint() {
        self.avatarTopConstraint = avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
        self.avatarLeadingConstraint = avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        self.avatarHeightConstraint = avatarImageView.heightAnchor.constraint(equalToConstant: 100)
        self.avatarWidthConstraint = avatarImageView.widthAnchor.constraint(equalToConstant: 100)
        self.avatarXConstraint?.isActive = false
        self.avatarYConstraint?.isActive = false
        self.avatarWidthConstraint?.isActive = true
        self.avatarHeightConstraint?.isActive = true
        self.avatarLeadingConstraint?.isActive = true
        self.avatarTopConstraint?.isActive = true
    }

    private func increaseAvatarConstraint() {
        self.avatarWidthConstraint = avatarImageView.widthAnchor.constraint(equalToConstant: bounds.width)
        self.avatarHeightConstraint = avatarImageView.heightAnchor.constraint(equalToConstant: bounds.width)
        self.avatarXConstraint = avatarImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        self.avatarYConstraint = avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        self.avatarXConstraint?.isActive = true
        self.avatarYConstraint?.isActive = true
        self.avatarWidthConstraint?.isActive = true
        self.avatarHeightConstraint?.isActive = true
        self.avatarLeadingConstraint?.isActive = false
        self.avatarTopConstraint?.isActive = false
    }

    private func setupConstraints() {
        transparentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        transparentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        transparentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        transparentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        self.avatarTopConstraint = avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
        self.avatarLeadingConstraint = avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        self.avatarHeightConstraint = avatarImageView.heightAnchor.constraint(equalToConstant: 100)
        self.avatarWidthConstraint = avatarImageView.widthAnchor.constraint(equalToConstant: 100)

        closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true

        NSLayoutConstraint.activate([self.avatarLeadingConstraint, self.avatarHeightConstraint, self.avatarWidthConstraint, self.avatarTopConstraint, self.avatarYConstraint, self.avatarXConstraint, avatarTrallingConstraint].compactMap({ $0 }))
    }

    lazy var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.cornerRadius = 50
        avatarImageView.clipsToBounds = true
        avatarImageView.image = UIImage(named: "BatmanPhoto")
        return avatarImageView
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
        closeButton.alpha = 0
        return closeButton
    }()

    @objc private func closePicture() {

        UIView.animate(withDuration: 0.3, animations: {
            self.closeButton.alpha = 0.0
        }) { _ in
            self.decreaseAvatarConstraint()
            UIView.animate(withDuration: 0.5, animations: {
                self.layoutIfNeeded()
                self.transparentView.alpha = 0
            }
            )}
    }

    private let tapGestureRecognizer = UITapGestureRecognizer()

    private func setupGesture() {
        self.tapGestureRecognizer.addTarget(self, action: #selector(self.handleTapGesture(_:)))
        self.avatarImageView.addGestureRecognizer(self.tapGestureRecognizer)
    }


    @objc private func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.tapGestureRecognizer === gestureRecognizer else { return }

        self.increaseAvatarConstraint()
        UIView.animate(withDuration: 0.5, animations: {
            self.transparentView.alpha = 0.5
            self.layoutIfNeeded()
        }) { _ in
            UIView.animate(withDuration: 0.3, animations: {self.closeButton.alpha = 1})
        }
    }
}
