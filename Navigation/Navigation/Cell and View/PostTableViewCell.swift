//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Семён Пряничников on 11.04.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var autorLabel: UILabel = {
        let autorLabel = UILabel()
        autorLabel.translatesAutoresizingMaskIntoConstraints = false
        autorLabel.textColor = .black
        autorLabel.numberOfLines = 2
        autorLabel.font = UIFont.boldSystemFont(ofSize: 20)
        return autorLabel
    }()
    
    lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.textColor = .systemGray
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    
    lazy var pictureImageView: UIImageView = {
        let pictureImageView = UIImageView()
        pictureImageView.translatesAutoresizingMaskIntoConstraints = false
        pictureImageView.isUserInteractionEnabled  = true
        pictureImageView.contentMode = .scaleAspectFit
        pictureImageView.backgroundColor = .black
        pictureImageView.clipsToBounds = true
        return pictureImageView
    }()
    
    lazy var likesLabel: UILabel = {
        let likesLabel = UILabel()
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        likesLabel.font = UIFont.systemFont(ofSize: 16)
        likesLabel.textColor = .black
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapLiked))
        likesLabel.isUserInteractionEnabled = true
        likesLabel.addGestureRecognizer(tap)
        return likesLabel
    }()
    
    private var likeTapGesture = UITapGestureRecognizer()
    var likedDelegate: TapLikedDelegate?
    
    var isLike = false
    @objc func tapLiked() {
        likedDelegate?.tapLikedLabel()
    }
    
    lazy var viewsLabel: UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        viewsLabel.font = UIFont.systemFont(ofSize: 16)
        viewsLabel.textColor = .black
        return viewsLabel
    }()
    
    func setupView() {
        contentView.addSubview(autorLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(pictureImageView)
        contentView.addSubview(likesLabel)
        contentView.addSubview(viewsLabel)
    }
    
    func setupConstraints() {
        autorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        autorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        autorLabel.bottomAnchor.constraint(equalTo: pictureImageView.topAnchor, constant: -16).isActive = true
        
        pictureImageView.topAnchor.constraint(equalTo: autorLabel.bottomAnchor, constant: 16).isActive = true
        pictureImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        pictureImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        pictureImageView.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -16).isActive = true
        pictureImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        pictureImageView.heightAnchor.constraint(equalTo: pictureImageView.widthAnchor).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: pictureImageView.bottomAnchor, constant: 16).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: likesLabel.topAnchor, constant: -16).isActive = true
        
        likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16).isActive = true
        likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        
        viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16).isActive = true
        viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -16).isActive = true
        viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
    }
}
