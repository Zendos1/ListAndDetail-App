//
//  ApiClient.swift
//  List&Detail
//
//  Created by mark jones on 18/02/2026.
//

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


