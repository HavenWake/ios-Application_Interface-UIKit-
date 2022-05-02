//
//  FullPostViewController.swift
//  Navigation
//
//  Created by Семён Пряничников on 28.04.2022.
//

import UIKit

class FullPostViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Пост"
        self.navigationItem.backButtonTitle = "Назад"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.isHidden = false
        
        setupView()
        setupConstraints()
        setupGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    var postAuthor, postDescription, postImage: String?
    var postLikes, postViews, postNumber: Int?
    
    private lazy var postScrollView: UIScrollView = {
        let postScrollView = UIScrollView()
        postScrollView.backgroundColor = .clear
        postScrollView.translatesAutoresizingMaskIntoConstraints = false
        return postScrollView
        
    }()
    
    private lazy var postContentView: UIView = {
        let postContentView = UIView()
        postContentView.backgroundColor = .clear
        postContentView.translatesAutoresizingMaskIntoConstraints = false
        return postContentView
    }()
    
    private lazy var autorLabel: UILabel = {
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
    
    private lazy var descriptionLabel: UILabel = {
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
    
    private lazy var pictureImageView: UIImageView = {
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
    
    private lazy var likesLabel: UILabel = {
        let likesLabel = UILabel()
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        likesLabel.font = UIFont.systemFont(ofSize: 16)
        likesLabel.textColor = .black
        likesLabel.isUserInteractionEnabled = true
        if let likes = postLikes {
            likesLabel.text = "Likes: \(likes)"
        }
        return likesLabel
    }()
    
    private lazy var viewsLabel: UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        viewsLabel.font = UIFont.systemFont(ofSize: 16)
        viewsLabel.textColor = .black
        if let views = postViews {
            viewsLabel.text = "Views: \(views)"
        }
        return viewsLabel
    }()
    
    private func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(postScrollView)
        postScrollView.addSubview(postContentView)
        postContentView.addSubview(autorLabel)
        postContentView.addSubview(descriptionLabel)
        postContentView.addSubview(pictureImageView)
        postContentView.addSubview(likesLabel)
        postContentView.addSubview(viewsLabel)
    }
    
    private func setupConstraints() {
        
        //Скролл вью
        postScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        postScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        postScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        postScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        //Контент вью
        postContentView.topAnchor.constraint(equalTo: postScrollView.topAnchor).isActive = true
        postContentView.leadingAnchor.constraint(equalTo: postScrollView.leadingAnchor).isActive = true
        postContentView.trailingAnchor.constraint(equalTo: postScrollView.trailingAnchor).isActive = true
        postContentView.bottomAnchor.constraint(equalTo: postScrollView.bottomAnchor).isActive = true
        
        //Для имени автора
        autorLabel.topAnchor.constraint(equalTo: postContentView.topAnchor, constant: 16).isActive = true
        autorLabel.leadingAnchor.constraint(equalTo: postContentView.leadingAnchor, constant: 16).isActive = true
        
        //Для картинки поста
        pictureImageView.topAnchor.constraint(equalTo: autorLabel.bottomAnchor, constant: 16).isActive = true
        pictureImageView.leadingAnchor.constraint(equalTo: postContentView.leadingAnchor).isActive = true
        pictureImageView.trailingAnchor.constraint(equalTo: postContentView.trailingAnchor).isActive = true
        pictureImageView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        pictureImageView.heightAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        
        //Для описания поста
        descriptionLabel.topAnchor.constraint(equalTo: pictureImageView.bottomAnchor, constant: 16).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: postContentView.leadingAnchor, constant: 16).isActive = true
        
        //Для лаков
        likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16).isActive = true
        likesLabel.leadingAnchor.constraint(equalTo: postContentView.leadingAnchor, constant: 16).isActive = true
        likesLabel.bottomAnchor.constraint(equalTo: postContentView.bottomAnchor, constant: -36).isActive = true
        
        //Для просмотров
        viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16).isActive = true
        viewsLabel.trailingAnchor.constraint(equalTo: postContentView.trailingAnchor, constant:  -16).isActive = true
        viewsLabel.bottomAnchor.constraint(equalTo: postContentView.bottomAnchor, constant: -36).isActive = true
    }
    
    private let tapLikeLabel = UITapGestureRecognizer()
    var likedDelegate: TapLikedDelegate?
    
    private func setupGesture() {
        self.tapLikeLabel.addTarget(self, action: #selector(self.tapLike(_:)))
        self.likesLabel.addGestureRecognizer(self.tapLikeLabel)
    }
    
    @objc private func tapLike(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.tapLikeLabel === gestureRecognizer else { return }
        if let postNumber = self.postNumber {
            for index in 0...posts.count {
                if index == postNumber {
                    posts[index].likes += 1
                    likesLabel.text = "Likes: " + String(posts[index].likes)
                    likesLabel.layoutIfNeeded()
                }
            }
        }
    }
}
