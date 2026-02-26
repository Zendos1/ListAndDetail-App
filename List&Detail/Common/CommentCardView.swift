//
//  CommentCardView.swift
//  List&Detail
//
//  Created by mark jones on 26/02/2026.
//

import SwiftUI

struct CommentCardView: View {
    let comment: CommentResponseModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: Style.Spacing.large) {
            
            HStack(alignment: .firstTextBaseline) {
                VStack(alignment: .leading, spacing: Style.Spacing.standard) {
                    Text(Constants.PostDetail.commentNameLabel).cardMetaStyle()
                    Text(comment.name).font(.headline)
                }
                Spacer()
                Text(Constants.PostDetail.commentIdLabel + String(comment.commentId))
                    .cardMetaStyle()
            }
            
            VStack(alignment: .leading, spacing: Style.Spacing.standard) {
                Text(Constants.PostDetail.commentEmailLabel).cardMetaStyle()
                Text(comment.email).font(.subheadline)
            }
        
            Divider()
            
            VStack(alignment: .leading, spacing: Style.Spacing.standard) {
                Text(Constants.PostDetail.commentBodyLabel).cardMetaStyle()
                Text(comment.body).font(.body)
            }
        }
        .padding(Style.Spacing.defaultPadding)
        .background(
            RoundedRectangle(cornerRadius: Style.CornerRadius.standard)
                .fill(.blue).opacity(Style.Opacity.light)
        )
        .overlay(
            RoundedRectangle(cornerRadius: Style.CornerRadius.standard)
                .stroke(Color(.separator))
        )
    }
}

#Preview {
    let comment = CommentResponseModel.mock
    CommentCardView(comment: comment)
        .padding(20)
}
