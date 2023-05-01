//
//  Progress.swift
//  Mood-Tracker
//
//  Created by Jack McLean on 4/30/23.
//

import Foundation
import SwiftUI

struct Progress: View {
    public var value: Float
    @State var progressValue: Float = Float(userLevel.getCurrentXp())
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width * 0.67, height: geometry.size.height * 0.33)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemTeal))
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width * 0.67, geometry.size.width * 0.67), height: geometry.size.height * 0.33)
                    .foregroundColor(Color(UIColor.systemBlue))
            }.cornerRadius(45.0)
            VStack {
                Progress(value: progressValue).frame(height: 20)
                
                Button(action: {
                    self.startProgress()
                }) {
                    Text("Start")
                }
                
                Button(action: {
                    self.resetProgressBar()
                }) {
                    Text("Reset")
                }
                Spacer()
            }.padding()
        }
    }
    func startProgress() {
        for _ in 0...80 {
            self.progressValue += 0.015
        }
    }
    
    func resetProgressBar() {
        self.progressValue = 0.0
    }
}
