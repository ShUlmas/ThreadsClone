//
//  UserService.swift
//  Threads
//
//  Created by O'lmasbek on 04/10/23.
//

import Firebase
import FirebaseFirestoreSwift

class UserService {
    
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        
    }
    
    static func fetchUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        
        let users = try snapshot.documents.compactMap({ try $0.data(as: User.self) })
        
        guard let currentUid = Auth.auth().currentUser?.uid else { return [] }
        
        return users.filter({ $0.id != currentUid })
    }
    
    @MainActor
    func updateUserProfileImage(withUrl imageUrl: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        try await Firestore.firestore().collection("users").document(currentUid).updateData([
            "profileImageUrl" : imageUrl
        ])
        self.currentUser?.profileImageUrl = imageUrl
    }
    
    func fetchUser(with uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
    
    func reset() {
        self.currentUser = nil
    }
    
}
