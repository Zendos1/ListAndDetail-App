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
    @Published var isLoading = false
    @Published var alertPresenter: DetailAlertPresenter = .init(type: .unknownError)
    
    init(apiClient: APIClientProtocol = ApiClient(),
         postId: Int) {
        self.apiClient = apiClient
        self.postId = postId
    }
    
    func fetchPost() async {
        isLoading = true
        do {
            post = try await apiClient.fetchPost(id: postId)
            isLoading = false
        } catch let error {
            isLoading = false
            handleError(error)
        }
     }
    
    @MainActor func handleError(_ error: Error) {
        alertPresenter = .init(type: .fetchPostByIdFailure)
        alertPresenter.isPresented = true
    }
}


