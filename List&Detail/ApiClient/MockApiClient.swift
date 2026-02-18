//
//  MockApiClient.swift
//  List&Detail
//
//  Created by mark jones on 18/02/2026.
//


class MockApiClient: APIClientProtocol {
    func fetchContent() -> [APIModel] {
        [APIModel(title: "One", subtitle: "One Subtitle"),
         APIModel(title: "Two", subtitle: "Two Subtitle"),
         APIModel(title: "Three", subtitle: "Three Subtitle"),
         APIModel(title: "Four", subtitle: "Four Subtitle")]
    }
}