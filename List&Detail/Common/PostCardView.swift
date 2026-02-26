//
//  PostCardView.swift
//  List&Detail
//
//  Created by mark jones on 26/02/2026.
//

import SwiftUI

struct PostCardView: View {
    var userId: Int
    var postId: Int
    var title: String
    var postbody: String
    var isEdited: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: Style.Spacing.large) {
            
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: Style.Spacing.standard) {
                    HStack {
                        Text(Constants.ListView.userIdLabel)
                        Text("\(userId)")
                    }
                    HStack {
                        Text(Constants.ListView.postIdLabel)
                        Text("\(postId)")
                    }
                }.cardMetaStyle()
                
                Spacer()
                if isEdited {
                    StatusPill()
                }
            }
            
            VStack(alignment: .leading, spacing: Style.Spacing.standard) {
                Text(Constants.ListView.titleLabel).cardMetaStyle()
                Text(title).font(.headline)
            }
            
            VStack(alignment: .leading, spacing: Style.Spacing.standard) {
                Text(Constants.ListView.bodyLabel).cardMetaStyle()
                Text(postbody).font(.subheadline)
            }
        }
    }
}

#Preview {
    let post = PostResponseModel.mock
    PostCardView(userId: post.userId, postId: post.postId, title: post.title, postbody: post.body, isEdited: true)
        .padding(20)
}
