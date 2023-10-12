//
//  SearchableUserCell.swift
//  Threads
//
//  Created by O'lmasbek on 03/10/23.
//

import SwiftUI

struct SearchableUserCell: View {
    
    let user: User
    
    var body: some View {

        HStack(alignment: .top, spacing: 16) {
            CircularProfileImageView(user: user, imageSize: .small)
            VStack(alignment: .leading, spacing: 18) {
                    VStack(alignment: .leading) {
                        Text(user.fullname)
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        
                        Text(user.username)
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color.gray.opacity(0.7))
                    }
                    Text("1K followers")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
            }
            Spacer()
            Button {
                
            } label: {
                Text("Follow")
                    .foregroundStyle(Color.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke()
                            .fill(Color(.systemGray3))
                    )
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
    }
}

#Preview {
    SearchableUserCell(user: DefaultData.shared.user)
}
