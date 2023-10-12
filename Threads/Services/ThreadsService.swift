//
//  ThreadsService.swift
//  Threads
//
//  Created by O'lmasbek on 06/10/23.
//

import Firebase
import FirebaseFirestoreSwift

struct ThreadsService {
    static func uploadThread(_ thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }
    
    static func fetchThreads() async throws -> [Thread] {
        let snapshot = try await Firestore.firestore().collection("threads").order(by: "timeStamp", descending: true).getDocuments()
        return snapshot.documents.compactMap { try? $0.data(as: Thread.self) }
    }
    
    static func fetchUserThreads(with uid: String) async throws -> [Thread] {
        let snapshot = try await Firestore.firestore().collection("threads").whereField("ownerUid", isEqualTo: uid).getDocuments()
        
        let thread = snapshot.documents.compactMap { try? $0.data(as: Thread.self) }
        return thread.sorted(by: { $0.timeStamp.dateValue() > $1.timeStamp.dateValue() })
    }
    
}
