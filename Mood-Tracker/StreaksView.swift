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
                Color.orange
                    .ignoresSafeArea()
                Circle()
                    .scale(1.8)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.4)
                    .foregroundColor(.white.opacity(0.15))
                VStack {
                    if Streaks().streak < 3 {
                        Image("Sad")
                            .frame(height: 125)
                    }
                    if Streaks().streak >= 3 {
                        Image("Happy")
                            .frame(height: 125)
                    }
                    Text("Current Streak:")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .foregroundColor(Color.white)
                    Text("\(Streaks().streak)")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(Color.white)
                    Spacer()
                            .frame(height: 125)
                }
                VStack {
                    Spacer()
                        .frame(height: 500)
                    HStack() {
                        Button ("Back"){
                            self.mode.wrappedValue.dismiss()
                        }
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct StreaksView_Previews: PreviewProvider {
    static var previews: some View {
        StreaksView()
    }
}
