//
//  SessionView.swift
//  Mindful Breather
//
//  Created by Elvis on 19/07/25.
//

import SwiftUI

struct SessionView: View {
    @State var circleSize: CGFloat = 24
    @State var instructionText: String = "Let's Get Ready"
    
    var body: some View {
        VStack {
            Spacer()
            
            Circle()
                .fill(Color("AppSecondary"))
                .frame(width: circleSize, height: circleSize)
                .task {
                    await gentleBreath(times: 4)
                    await inhale()
                    await exhale()
                    await inhale()
                    await exhale()
                }
            
            Spacer()
            
            Text(instructionText)
                .fontWeight(.bold)
        }
    }
    
    private func gentleBreath(times: Int) async {
        for _ in 0 ..< times {
            // Breath In
            withAnimation(.easeInOut(duration: 1)) {
                circleSize = 40
            }
            
            try? await Task.sleep(for: .seconds(1))
            
            // Breath Out
            withAnimation(.easeInOut(duration: 1)) {
                circleSize = 24
            }
            
            try? await Task.sleep(for: .seconds(1))
        }
    }
    
    private func inhale() async {
        withAnimation(.easeInOut(duration: 4)) {
            circleSize = 140
        }
        
        instructionText = "Breathe In"
        
        try? await Task.sleep(for: .seconds(4))
    }
    
    private func exhale() async {
        
        withAnimation(.timingCurve(0.68, -0.6, 0.32, 0.68, duration: 4)) {
            circleSize = 24
        }
        
        instructionText = "Breathe Out"
        
        try? await Task.sleep(for: .seconds(4))
    }
}

#Preview {
    ZStack {
        SessionView()
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("AppPrimary"))
    }
}
