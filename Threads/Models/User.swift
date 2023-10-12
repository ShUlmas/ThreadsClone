//
//  User.swift
//  Threads
//
//  Created by O'lmasbek on 04/10/23.
//

import Foundation


struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String? 
}
