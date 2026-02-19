//
//  MockApiClient.swift
//  List&Detail
//
//  Created by mark jones on 18/02/2026.
//


class MockApiClient: APIClientProtocol {
    
    func fetchAllPosts() async throws -> [AllPostsResponse] {
        [AllPostsResponse(userId: 1, postId: 1, title: "One", body: "body one"),
         AllPostsResponse(userId: 2, postId: 2, title: "Two", body: "body two"),
         AllPostsResponse(userId: 3, postId: 3, title: "Three", body: "body three"),
         AllPostsResponse(userId: 4, postId: 4, title: "Four", body: "body four")]
    }
}
