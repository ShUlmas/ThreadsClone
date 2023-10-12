//
//  CurrentUserViewModel.swift
//  Threads
//
//  Created by O'lmasbek on 05/10/23.
//

import Combine

class CurrentUserViewModel: ObservableObject {
    
    @Published var currentUser: User?
    private var cancellabes = Set<AnyCancellable>()
    
    init() {
        setUpSubscribers()
    }
    
    private func setUpSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            print("Debug view model current user is : \(self?.currentUser ?? User(id: "", fullname: "", email: "", username: ""))")
        }.store(in: &cancellabes)
    }
}
