//
//  MockApiClient.swift
//  List&Detail
//
//  Created by mark jones on 18/02/2026.
//

import Foundation

class MockApiClient: APIClientProtocol {
    
    var willFail: Bool
    var withDelay: Bool
    
    init(willFail: Bool = false, withDelay: Bool = false) {
        self.willFail = willFail
        self.withDelay = withDelay
    }
    
    func fetchAllPosts() async throws -> [AllPostsResponse] {
        
        if withDelay {
            try await Task.sleep(nanoseconds: 2_500_000_000)
        }
        
        if willFail {
            throw NSError(domain: "MockApiClient", code: 1, userInfo: nil)
        } else {
            return [AllPostsResponse(userId: 1,
                                     postId: 1,
                                     title: "One title",
                                     body: "body one"),
                    AllPostsResponse(userId: 2,
                                     postId: 2,
                                     title: "Two title",
                                     body: "body two"),
                    AllPostsResponse(userId: 3,
                                     postId: 3,
                                     title: "Three title",
                                     body: "body three"),
                    AllPostsResponse(userId: 4,
                                     postId: 4,
                                     title: "Four title",
                                     body: "body four")]
        }
    }
}
