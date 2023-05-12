//
//  SaddestDisplay.swift
//  Mood-Tracker
//
//  Created by Rudra Pratap Singh on 3/3/23.
//

import SwiftUI

struct SaddestDisplay: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var isScrollExpanded = false
    @State private var selectedScrollNum = 1
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.indigo.ignoresSafeArea()
                VStack{
                    Image("Saddest")
                        .padding()
                        .frame(width: 350)
                        .frame(height: 110)
                    
                    Spacer()
                        .frame(height: 565)
                }
                VStack {
                    Spacer()
                        .frame(height: 175)
                        .font(.system(size:28))
                        .font(.title3)
                    DisclosureGroup("Your entries", isExpanded:
                                        $isScrollExpanded) {
                        ScrollView {
                            VStack {
                                ForEach(moodDB.retrieveReasons(moodTable: "saddest"), id: \.self) { input in
                                    Text("\(input.timeDate) \n\(input.reason)")
                                        .frame(maxWidth: .infinity)
                                        .font(.title3)
                                        .foregroundColor(colorScheme == .dark ? .white : .black)
                                        .padding(.all).onTapGesture {
                                            withAnimation {
                                                self.isScrollExpanded.toggle()
                                                
                                            }
                                        }
                                }
                            }
                        }.frame(height:400)
                    }.accentColor(.white)
                     .foregroundColor(colorScheme == .dark ? .white : .black)
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.all)
                        .background(Color("Background"))
                        .cornerRadius(20)
                    
                    Spacer()
                }.padding(.all)
                VStack {
                    Spacer()
                        .frame(height: 675)
                    
                        NavBar()
                }
            }
        }
    }
}

struct SaddestDisplay_Previews: PreviewProvider {
    static var previews: some View {
        SaddestDisplay()
    }
}
