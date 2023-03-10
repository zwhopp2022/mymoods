//
//  SadDisplay.swift
//  Mood-Tracker
//
//  Created by Rudra Pratap Singh on 3/3/23.
//

import SwiftUI

struct SadDisplay: View {
    
    @State private var isScrollExpanded = false
    @State private var selectedScrollNum = 1
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.cyan.ignoresSafeArea()
                VStack{
                    Image("Sad")
                        .padding()
                        .frame(width: 350)
                        .frame(height: 110)
                    
                    Spacer()
                        .frame(height: 565)
                }
                VStack {
                    Spacer()
                        .frame(height: 175)
                        .font(.largeTitle)
                        .font(.title3)
                    DisclosureGroup("Your entries", isExpanded:
                                        $isScrollExpanded) {
                        ScrollView {
                            VStack {
                                ForEach(moodDB.retrieveReasons(moodTable: "sad"), id: \.self) { input in
                                    Text("\(input.reason)")
                                        .frame(maxWidth: .infinity)
                                        .font(.title3)
                                        .padding(.all).onTapGesture {
                                            withAnimation {
                                                self.isScrollExpanded.toggle()
                                                
                                            }
                                        }
                                }
                            }
                        }.frame(height:400)
                    }.accentColor(.white)
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.all)
                        .background(Color.blue)
                        .cornerRadius(20)
                    
                    Spacer()
                }.padding(.all)
                VStack {
                    Spacer()
                        .frame(height: 675)
                    HStack() {
                        NavigationLink ("Back"){
                            SadLog()
                        }
                    }
                }
            }
        }
    }
}

struct SadDisplay_Previews: PreviewProvider {
    static var previews: some View {
        SadDisplay()
    }
}
