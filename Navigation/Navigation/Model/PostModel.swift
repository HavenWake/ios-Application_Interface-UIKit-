//
//  Post.swift
//  Navigation
//
//  Created by Семён Пряничников on 11.04.2022.
//

import Foundation

struct PostModel {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

var posts: [PostModel] = []

//func fetchData() -> [PostModel] {
//    let firstPost = PostModel.init(author: "Sam", description: "Описание первого поста", image: "silentHill", likes: 10, views: 21)
//    let secondPost = PostModel.init(author: "John", description: "Описание второго поста", image: "spiderMan", likes: 342, views: 12)
//    let thirdPost = PostModel.init(author: "Kate", description: "Описание третьего поста", image: "harryPotter", likes: 76, views: 8)
//    let fourthPost = PostModel.init(author: "Alex", description: "Описание четвертого поста", image: "hobbit", likes: 3, views: 190)
//
//    return [firstPost,secondPost,thirdPost,fourthPost]
//}
