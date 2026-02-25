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
            VStack(alignment: .leading) {
                PostCardView(userId: viewModel.post.userId,
                             postId: viewModel.post.postId,
                             title: viewModel.post.title,
                             postbody: viewModel.post.body,
                             isEdited: viewModel.isPostUpdated)
                Divider()
                Section {
                    Text(Constants.PostDetail.sectionHeaderTitle).font(Style.Fonts.titleFont)
                }
                if viewModel.isCommentsLoading {
                    ProgressView().controlSize(.large)
                } else if viewModel.comments.isEmpty {
                    ContentUnavailableView(Constants.PostDetail.commentsEmptyStateMessage,
                                           systemImage: Style.Images.emptyStateImage)
                } else {
                    ForEach(viewModel.comments, id: \.commentId) { comment in
                        CommentCardView(comment: comment)
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.horizontal, Style.Spacing.defaultPadding)
        .navigationTitle(Constants.PostDetail.navTitle)
        .task {
            await viewModel.fetchComments()
            await viewModel.fetchUpdatedPost()
        }
    }
}

#Preview {
    @Previewable @StateObject var router = NavigationRouter()
    let mockApiClient = MockApiClient(willFail: false, withDelay: true)
    let mockPost = PostResponseModel.mock
    let mockViewModel = PostDetailViewModel(apiClient: mockApiClient,
                                            post: mockPost)
    NavigationStack(path: $router.routes) {
        PostDetailView(viewModel: mockViewModel)
            .environmentObject(router)
    }
}
