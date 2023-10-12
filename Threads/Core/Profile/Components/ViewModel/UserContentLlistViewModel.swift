//
//  UserContentLlistViewModel.swift
//  Threads
//
//  Created by O'lmasbek on 07/10/23.
//

import Foundation

class UserContentLlistViewModel: ObservableObject {
    @Published var threads: [Thread] = []
    
    let user: User
    
    init(user: User) {
        self.user = user
        Task { try await fetchUserThreads() }
    }
    
    @MainActor
    func fetchUserThreads() async throws {
        var threads = try await ThreadsService.fetchUserThreads(with: user.id)
        
        for i in 0 ..< threads.count {
            threads[i].user = self.user
        }
        self.threads = threads
    }
}
