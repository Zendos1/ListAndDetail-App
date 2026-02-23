//
//  PostDetailViewModel.swift
//  List&Detail
//
//  Created by mark jones on 23/02/2026.
//

import Combine

class PostDetailViewModel: ObservableObject {
    
    private var apiClient: APIClientProtocol
    private var postId: Int
    @Published var post: PostResponseModel?
    
    init(apiClient: APIClientProtocol = ApiClient(),
         postId: Int) {
        self.apiClient = apiClient
        self.postId = postId
    }
}
