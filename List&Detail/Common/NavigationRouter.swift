//
//  NavigationRouter.swift
//  List&Detail
//
//  Created by mark jones on 23/02/2026.
//

import SwiftUI
import Combine

enum Route: Hashable {
    case detailView(post: PostResponseModel)
}

extension Route: View {
        var body: some View {
        switch self {
        case .detailView(post: let post):
            let viewModel = PostDetailViewModel(post: post)
            PostDetailView(viewModel: viewModel)
        }
    }
    
}

class NavigationRouter: ObservableObject {
 
    @Published var routes: [Route] = []
    
    func push(_ route: Route) {
        routes.append(route)
    }
    
    func pop() {
        routes.removeLast()
    }
}
