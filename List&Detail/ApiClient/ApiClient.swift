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
         baseUrl: String = Constants.ApiClient.baseURL) {
        guard let baseUrl = URL(string: baseUrl) else {
            fatalError(Constants.ApiClient.baseUrlFailure)
        }
        self.baseUrl = baseUrl
        self.urlSession = urlSession
    }
    
    func fetchAllPosts() async throws -> [AllPostsResponse] {
        let allPostsUrl = baseUrl.appendingPathComponent(Constants.ApiClient.postsEndpoint)
        let request = URLRequest(url: allPostsUrl)
        return try await makeNetworkRequest(request: request)
    }
    
    func makeNetworkRequest<T: Decodable>(request: URLRequest) async throws -> T {
        let (data, response) = try await urlSession.data(for: request)
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
              (200...299).contains(statusCode) else {
            throw NSError(domain: Constants.ApiClient.badServerResponse, code: 0)
        }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch let error {
            throw error
        }
    }
}


