//
//  Sections.swift
//  Daily
//
//  Created by Michael Gillund on 1/6/23.
//

import Foundation

struct Sections: Identifiable, Equatable {
    
    let id = UUID().uuidString
    var icon: String
    var title: String
    var sports: [Event]?
    var leagues: [Leagues]?
    
    static func == (lhs: Sections, rhs: Sections) -> Bool {
        return true
    }
}

enum LoadingState: Equatable {
    case loading
    case success(data: [Sections])
    case failed(error: Error)
    static func == (lhs: LoadingState, rhs: LoadingState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.success(data: let lhsType), .success(data: let rhsType)):
            return lhsType == rhsType
        case (.failed(error: let lhsType), .failed(error: let rhsType)):
            return lhsType.localizedDescription == rhsType.localizedDescription
        default:
            return false
        }
    }
}
