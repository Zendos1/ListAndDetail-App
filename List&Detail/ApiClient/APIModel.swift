//
//  APIModel.swift
//  List&Detail
//
//  Created by mark jones on 18/02/2026.
//

import Foundation

// MARK: PostResponseModel

struct PostResponseModel: Codable, Hashable {

    var userId: Int
    var postId: Int
    var title: String
    var body: String
    
    enum CodingKeys: String, CodingKey {
        case userId, title, body
        case postId = "id"
    }
}

extension PostResponseModel {
     static let mock = PostResponseModel(userId: 1,
                                         postId: 1,
                                         title: "One mocked title",
                                         body: "mocked body one")
}

// MARK: CommentResponseModel

struct CommentResponseModel: Codable {
   
    var postId: Int
    var commentId: Int
    var name: String
    var email: String
    var body: String
    
    enum CodingKeys: String, CodingKey {
        case postId, name, email, body
        case commentId = "id"
    }
}

extension CommentResponseModel {
    static let mock = CommentResponseModel(postId: 99,
                                           commentId: 100,
                                           name: "Mark Jones mock",
                                           email: "mark@mock.com",
                                           body: "mock body")
}

