//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Семён Пряничников on 29.03.2022.
//

import UIKit

class ProfileViewController: UIViewController, TapLikedDelegate {
    
    var isLike = false
    
    private var avatarXConstraint: NSLayoutConstraint?
    private var avatarYConstraint: NSLayoutConstraint?
    private var avatarWidthConstraint: NSLayoutConstraint?
    private var avatarHeightConstraint: NSLayoutConstraint?
    private var avatarTopConstraint: NSLayoutConstraint?
    private var avatarLeadingConstraint: NSLayoutConstraint?
    private var avatarTrallingConstraint: NSLayoutConstraint?
    
    lazy var profileTableView: UITableView = {
        let profileTableView = UITableView()
        posts = fetchData()
        profileTableView.translatesAutoresizingMaskIntoConstraints = false
        profileTableView.rowHeight = UITableView.automaticDimension
        profileTableView.estimatedRowHeight = 100
        profileTableView.estimatedSectionHeaderHeight = 0
        profileTableView.estimatedSectionFooterHeight = 5
        profileTableView.dataSource = self
        profileTableView.delegate = self
        profileTableView.register(PostTableViewCell.self, forCellReuseIdentifier: "postCell")
        profileTableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "photoCell")
        profileTableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "ProfileHeaderView")
        return profileTableView
    }()
    
    lazy var fullAvatarImageView: UIImageView = {
        let fullAvatarImageView = UIImageView()
        fullAvatarImageView.translatesAutoresizingMaskIntoConstraints = false
        fullAvatarImageView.layer.borderWidth = 3
        fullAvatarImageView.layer.borderColor = UIColor.white.cgColor
        fullAvatarImageView.layer.cornerRadius = 50
        fullAvatarImageView.clipsToBounds = true
        fullAvatarImageView.image = UIImage(named: "BatmanPhoto")
        fullAvatarImageView.alpha = 0
        return fullAvatarImageView
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
        closeButton.backgroundColor = .white
        closeButton.alpha = 0
        closeButton.clipsToBounds = true
        closeButton.layer.cornerRadius = 10
        return closeButton
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.profileTableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.profileTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func tapLikedLabel() {
        isLike = true
        self.profileTableView.reloadData()
    }
    
    @objc private func closePicture() {
        UIView.animate(withDuration: 0.3, animations: {
            self.closeButton.alpha = 0.0
        }) { _ in
            self.decreaseAvatarConstraint()
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded()
                self.transparentView.alpha = 0
                self.fullAvatarImageView.alpha = 0
            }
            )}
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray5
        view.addSubview(profileTableView)
        view.addSubview(transparentView)
        view.addSubview(fullAvatarImageView)
        view.addSubview(closeButton)
        self.profileTableView.backgroundColor = .clear
        
        let leadingConstraint = self.profileTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.profileTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let topConstraint = self.profileTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let bottomConstraint = self.profileTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        transparentView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        transparentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        transparentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        transparentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        NSLayoutConstraint.activate([topConstraint,leadingConstraint,trailingConstraint,bottomConstraint])
        
        self.decreaseAvatarConstraint()
    }
    
    private func decreaseAvatarConstraint() {
        self.avatarTopConstraint = fullAvatarImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 38)
        self.avatarLeadingConstraint = fullAvatarImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
        self.avatarHeightConstraint = fullAvatarImageView.heightAnchor.constraint(equalToConstant: 100)
        self.avatarWidthConstraint = fullAvatarImageView.widthAnchor.constraint(equalToConstant: 100)
        self.avatarXConstraint?.isActive = false
        self.avatarYConstraint?.isActive = false
        self.avatarWidthConstraint?.isActive = true
        self.avatarHeightConstraint?.isActive = true
        self.avatarLeadingConstraint?.isActive = true
        self.avatarTopConstraint?.isActive = true
    }
    
    private func increaseAvatarConstraint() {
        self.avatarWidthConstraint = fullAvatarImageView.widthAnchor.constraint(equalToConstant: self.view.bounds.width)
        self.avatarHeightConstraint = fullAvatarImageView.heightAnchor.constraint(equalToConstant: self.view.bounds.width)
        self.avatarXConstraint = fullAvatarImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        self.avatarYConstraint = fullAvatarImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        self.avatarXConstraint?.isActive = true
        self.avatarYConstraint?.isActive = true
        self.avatarWidthConstraint?.isActive = true
        self.avatarHeightConstraint?.isActive = true
        self.avatarLeadingConstraint?.isActive = false
        self.avatarTopConstraint?.isActive = false
    }
    
    @objc private func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        print("avatar tap")
        self.fullAvatarImageView.alpha = 1
        self.increaseAvatarConstraint()
        UIView.animate(withDuration: 0.5, animations: {
            self.transparentView.alpha = 0.5
            self.view.layoutIfNeeded()
        }) { _ in
            UIView.animate(withDuration: 0.3, animations: {self.closeButton.alpha = 1})
        }
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            return posts.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let photoCell = tableView.dequeueReusableCell(withIdentifier: "photoCell") as! PhotosTableViewCell
            photoCell.photoCellLabel.text = "Photos"
            photoCell.rightArrowLabel.text = "->"
            photoCell.firstPhotoImageView.image = UIImage(named: "photo1")
            photoCell.secondPhotoImageView.image = UIImage(named: "photo2")
            photoCell.thirdPhotoImageView.image = UIImage(named: "photo3")
            photoCell.fourthPhotoImageView.image = UIImage(named: "photo4")
            return photoCell
        }
        else {
            let postCell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
            
            postCell.likedDelegate = self
            
            if isLike {
                posts[indexPath.row].likes += 1
                isLike = false
            }
            
            let post = posts[indexPath.row]
            postCell.selectionStyle = .none
            postCell.autorLabel.text = post.author
            postCell.pictureImageView.image = UIImage(named: post.image)
            postCell.descriptionLabel.text = post.description
            postCell.likesLabel.text = "Likes: \(post.likes)"
            postCell.viewsLabel.text = "Views: \(post.views)"
            return postCell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProfileHeaderView") as! ProfileHeaderView
            headerView.tapGestureRecognizer.addTarget(self, action: #selector(handleTapGesture(_:)))
            return headerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 220
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 10
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            self.navigationController?.pushViewController(PhotosViewController(), animated: true)
        }
        else {
            let fullPostViewController = FullPostViewController()
            fullPostViewController.postAuthor = posts[indexPath.row].author
            fullPostViewController.postDescription = posts[indexPath.row].description
            fullPostViewController.postImage = posts[indexPath.row].image
            fullPostViewController.postLikes = posts[indexPath.row].likes
            fullPostViewController.postViews = posts[indexPath.row].views + 1
            fullPostViewController.postNumber = indexPath.row
            posts[indexPath.row].views += 1
            self.profileTableView.reloadRows(at: [indexPath], with: .none)
            navigationController?.pushViewController(fullPostViewController, animated: true)
        }
    }
}

extension ProfileViewController {
    
    func fetchData() -> [PostModel] {
        let firstPost = PostModel.init(author: "Sam", description: "Описание первого поста", image: "silentHill", likes: 10, views: 21)
        let secondPost = PostModel.init(author: "John", description: "Описание второго поста", image: "spiderMan", likes: 342, views: 12)
        let thirdPost = PostModel.init(author: "Kate", description: "Описание третьего поста", image: "harryPotter", likes: 76, views: 8)
        let fourthPost = PostModel.init(author: "Alex", description: "Описание четвертого поста", image: "hobbit", likes: 3, views: 190)
        
        return [firstPost,secondPost,thirdPost,fourthPost]
    }
}
