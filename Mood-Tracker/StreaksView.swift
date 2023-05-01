//
//  StreaksView.swift
//  Mood-Tracker
//
//  Created by Jack McLean on 4/19/23.
//

import SwiftUI

struct StreaksView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            ZStack {
                if userStreak.getStreak() < 3 {
                    Color.blue
                        .ignoresSafeArea()
                    Circle()
                        .scale(1.8)
                        .foregroundColor(.white.opacity(0.15))
                    Circle()
                        .scale(1.4)
                        .foregroundColor(.white.opacity(0.15))
                }
                if userStreak.getStreak() >= 3 {
                    Color.orange
                        .ignoresSafeArea()
                    Circle()
                        .scale(1.8)
                        .foregroundColor(.white.opacity(0.15))
                    Circle()
                        .scale(1.4)
                        .foregroundColor(.white.opacity(0.15))
                }
                VStack {
                    if userStreak.getStreak() < 3 {
                        Image("Ice")
                            .frame(height: 200)
                    }
                    if userStreak.getStreak() >= 3 {
                        Image("Fire")
                            .frame(height: 125)
                            .padding()
                        Text("Current Streak:")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                            .foregroundColor(Color.white)
                        Text("\(userStreak.getStreak())")
                            .font(.largeTitle)
                            .padding()
                            .foregroundColor(Color.white)
                    }
                    Text("XP")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .foregroundColor(Color.white)
                    Text("\(userLevel.getCurrentXp())")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(Color.white)
                    Text("Level: \(userLevel.getCurrentLevel())")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color.white)
                    Spacer()
                        .frame(height: 0)
                    
                }
                VStack {
                    Spacer()
                        .frame(height: 570)
                    HStack() {
                        Button ("Back"){
                            self.mode.wrappedValue.dismiss()
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
        
    }
}

struct StreaksView_Previews: PreviewProvider {
    static var previews: some View {
        StreaksView()
    }
}
