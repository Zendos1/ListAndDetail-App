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
    @Published var items: [APIModel] = []
    
    init(apiClient: APIClientProtocol = ApiClient()) {
        self.apiClient = apiClient
    }
    
    func fetchTitles() {
        items = apiClient.fetchContent()
    }
}





