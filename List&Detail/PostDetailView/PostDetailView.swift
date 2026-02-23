//
//  PostDetailView.swift
//  List&Detail
//
//  Created by mark jones on 23/02/2026.
//

import SwiftUI
import Combine

struct PostDetailView: View {
    
    @StateObject var viewModel: PostDetailViewModel
    @EnvironmentObject var router: NavigationRouter
    
    init(viewModel: PostDetailViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
    }
    
    var body: some View {
        Text("Hello, World!")
            .navigationTitle(Constants.PostDetail.navTitle)
    }
}

#Preview {
    let mockApiClient = MockApiClient()
    let mockViewModel = PostDetailViewModel(apiClient: mockApiClient,
                                            postId: 1)
    PostDetailView(viewModel: mockViewModel)
}

