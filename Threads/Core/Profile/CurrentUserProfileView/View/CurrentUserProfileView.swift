//
//  CurrentUserProfileView.swift
//  Threads
//
//  Created by O'lmasbek on 05/10/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
   
    @StateObject var viewModel = CurrentUserViewModel()
    @State var showEditProfileView: Bool = false
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    if let user = currentUser {
                        ProfileHeaderView(user: user)
                            .padding(.bottom, 24)
                    }
                    HStack(spacing: 24) {
                        Button {
                            showEditProfileView.toggle()
                        } label: {
                            Text("Edit profile")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke()
                                        .fill(Color(.systemGray3))
                                )
                        }
                        
                        Button {
                            // ACTION
                        } label: {
                            Text("Share profile")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.black)
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke()
                                        .fill(Color(.systemGray3))
                                )
                        }
                    }
                    .padding(.bottom)
                    if let user = currentUser {
                        UserContentListView(user: user)
                    }
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .tint(Color.black)
                    }
                }
            }
            .sheet(isPresented: $showEditProfileView) {
                if let user = currentUser {
                    EditProfileView(user: user)
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
