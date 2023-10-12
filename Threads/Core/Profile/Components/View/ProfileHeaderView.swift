//
//  ProfileHeaderView.swift
//  Threads
//
//  Created by O'lmasbek on 05/10/23.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    
    let user: User
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(user.fullname)
                        .font(.title2)
                        .fontWeight(.bold)
                    HStack {
                        Text(user.username)
                            .font(.subheadline)
                        Button {
                            
                        } label: {
                            Text("threads.net")
                                .font(.footnote)
                                .foregroundStyle(Color.gray)
                                .padding(.vertical, 4)
                                .padding(.horizontal, 8)
                                .background(Color(.systemGray5))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
                .padding(.bottom)
                VStack(alignment: .leading, spacing: 8) {
                    if let bio = user.bio {
                        Text(bio)
                            .font(.subheadline)
                    }
                    Text("10K followers")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.gray)
                }
            }
            Spacer()
            CircularProfileImageView(user: user, imageSize: .large)
        }
    }
}

#Preview {
    ProfileHeaderView(user: DefaultData.shared.user)
}
