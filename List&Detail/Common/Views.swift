//
//  PostCardView.swift
//  List&Detail
//
//  Created by mark jones on 19/02/2026.
//

import SwiftUI

struct PostCardView: View {
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

struct Divider: View {
    var height: CGFloat = 3
    
    var body: some View {
        VStack() {
            Rectangle().frame(height: height)
                .foregroundStyle(.gray.opacity(0.4))
                .padding(.vertical, Style.Spacing.defaultVerticalSpacing)
        }
    }
}

