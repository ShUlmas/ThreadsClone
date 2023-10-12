//
//  Thread.swift
//  Threads
//
//  Created by O'lmasbek on 05/10/23.
//

import FirebaseFirestoreSwift
import Firebase

struct Thread: Identifiable, Codable {
    @DocumentID var threadId: String?
    
    let ownerUid: String
    let caption: String
    let timeStamp: Timestamp
    var likes: Int
    
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
    
    var user: User?
}
