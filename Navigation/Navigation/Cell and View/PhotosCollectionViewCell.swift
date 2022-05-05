//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Семён Пряничников on 14.04.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "photoCell"

    lazy var photoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.clipsToBounds = true
        photoImageView.layer.cornerRadius = 6
        return photoImageView
    }()

    override init(frame: CGRect) {
        super .init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(photoImageView)
        setupConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraint() {
        photoImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
