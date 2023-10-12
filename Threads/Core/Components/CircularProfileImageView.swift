//
//  CircularProfileImageView.swift
//  Threads
//
//  Created by O'lmasbek on 03/10/23.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xxSmall
    case small
    case medium
    case large
    
    var dimension: CGFloat {
        switch self {
        case .xxSmall:
            return 18
        case .small:
            return 42
        case .medium:
            return 56
        case .large:
            return 64
        }
    }
}

struct CircularProfileImageView: View {
    var user: User?
    var imageSize: ProfileImageSize
    
    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: imageSize.dimension, height: imageSize.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .foregroundStyle(Color(.systemGray5))
                .frame(width: imageSize.dimension, height: imageSize.dimension)
        }
    }
}

#Preview {
    CircularProfileImageView(user: DefaultData.shared.user, imageSize: .large)
}
