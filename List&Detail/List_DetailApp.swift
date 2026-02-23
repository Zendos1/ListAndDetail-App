//
//  List_DetailApp.swift
//  List&Detail
//
//  Created by mark jones on 17/02/2026.
//

import SwiftUI

@main
struct List_DetailApp: App {
    
    @StateObject var router = NavigationRouter()
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(router)
            
            /// Mocking viewmodel to test behaviours
//            let mockApiClient = MockApiClient(willFail: true,
//                                              withDelay: true)
//            let previewViewModel = ListViewModel(apiClient: mockApiClient)
//            ListView(viewModel: previewViewModel)
        }
    }
}
