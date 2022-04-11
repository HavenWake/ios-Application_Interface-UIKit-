//
//  Post.swift
//  Navigation
//
//  Created by Семён Пряничников on 11.04.2022.
//

import Foundation

struct PostModel {
    let author: String
    let description: String
    let image: String
    let views: Int
}

let firstPost = PostModel.init(author: "Sam", description: "Описание первого поста", image: "firstPicture", views: 21)
let secondPost = PostModel.init(author: "John", description: "Описание второго поста", image: "SecondPicture", views: 12)
let thirdPost = PostModel.init(author: "Kate", description: "Описание третьего поста", image: "firstPicture", views: 8)
let fourthPost = PostModel.init(author: "Alex", description: "Описание четвертого поста", image: "firstPicture", views: 190)

let postArray = [firstPost, secondPost, thirdPost, fourthPost]

