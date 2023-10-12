//
//  RegistrationView.swift
//  Threads
//
//  Created by O'lmasbek on 02/10/23.
//

import SwiftUI

struct RegistrationView: View {


    @StateObject var viewModel = RegistrationViewModel()
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image("threads-app-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding(.bottom, 32)
                VStack(spacing: 16) {
                    TextField("Enter your email", text: $viewModel.email)
                        .modifier(ThreadsTextFieldModifier())
                        .keyboardType(.emailAddress)
                    
                    TextField("Enter your password", text: $viewModel.password)
                        .modifier(ThreadsTextFieldModifier())
                    
                    TextField("Enter your fullname", text: $viewModel.fullname)
                        .modifier(ThreadsTextFieldModifier())
                    
                    TextField("Enter your username", text: $viewModel.username)
                        .modifier(ThreadsTextFieldModifier())
                }
                .textInputAutocapitalization(.never)
                
                Button {
                    Task { try await viewModel.createUser() }
                } label: {
                    Text("Sign up")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.white)
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(16)
                }
                
                Spacer()
                Divider()
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 4) {
                        Text("Already have an account?")
                        Text("Sign in")
                            .fontWeight(.bold)
                            
                    }
                    .foregroundStyle(Color.black)
                    .font(.footnote)
                    .padding(.vertical, 16)
                }
            }
        }
    }
}

#Preview {
    RegistrationView()
}
