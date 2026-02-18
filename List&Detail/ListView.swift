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
        List(viewModel.items, id: \.id) { item in
            CardView(title: item.title, subtitle: item.subtitle)
        }
        .onAppear {
            viewModel.fetchTitles()
        }
        .listStyle(.plain)
    }
}

struct CardView: View {
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.headline)
            Text(subtitle)
                .font(.subheadline)
        }
    }
}



#Preview {
    let mockApiClient = MockApiClient()
    let previewViewModel = ListViewModel(apiClient: mockApiClient)
    ListView(viewModel: previewViewModel)
}
