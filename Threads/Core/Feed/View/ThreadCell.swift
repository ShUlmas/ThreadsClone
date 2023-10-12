//
//  ThreadCell.swift
//  Threads
//
//  Created by O'lmasbek on 03/10/23.
//

import SwiftUI
import Firebase

struct ThreadCell: View {
    
    let thread: Thread
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                CircularProfileImageView(user: thread.user, imageSize: .small)
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Text(thread.user?.fullname ?? "")
                            .font(.footnote)
                            .fontWeight(.bold)
                        Spacer()
                        Text(thread.timeStamp.timestampString())
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(Color(.darkGray))
                        }
                    }
                   
                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    HStack(spacing: 12) {
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "message")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.triangle.2.circlepath")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "paperplane")
                        }
                    }
                    .foregroundStyle(Color.black)
                    .padding(.vertical, 12)
                }
               
            }
            Divider()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 4)
    }
}

#Preview {
    ThreadCell(thread: DefaultData.shared.thread)
}
