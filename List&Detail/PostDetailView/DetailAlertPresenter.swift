//
//  DetailAlertPresenter.swift
//  List&Detail
//
//  Created by mark jones on 23/02/2026.
//

import Combine

enum DetailAlertType {
    case fetchPostByIdFailure
    case unknownError
}

class DetailAlertPresenter: ObservableObject {
    
    @Published var isPresented = false
    private var type: DetailAlertType
    
    init(type: DetailAlertType) {
        self.type = type
    }
    
    var title: String {
        switch type {
        case .fetchPostByIdFailure, .unknownError:
            Constants.Error.alertTitle
        }
    }
        
    var message: String {
        switch type {
        case .fetchPostByIdFailure:
            Constants.Error.postByIdErrorMessage
        case .unknownError:
            Constants.Error.unknownErrorMessage
        }
    }
}
