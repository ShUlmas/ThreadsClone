//
//  ExploreViewModel.swift
//  Threads
//
//  Created by O'lmasbek on 05/10/23.
//

import Foundation

class ExploreViewModel: ObservableObject {
    
    @Published var users: [User] = []
    
    init() {
        Task { try await fetchUsers() }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
    
}
