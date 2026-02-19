//
//  AlertPresenter.swift
//  List&Detail
//
//  Created by mark jones on 19/02/2026.
//

import Combine

enum AlertType {
    case fetchAllPostFailure
    case unknownError
}

class AlertPresenter: ObservableObject {
    var isPresented = false
    var type: AlertType
    
    init(type: AlertType) {
        self.type = type
    }
    
    var title: String {
        switch type {
        case .fetchAllPostFailure, .unknownError:
            return Constants.Error.alertTitle
        }
    }
    
    var message: String {
        switch type {
        case .fetchAllPostFailure:
            return Constants.Error.allPostsErrorMessage
        case .unknownError:
            return Constants.Error.unknownErrorMessage
        }
    }
}
