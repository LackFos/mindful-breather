//
//  ContentView.swift
//  Mindful Breather
//
//  Created by Elvis on 17/07/25.
//

import SwiftUI

struct MainView: View {
    enum PageEnum {
        case session
    }
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            // MARK: Link Button
            NavigationLink(value: PageEnum.session) {
                Text("START")
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .fontWeight(.bold)
                    .foregroundColor(Color("AppText"))
                    .background(Color("AppSecondary"))
                    .clipShape(.capsule)
            }
            .buttonStyle(.plain)
            
            // MARK: Navigation Handler
            .navigationDestination(for: PageEnum.self) { page in
                switch page {
                case PageEnum.session:
                    SessionView()
                }
            }
        }
        .padding(.horizontal, 8)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("AppPrimary"))
    }
}

#Preview {
    MainView()
}
