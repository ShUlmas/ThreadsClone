//
//  ProfileThreadFilter.swift
//  Threads
//
//  Created by O'lmasbek on 03/10/23.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    
    case threads
    case replies
    case reports
    
    var title: String {
        switch self {
        case .threads:
            return "Threads"
        case .replies:
            return "Replies"
        case .reports:
            return "Reports"
        }
        
    }
    
    var id: Int { return self.rawValue }
    
}
