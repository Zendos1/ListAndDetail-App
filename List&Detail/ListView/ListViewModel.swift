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
    
    init(apiClient: APIClientProtocol = ApiClient()) {
        self.apiClient = apiClient
    }
    
    func fetchAllPosts() async {
        do {
           items = try await apiClient.fetchAllPosts()
        } catch {
            fatalError("Fetch All Posts Failed ")
        }
    }
}





