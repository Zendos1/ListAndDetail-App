//
//  PostCardView.swift
//  List&Detail
//
//  Created by mark jones on 19/02/2026.
//

import SwiftUI

// MARK: - PostCardView

struct PostCardView: View {
    var userId: Int
    var postId: Int
    var title: String
    var postbody: String
    
    /// New flag to control the status pill
    var isEdited: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            // Top row with IDs on the left and status pill on the right
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(Constants.ListView.userIdLabel + "\(userId)")
                    Text(Constants.ListView.postIdLabel + "\(postId)")
                }
                Spacer()
                if isEdited {
                    StatusPill()
                }
            }
            Text(title).font(.headline)
            Text(postbody).font(.subheadline)
        }
    }
}

// MARK: CommentsCardView

struct CommentCardView: View {
    let comment: CommentResponseModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .firstTextBaseline) {
                Text(comment.name)
                    .font(.headline)
                    .foregroundStyle(.primary)
                Spacer()
                Text("#\(comment.commentId)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Text(comment.email)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Divider()
            Text(comment.body)
                .font(.body)
                .foregroundStyle(.primary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.blue)).opacity(0.15)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.separator), lineWidth: 0.5)
        )
    }
}

// MARK: - Status Pill

private struct StatusPill: View {
    var body: some View {
        Text("Updated")
            .font(.caption2)
            .fontWeight(.semibold)
            .foregroundStyle(.blue)
            .padding(.horizontal, 8)
            .padding(.vertical, 3)
            .background(
                Capsule().fill(Color.blue.opacity(0.15))
            )
    }
}

// MARK: - Divider

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

