//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Семён Пряничников on 29.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
    let postTableViewCell = PostTableViewCell()
    let photosTableViewCell = PhotosTableViewCell()
    let photosViewController = PhotosViewController()
    var posts: [PostModel] = []
    
    private lazy var profileTableView: UITableView = {
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
        return profileTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray5
        self.view.addSubview(self.profileTableView)
        self.profileTableView.backgroundColor = .systemGray5
        
        let leadingConstraint = self.profileTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.profileTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let topConstraint = self.profileTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let bottomConstraint = self.profileTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        NSLayoutConstraint.activate([topConstraint,leadingConstraint,trailingConstraint,bottomConstraint])
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
            let post = posts[indexPath.row]
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
            profileTableView.translatesAutoresizingMaskIntoConstraints = false
            return profileHeaderView
        }
        else {
            return nil
        }
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
            self.navigationController?.pushViewController(photosViewController, animated: true)
        }
        else {
            return
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
