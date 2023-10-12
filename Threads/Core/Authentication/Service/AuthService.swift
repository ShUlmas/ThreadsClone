//
//  AuthService.swift
//  Threads
//
//  Created by O'lmasbek on 04/10/23.
//

import Firebase
import FirebaseFirestoreSwift

class AuthService {
    
    // user sessionn
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        // har safar kirgan odam current user boladi
        self.userSession = Auth.auth().currentUser
    }
    
    static let shared = AuthService()
    
    @MainActor
    func login(withEmain email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
        } catch {
            print("Debug: login user error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    // user yaratish yaratish
    func createUser(email: String, password: String, fullname: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(email: email, password: password, fullname: fullname, username: username, id: result.user.uid)
        } catch {
            print("Debug: create user error \(error.localizedDescription)")
        }
    }
    
    // firebaseda user degan collection yaratib userlar malumotlarini shu collectionga yuklaydi
    @MainActor
    func uploadUserData(email: String, password: String, fullname: String, username: String, id: String) async throws {
        let user = User(id: id, fullname: fullname, email: email, username: username)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        
        UserService.shared.currentUser = user
    }
    
    func signOut() {
        try? Auth.auth().signOut() // sign out in backent
        self.userSession = nil // this remove session locally and updates routing
        UserService.shared.reset()
    }
}
