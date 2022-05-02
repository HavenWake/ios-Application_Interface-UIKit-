//
//  FullPostView.swift
//  Navigation
//
//  Created by Семён Пряничников on 28.04.2022.
//

import UIKit

class FullPostView: UIView {
    
    var postAuthor, postDescription, postImage: String?
    var postLikes, postViews: Int?
    
    var fullPost: PostModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(postScrollView)
        postScrollView.addSubview(postContentView)
        postContentView.addSubview(autorLabel)
        postContentView.addSubview(descriptionLabel)
        postContentView.addSubview(pictureImageView)
        postContentView.addSubview(likesLabel)
        postContentView.addSubview(viewsLabel)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private var likeTapGesture = UITapGestureRecognizer()
    var likedDelegate: TapLikedDelegate?
    
    
    lazy var postScrollView: UIScrollView = {
        let postScrollView = UIScrollView()
        postScrollView.backgroundColor = .white
        postScrollView.translatesAutoresizingMaskIntoConstraints = false
        return postScrollView
        
    }()
    
    lazy var postContentView: UIView = {
        let postContentView = UIView()
        postContentView.backgroundColor = .white
        postContentView.translatesAutoresizingMaskIntoConstraints = false
        return postContentView
    }()
    
    lazy var autorLabel: UILabel = {
        let autorLabel = UILabel()
        autorLabel.translatesAutoresizingMaskIntoConstraints = false
        autorLabel.textColor = .black
        autorLabel.numberOfLines = 2
        autorLabel.font = UIFont.boldSystemFont(ofSize: 20)
        if let author = postAuthor {
            autorLabel.text = author
        }
        return autorLabel
    }()
    
    lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.textColor = .systemGray
        descriptionLabel.numberOfLines = 0
        if let descrition = postDescription {
            descriptionLabel.text = descrition
        }
        return descriptionLabel
    }()
    
    lazy var pictureImageView: UIImageView = {
        let pictureImageView = UIImageView()
        pictureImageView.translatesAutoresizingMaskIntoConstraints = false
        pictureImageView.isUserInteractionEnabled  = true
        pictureImageView.contentMode = .scaleAspectFit
        pictureImageView.backgroundColor = .black
        pictureImageView.clipsToBounds = true
        if let image = postImage {
            pictureImageView.image = UIImage(named: image)
        }
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
        if let likes = postLikes {
            likesLabel.text = "Likes: \(likes)"
        }
        return likesLabel
    }()
    
    var isLike = false
    @objc func tapLiked() {
        print("Tapp Like")
        isLike = true
        likedDelegate?.tapLikedLabel()
    }
    
    lazy var viewsLabel: UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        viewsLabel.font = UIFont.systemFont(ofSize: 16)
        viewsLabel.textColor = .black
        if let views = postViews {
            viewsLabel.text = "Views: \(views)"
        }
        return viewsLabel
    }()
    
    func setupConstraints() {
        
        postScrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        postScrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        postScrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        postScrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        postContentView.topAnchor.constraint(equalTo: postScrollView.topAnchor).isActive = true
        postContentView.leadingAnchor.constraint(equalTo: postScrollView.leadingAnchor).isActive = true
        postContentView.trailingAnchor.constraint(equalTo: postScrollView.trailingAnchor).isActive = true
        postContentView.bottomAnchor.constraint(equalTo: postScrollView.bottomAnchor).isActive = true
        
        autorLabel.topAnchor.constraint(equalTo: postContentView.topAnchor, constant: 16).isActive = true
        autorLabel.leadingAnchor.constraint(equalTo: postContentView.leadingAnchor, constant: 16).isActive = true
        autorLabel.bottomAnchor.constraint(equalTo: pictureImageView.topAnchor, constant: -16).isActive = true
        
        pictureImageView.topAnchor.constraint(equalTo: autorLabel.bottomAnchor, constant: 16).isActive = true
        pictureImageView.leadingAnchor.constraint(equalTo: postContentView.leadingAnchor).isActive = true
        pictureImageView.trailingAnchor.constraint(equalTo: postContentView.trailingAnchor).isActive = true
        pictureImageView.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -16).isActive = true
        pictureImageView.widthAnchor.constraint(equalTo: postContentView.widthAnchor).isActive = true
        pictureImageView.heightAnchor.constraint(equalTo: pictureImageView.widthAnchor).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: pictureImageView.bottomAnchor, constant: 16).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: postContentView.leadingAnchor, constant: 16).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: likesLabel.topAnchor, constant: -16).isActive = true
        
        likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16).isActive = true
        likesLabel.leadingAnchor.constraint(equalTo: postContentView.leadingAnchor, constant: 16).isActive = true
        likesLabel.bottomAnchor.constraint(equalTo: postContentView.bottomAnchor, constant: -16).isActive = true
        
        viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16).isActive = true
        viewsLabel.trailingAnchor.constraint(equalTo: postContentView.trailingAnchor, constant:  -16).isActive = true
        viewsLabel.bottomAnchor.constraint(equalTo: postContentView.bottomAnchor, constant: -16).isActive = true
    }
}
