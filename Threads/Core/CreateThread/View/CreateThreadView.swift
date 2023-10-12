//
//  CreateThreadView.swift
//  Threads
//
//  Created by O'lmasbek on 03/10/23.
//

import SwiftUI
import Combine

struct CreateThreadView: View {
    
    @StateObject var viewModel = CreateThreadViewModel()
    @State var newThread: String = ""
    @State var rectangleHeight: CGFloat = 43
    @Environment(\.dismiss) var dismiss
    
    private var user: User? {
        return UserService.shared.currentUser
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top, spacing: 12) {
                    VStack(spacing: 12) {
                        CircularProfileImageView(user: user, imageSize: .small)
                            .padding(.top, 4)
                        RoundedRectangle(cornerRadius: 1)
                            .fill(Color(.systemGray5))
                            .frame(width: 2, height: rectangleHeight)
                        
                        CircularProfileImageView(user: nil, imageSize: .xxSmall)
                            .foregroundStyle(Color(.systemGray5))
                    }
                    VStack(alignment: .leading) {
                        Text(user?.username ?? "not available")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        TextField(text: $newThread, axis: .vertical) {
                            GeometryReader { geometry in
                                Text("Start a thread...")
                                    .font(.subheadline)
                                    .foregroundStyle(.gray)
                                    .frame(maxWidth: .infinity)
                                    .lineLimit(nil)
                            }
                        }
                        
                        .padding(.bottom)
                        Button {
                            //Action
                        } label: {
                            Image(systemName: "paperclip")
                                .foregroundStyle(.gray)
                        }
                        .padding(.bottom)
                        Text("Add to thread")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("New thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .font(.subheadline)
                            .foregroundStyle(Color.black)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        Task {
                            try await viewModel.uploadThread(caption: newThread)
                        }
                        dismiss()
                    } label: {
                        Text("Post")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundStyle(newThread.isEmpty ? Color(.systemGray4) : Color.black)
                    }
                    .disabled(newThread.isEmpty)
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

extension String {
    var numberOfLines: Int {
        return self.components(separatedBy: .newlines).count
    }
}

#Preview {
    CreateThreadView()
}
