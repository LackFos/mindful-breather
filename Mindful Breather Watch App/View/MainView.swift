//
//  ContentView.swift
//  Mindful Breather Watch App
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
                    .foregroundColor(Color("Text"))
                    .background(Color("Secondary"))
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
        .background(Color("Primary"))
    }
}

#Preview {
    MainView()
}
