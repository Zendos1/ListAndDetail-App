//
//  ListView.swift
//  List&Detail
//
//  Created by mark jones on 17/02/2026.
//

import SwiftUI

struct ListView: View {
    
    @StateObject var viewModel = ListViewModel()
    @EnvironmentObject var router: NavigationRouter
    
    init(viewModel: ListViewModel = ListViewModel()) {
        _viewModel = .init(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack(path: $router.routes) {
            Group {
                if viewModel.isLoading {
                    ProgressView().controlSize(.large)
                } else if viewModel.items.isEmpty {
                    ContentUnavailableView(Constants.ListView.emptyStateMessage,
                                           systemImage: Style.Images.emptyStateImage)
                }
                else {
                    List(viewModel.items, id: \.postId) { item in
                        NavigationLink(value: Route.detailView(postId: item.postId),
                                       label: { PostCardView(userId: item.userId,
                                                             postId: item.postId,
                                                             title: item.title,
                                                             postbody: item.body) })
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle(Constants.ListView.navTitle)
            .navigationDestination(for: Route.self) { $0 }
        }
        .task {
            await viewModel.fetchAllPosts()
        }
        .alert(viewModel.alertPresenter.title,
               isPresented: $viewModel.alertPresenter.isPresented,
               actions: { ListViewAlertActions(alertType: viewModel.alertPresenter.type) },
               message: { Text(viewModel.alertPresenter.message) })
    }
}

#Preview {
    let mockApiClient = MockApiClient()
    let previewViewModel = ListViewModel(apiClient: mockApiClient)
    ListView(viewModel: previewViewModel)
}
