//
//  CardView.swift
//  List&Detail
//
//  Created by mark jones on 19/02/2026.
//

import SwiftUI

struct CardView: View {
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
