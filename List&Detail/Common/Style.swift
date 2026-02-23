//
//  Style.swift
//  List&Detail
//
//  Created by mark jones on 19/02/2026.
//

import Foundation
import SwiftUI

struct Style {
    enum Images {
        static let emptyStateImage = "exclamationmark.shield"
    }
    
    enum Spacing {
        static let defaultVerticalSpacing: CGFloat = 4
        static let defaultPadding: CGFloat = 16
        static let progressScrollViewPadding: CGFloat = 80
    }
    
    enum TextSize {
        static let titleFontSize: CGFloat = 34
    }
    
    enum Fonts {
        static let titleFont: Font = .system(size: TextSize.titleFontSize, weight: .bold)
    }
}
