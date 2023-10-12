//
//  LoginViewModel.swift
//  Threads
//
//  Created by O'lmasbek on 04/10/23.
//

import Foundation


class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(withEmain: email, password: password)
    }
}
