//
//  NavigationRouter.swift
//  List&Detail
//
//  Created by mark jones on 23/02/2026.
//

import SwiftUI
import Combine

enum Route: Hashable {
    case detailView(postId: Int)
}

extension Route: View {
        var body: some View {
        switch self {
        case .detailView(postId: let postId):
            let viewModel = PostDetailViewModel(postId: postId)
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
