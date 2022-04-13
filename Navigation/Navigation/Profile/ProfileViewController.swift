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
    var posts: [PostModel] = []
    
    private lazy var profileTableView: UITableView = {
        let profileTableView = UITableView()
        posts = fetchData()
        profileTableView.translatesAutoresizingMaskIntoConstraints = false
        profileTableView.dataSource = self
        profileTableView.delegate = self
        profileTableView.register(PostTableViewCell.self, forCellReuseIdentifier: "postCell")
        return profileTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillLayoutSubviews() {
        
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
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell") as! PostTableViewCell
        let post = posts[indexPath.row]
        cell.autorLabel.text = post.author
        cell.pictureImageView.image = UIImage(named: post.image)
        cell.descriptionLabel.text = post.description
        cell.likesLabel.text = "Likes: \(post.likes)"
        cell.viewsLabel.text = "Views: \(post.views)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        profileTableView.translatesAutoresizingMaskIntoConstraints = false
        return profileHeaderView
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
