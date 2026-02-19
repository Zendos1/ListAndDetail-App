//
//  ListViewModel.swift
//  List&Detail
//
//  Created by mark jones on 17/02/2026.
//

import Combine
import Foundation


class ListViewModel: ObservableObject {
    
    private var apiClient: APIClientProtocol
    @Published var items: [AllPostsResponse] = []
    @Published var isLoading = false
    @Published var alertPresenter: AlertPresenter = .init(type: .unknownError)
    
    init(apiClient: APIClientProtocol = ApiClient()) {
        self.apiClient = apiClient
    }
    
    func fetchAllPosts() async {
        isLoading = true
        do {
            items = try await apiClient.fetchAllPosts()
            isLoading = false
        } catch {
            isLoading = false
            handleError(.fetchAllPostFailure)
        }
    }
    
    @MainActor
    func handleError(_ type: AlertType) {
        Task {
            await MainActor.run {
                alertPresenter = .init(type: type)
                alertPresenter.isPresented = true
            }
        }
    }
}





