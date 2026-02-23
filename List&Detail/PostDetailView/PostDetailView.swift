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
        ScrollView {
            if viewModel.isLoading {
                ProgressView().controlSize(.large)
                    .padding(.vertical, Style.Spacing.progressScrollViewPadding)
            } else if viewModel.post == nil {
                ContentUnavailableView(Constants.PostDetail.emptyStateMessage,
                                       systemImage: Style.Images.emptyStateImage)
            } else if let post = viewModel.post {
                VStack(alignment: .leading) {
                    PostCardView(userId: post.userId,
                                 postId: post.postId,
                                 title: post.title,
                                 postbody: post.body)
                    Divider()
                    Section {
                        Text(Constants.PostDetail.sectionHeaderTitle).font(Style.Fonts.titleFont)
                    }
                }
            }
        }
        .padding(.horizontal, Style.Spacing.defaultPadding)
        .navigationTitle(Constants.PostDetail.navTitle)
        .task {
            await viewModel.fetchPost()
        }
    }
}

#Preview {
    let router = NavigationRouter()
    let mockApiClient = MockApiClient(willFail: true, withDelay: true)
    let mockViewModel = PostDetailViewModel(apiClient: mockApiClient,
                                            postId: 1)
    PostDetailView(viewModel: mockViewModel)
}

