//
//  ApiClient.swift
//  List&Detail
//
//  Created by mark jones on 18/02/2026.
//

import Foundation

protocol APIClientProtocol {
    func fetchAllPosts() async throws -> [AllPostsResponse]
}

class ApiClient: APIClientProtocol {
    
    private var urlSession: URLSession
    private var baseUrl: URL
    
    init(urlSession: URLSession = .shared,
         baseUrl: String = "https://jsonplaceholder.typicode.com") {
        guard let baseUrl = URL(string: baseUrl) else {
            fatalError("Invalid base URL")
        }
        self.baseUrl = baseUrl
        self.urlSession = urlSession
    }
    
    func fetchAllPosts() async throws -> [AllPostsResponse] {
        let allPostsUrl = baseUrl.appendingPathComponent("posts")
        let request = URLRequest(url: allPostsUrl)
        let (data, response) = try await urlSession.data(for: request)
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
              (200...299).contains(statusCode) else {
            throw NSError(domain: "No Api Response", code: 0)
        }
        
        let models = try? JSONDecoder().decode([AllPostsResponse].self, from: data)
        return models ?? []
    }
}


