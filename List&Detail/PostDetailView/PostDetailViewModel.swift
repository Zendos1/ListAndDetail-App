//
//  PostDetailViewModel.swift
//  List&Detail
//
//  Created by mark jones on 23/02/2026.
//

import Combine

class PostDetailViewModel: ObservableObject {
    
    private var apiClient: APIClientProtocol
    @Published var post: PostResponseModel
    @Published var isPostUpdated = false
    @Published var comments: [CommentResponseModel] = []
    @Published var isCommentsLoading = false
    @Published var alertPresenter: DetailAlertPresenter = .init(type: .unknownError)
    
    init(apiClient: APIClientProtocol = ApiClient(),
         post: PostResponseModel) {
        self.apiClient = apiClient
        self.post = post
    }
    
    func fetchUpdatedPost() async {
        do {
            post = try await apiClient.fetchPost(id: post.postId)
            try await Task.sleep(nanoseconds: 1_000_000_000)
            isPostUpdated = true
        } catch let error {
            handleError(error)
        }
     }
    
    func fetchComments() async {
        isCommentsLoading = true
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            comments = try await apiClient.fetchComments(for: post.postId)
            isCommentsLoading = false
        } catch let error {
            isCommentsLoading = false
            handleError(error)
        }
    }
    
    @MainActor func handleError(_ error: Error) {
        alertPresenter = .init(type: .fetchPostByIdFailure)
        alertPresenter.isPresented = true
    }
}


