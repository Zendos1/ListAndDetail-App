//
//  PostCardView.swift
//  List&Detail
//
//  Created by mark jones on 19/02/2026.
//

import SwiftUI

// MARK: - Status Pill

struct StatusPill: View {
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
                .padding(.vertical, Style.Spacing.standard)
        }
    }
}

