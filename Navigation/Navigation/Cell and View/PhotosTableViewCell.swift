//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Семён Пряничников on 14.04.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var photoCellLabel: UILabel = {
        photoCellLabel = UILabel()
        photoCellLabel.translatesAutoresizingMaskIntoConstraints = false
        photoCellLabel.textColor = .black
        photoCellLabel.font = UIFont.boldSystemFont(ofSize: 24)
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapLiked))
        photoCellLabel.isUserInteractionEnabled = true
        photoCellLabel.addGestureRecognizer(tap)
        return photoCellLabel
    }()
    
    @objc func tapLiked() {
        print("Good")
    }
    
    lazy var rightArrowLabel: UILabel = {
        rightArrowLabel = UILabel()
        rightArrowLabel.translatesAutoresizingMaskIntoConstraints = false
        rightArrowLabel.textColor = .black
        rightArrowLabel.font = UIFont.systemFont(ofSize: 24)
        return rightArrowLabel
    }()
    
    lazy var firstPhotoImageView: UIImageView = {
        let firstPhotoImageView = UIImageView()
        firstPhotoImageView.translatesAutoresizingMaskIntoConstraints = false
        firstPhotoImageView.clipsToBounds = true
        firstPhotoImageView.layer.cornerRadius = 6
        return firstPhotoImageView
    }()
    
    lazy var secondPhotoImageView: UIImageView = {
        let secondPhotoImageView = UIImageView()
        secondPhotoImageView.translatesAutoresizingMaskIntoConstraints = false
        secondPhotoImageView.clipsToBounds = true
        secondPhotoImageView.layer.cornerRadius = 6
        return secondPhotoImageView
    }()
    
    lazy var thirdPhotoImageView: UIImageView = {
        let thirdPhotoImageView = UIImageView()
        thirdPhotoImageView.translatesAutoresizingMaskIntoConstraints = false
        thirdPhotoImageView.clipsToBounds = true
        thirdPhotoImageView.layer.cornerRadius = 6
        return thirdPhotoImageView
    }()
    
    lazy var fourthPhotoImageView: UIImageView = {
        let fourthPhotoImageView = UIImageView()
        fourthPhotoImageView.translatesAutoresizingMaskIntoConstraints = false
        fourthPhotoImageView.clipsToBounds = true
        fourthPhotoImageView.layer.cornerRadius = 6
        return fourthPhotoImageView
    }()
    
    func setupView() {
        addSubview(photoCellLabel)
        addSubview(rightArrowLabel)
        addSubview(firstPhotoImageView)
        addSubview(secondPhotoImageView)
        addSubview(thirdPhotoImageView)
        addSubview(fourthPhotoImageView)
    }
    
    func setupConstraints() {
        //Для лейблов
        photoCellLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        photoCellLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        photoCellLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        
        rightArrowLabel.centerYAnchor.constraint(equalTo: photoCellLabel.centerYAnchor).isActive = true
        rightArrowLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        
        
        // Для фото
        firstPhotoImageView.topAnchor.constraint(equalTo: photoCellLabel.bottomAnchor, constant: 12).isActive = true
        firstPhotoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant:  12).isActive = true
        firstPhotoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        firstPhotoImageView.heightAnchor.constraint(equalTo: firstPhotoImageView.widthAnchor).isActive = true
        
        secondPhotoImageView.topAnchor.constraint(equalTo: firstPhotoImageView.topAnchor).isActive = true
        secondPhotoImageView.leadingAnchor.constraint(equalTo: firstPhotoImageView.trailingAnchor, constant: 8).isActive = true
        secondPhotoImageView.bottomAnchor.constraint(equalTo: firstPhotoImageView.bottomAnchor).isActive = true
        secondPhotoImageView.heightAnchor.constraint(equalTo: secondPhotoImageView.widthAnchor).isActive = true
        
        thirdPhotoImageView.topAnchor.constraint(equalTo: firstPhotoImageView.topAnchor).isActive = true
        thirdPhotoImageView.leadingAnchor.constraint(equalTo: secondPhotoImageView.trailingAnchor, constant: 8).isActive = true
        thirdPhotoImageView.bottomAnchor.constraint(equalTo: firstPhotoImageView.bottomAnchor).isActive = true
        thirdPhotoImageView.heightAnchor.constraint(equalTo: thirdPhotoImageView.widthAnchor).isActive = true
        
        fourthPhotoImageView.topAnchor.constraint(equalTo: firstPhotoImageView.topAnchor).isActive = true
        fourthPhotoImageView.leadingAnchor.constraint(equalTo: thirdPhotoImageView.trailingAnchor, constant: 8).isActive = true
        fourthPhotoImageView.bottomAnchor.constraint(equalTo: firstPhotoImageView.bottomAnchor).isActive = true
        fourthPhotoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -12).isActive = true
        fourthPhotoImageView.heightAnchor.constraint(equalTo: fourthPhotoImageView.widthAnchor).isActive = true
        
    }
}
