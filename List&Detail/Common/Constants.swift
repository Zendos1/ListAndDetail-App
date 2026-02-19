//
//  Constants.swift
//  List&Detail
//
//  Created by mark jones on 19/02/2026.
//


struct Constants {

    enum ListView {
        static let userIdLabel = "UserId: "
        static let postIdLabel = "PostId: "
        static let emptyStateMessage = "No posts to display"
    }
    
    enum ApiClient {
        static let baseURL = "https://jsonplaceholder.typicode.com"
        static let postsEndpoint = "/posts"
        static let baseUrlFailure = "Failed to create URL from baseUrl string"
        static let badServerResponse = "Bad Server Response"
    }
    
    enum Error {
        static let alertTitle = "Error"
        static let allPostsErrorMessage = "There was an error while retrieving posts from the server."
        static let allPostsErrorAlertRetry = "Retry"
        static let unknownErrorMessage = "An unknown error has occurred."
        static let alertConfirm = "OK"
    }
}


