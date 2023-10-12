//
//  FeedViewModel.swift
//  Threads
//
//  Created by O'lmasbek on 06/10/23.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var threads: [Thread] = []
    
    init() {
        Task { try await fetchThreads() }
    }
    
    @MainActor
    func fetchThreads() async throws {
        self.threads = try await ThreadsService.fetchThreads()
        try await fetchUserDataForThreads()
    }
    
    @MainActor
    func fetchUserDataForThreads() async throws {
        for i in 0 ..< threads.count {
            let thread = threads[i]
            let ownerUid = thread.ownerUid
            let threadUser = try await UserService.shared.fetchUser(with: ownerUid)
            
            threads[i].user = threadUser
        }
    }
}
