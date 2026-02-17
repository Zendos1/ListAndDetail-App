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

struct APIModel: Codable {
    var id: UUID = UUID()
    var title: String
    var subtitle: String
}


protocol APIClientProtocol {
    func fetchContent() -> [APIModel]
}

class ApiClient: APIClientProtocol {
    
    func fetchContent() -> [APIModel] {
        [APIModel(title: "Star Wars", subtitle: "The Mandalorian"),
         APIModel(title: "Star Wars", subtitle: "Andor"),
         APIModel(title: "Star Trek", subtitle: "First Contact"),
         APIModel(title: "Star Trek", subtitle: "The undiscovered country")]
    }
}
