//
//  RegistrationViewModel.swift
//  Threads
//
//  Created by O'lmasbek on 04/10/23.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    @Published var username = ""
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, fullname: fullname, username: username)
    }
}
