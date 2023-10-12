//
//  CreateThreadViewModel.swift
//  Threads
//
//  Created by O'lmasbek on 05/10/23.
//

import Firebase

class CreateThreadViewModel: ObservableObject {
    
    @MainActor
    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(ownerUid: uid, caption: caption, timeStamp: Timestamp(), likes: 0)
        
        try await ThreadsService.uploadThread(thread)
        
    }
}
