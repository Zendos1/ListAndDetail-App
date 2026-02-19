//
//  ListViewAlertActions.swift
//  List&Detail
//
//  Created by mark jones on 19/02/2026.
//

import SwiftUI

struct ListViewAlertActions: View {
    var alertType: AlertType
    
    var body: some View {
        switch alertType {
        case .fetchAllPostFailure:
            Button(Constants.Error.alertConfirm, role: .confirm) { }
            Button(Constants.Error.allPostsErrorAlertRetry) {
                // TODO: Add Retry Behaviour
                print("retry")
            }
        case .unknownError:
            Button(Constants.Error.alertConfirm, role: .cancel) { }
        }
    }
}
