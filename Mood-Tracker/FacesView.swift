//
//  FacesView.swift
//  Mood-Tracker
//
//  Created by Zachary Hopp on 2/18/23.
//

import SwiftUI

// background color gradient
let backgroundGradient = LinearGradient(colors: [Color.blue, Color.green, Color.yellow, Color.red], startPoint: .top, endPoint: .bottom)

let moodDB = MoodDatabase()

struct FacesView: View {
    @State private var moveToSaddest = false
    @State private var moveToHappiest = false
    var body: some View {
        NavigationStack{
            ZStack {
                backgroundGradient.ignoresSafeArea()
                    .blur(radius: 100)
                VStack{
                    Text("How are you doing?")
                        .bold()
                        .foregroundColor(.black)
                        .font(.system(size: 38))
                    Spacer()
                    HStack(spacing: -80){
                        // happiest button
                        NavigationLink {
                            HappiestLog()
                        } label: {
                            Image("Happiest")
                        }
                        // saddest button
                        NavigationLink {
                            SaddestLog()
                        } label: {
                            Image("Saddest")
                        }
                    }
                    HStack(spacing: -80){
                        // Happy button
                        NavigationLink {
                            HappyLog()
                        } label: {
                            Image("Happy")
                        }
                        // sad button
                        NavigationLink {
                            SadLog()
                        } label: {
                            Image("Sad")
                        }
                    }
                    HStack(spacing: -80){
                        // Neutral button
                        NavigationLink {
                            NeutralLog()
                        } label: {
                            Image("neutral")
                        }
                        // Angriest button
                        NavigationLink {
                            EverythingView()
                        } label: {
                            Image("Angriest")
                        }
                    }
                    Spacer()
                        .frame(height:140)
                }.padding()
            }
        }
    }
    }

struct FacesView_Previews: PreviewProvider {
    static var previews: some View {
        FacesView()
    }
}
