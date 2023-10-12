//
//  UserContentListView.swift
//  Threads
//
//  Created by O'lmasbek on 05/10/23.
//

import SwiftUI

struct UserContentListView: View {
    
    @Namespace var animation
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @StateObject var viewModel: UserContentLlistViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: UserContentLlistViewModel(user: user))
    }
    
    var body: some View {
        HStack {
            ForEach(ProfileThreadFilter.allCases) { filter in
                VStack {
                    Text(filter.title)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(selectedFilter == filter ? Color.black : Color.gray)
                    
                    if selectedFilter == filter {
                        Rectangle()
                            .fill(Color.black)
                            .frame(height: 1)
                            .matchedGeometryEffect(id: "item", in: animation)
                    } else {
                        Rectangle()
                            .fill(Color.clear)
                            .frame(height: 1)
                    }
                    
                }
                .onTapGesture {
                    withAnimation(.spring(dampingFraction: 0.6)) {
                        selectedFilter = filter
                    }
                }
            }
        }
        LazyVStack {
            ForEach(viewModel.threads) { thread in
                ThreadCell(thread: thread)
            }
        }
    }
}

#Preview {
    UserContentListView(user: DefaultData.shared.user)
}
