//
//  EditProfileView.swift
//  Threads
//
//  Created by O'lmasbek on 03/10/23.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    let user: User
    
    @State var bio: String = ""
    @State var link: String = ""
    @State var toggle: Bool = false
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = EditProfileViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground).ignoresSafeArea(edges: [.bottom, .horizontal])
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("username")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Text(user.username)
                                .font(.subheadline)
                        }
                        Spacer()
                        PhotosPicker(selection: $viewModel.selectedItem) {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .scaledToFill()
                                    .frame(width: 56, height: 56)
                            } else {
                                CircularProfileImageView(user: user, imageSize: .medium)
                            }
                        }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    Divider()
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            
                        TextField(text: $bio) {
                            Text("+ Write bio")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    Divider()
                    VStack(alignment: .leading) {
                        Text("Link")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            
                        TextField(text: $link) {
                            Text("+ Add link")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    Divider()
                    Toggle(isOn: $toggle) {
                        Text("Private profil")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    .tint(Color.black)
                    .padding(.vertical, 24)
                    .padding(.horizontal)
                    
                }
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                        .padding()
                }
                
            }
            .navigationTitle("Edit profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        Task {
                            try await viewModel.updateData()
                        }
                        dismiss()
                    } label: {
                        Text("Done")
                            .foregroundStyle(Color.accentColor)
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}

#Preview {
    EditProfileView(user: DefaultData.shared.user)
}
