//
//  ExploreView.swift
//  Threads
//
//  Created by O'lmasbek on 03/10/23.
//

import SwiftUI

struct ExploreView: View {
    
    @StateObject var viewModel = ExploreViewModel()
    @State var search = ""
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            SearchableUserCell(user: user)
                            
                        }
                        Divider()
                        .padding(.leading, 72)
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .searchable(text: $search)
            .navigationTitle("Search")
        }
       
    }
}

#Preview {
    ExploreView()
}
