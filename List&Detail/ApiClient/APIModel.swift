//
//  APIModel.swift
//  List&Detail
//
//  Created by mark jones on 18/02/2026.
//

import Foundation

struct AllPostsResponse: Codable {

    var userId: Int
    var postId: Int
    var title: String
    var body: String
    
    enum CodingKeys: String, CodingKey {
        case userId, title, body
        case postId = "id"
    }
}
