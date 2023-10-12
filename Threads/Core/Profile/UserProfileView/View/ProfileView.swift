//
//  ProfileView.swift
//  Threads
//
//  Created by O'lmasbek on 03/10/23.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(user: user)
                .padding(.bottom, 24)
                Button {
                    // Action
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.white)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding(.bottom)
                UserContentListView(user: user)
            }
            .padding(.horizontal)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis.circle")
                        .tint(Color.black)
                }
            }
        }
    }
}

#Preview {
    ProfileView(user: DefaultData.shared.user)
}
