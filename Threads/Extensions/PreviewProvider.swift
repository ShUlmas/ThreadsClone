//
//  PreviewProvider.swift
//  Threads
//
//  Created by O'lmasbek on 05/10/23.
//

import SwiftUI
import Firebase

class DefaultData {
    static let shared = DefaultData()
    
    let user = User(id: NSUUID().uuidString, fullname: "defaultName", email: "defaultEmail", username: "defaultUsername")
    let thread = Thread(ownerUid: "default", caption: "default", timeStamp: Timestamp(), likes: 0)
}
