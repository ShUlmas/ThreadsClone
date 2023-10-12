//
//  ContentViewModel.swift
//  Threads
//
//  Created by O'lmasbek on 04/10/23.
//

import Firebase
import Combine


class ContentViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    private var cansellables = Set<AnyCancellable>()
    
    init() {
        setUpSubscribers()
    }
    
    private func setUpSubscribers() {
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cansellables)
    }
}
