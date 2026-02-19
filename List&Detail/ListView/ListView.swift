//
//  ListView.swift
//  List&Detail
//
//  Created by mark jones on 17/02/2026.
//

import SwiftUI

struct ListView: View {
    
    @StateObject var viewModel = ListViewModel()
    
    init(viewModel: ListViewModel = ListViewModel()) {
        _viewModel = .init(wrappedValue: viewModel)
    }
    
    var body: some View {
        List(viewModel.items, id: \.postId) { item in
            CardView(userId: item.userId,
                     postId: item.postId,
                     title: item.title,
                     postbody: item.body)
        }
        .listStyle(.plain)
        .task {
            await viewModel.fetchAllPosts()
        }
    }
}

struct CardView: View {
    var userId: Int
    var postId: Int
    var title: String
    var postbody: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(Constants.ListView.userIdLabel + "\(userId)")
            Text(Constants.ListView.postIdLabel + "\(postId)")
            Text(title)
                .font(.headline)
            Text(postbody)
                .font(.subheadline)
        }
    }
}



#Preview {
    let mockApiClient = MockApiClient()
    let previewViewModel = ListViewModel(apiClient: mockApiClient)
    ListView(viewModel: previewViewModel)
}
