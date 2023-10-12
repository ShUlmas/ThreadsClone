//
//  FeedView.swift
//  Threads
//
//  Created by O'lmasbek on 03/10/23.

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    @State private var isLoading = true // Boshlang'ich holati "loading" ko'rsatilishi uchun

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    if isLoading {
                        ProgressView()
                            .onAppear {
                                Task {
                                    try await viewModel.fetchThreads()
                                    isLoading = false // Malumotlarni olish tugaganidan keyin "loading" o'chiriladi
                            }
                        }
                    } else {
                        ScrollView(showsIndicators: false) {
                            LazyVStack {
                                ForEach(viewModel.threads) { thread in
                                    ThreadCell(thread: thread)
                                }
                            }
                        }
                        .refreshable {
                            Task {
                                try await viewModel.fetchThreads()
                            }
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("threads-app-icon")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
        }
    }
}
