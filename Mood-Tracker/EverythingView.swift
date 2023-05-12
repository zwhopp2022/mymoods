//
//  EverythingView.swift
//  Mood-Tracker
//
//  Created by Zachary Hopp on 3/7/23.
//

import SwiftUI



struct EverythingView: View {
    
    @State private var isScrollExpanded = false
    @State private var selectedScrollNum = 1
    var feelingInputs = moodDB.retrieveReasons(moodTable: "everything")
    var count: Int = 1
    let backgroundGradient1 = LinearGradient(colors: [Color.green, Color.yellow, Color.gray, Color.cyan, Color.blue, Color.red, Color.red], startPoint: .top, endPoint: .bottom)
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
        
    var body: some View {
        ZStack{
            Color("Background").ignoresSafeArea()
            VStack{
                Image("EveryFace")
                    .padding()
                    .frame(width: 350)
                    .frame(height: 110)
                
                Spacer()
                    .frame(height: 565)
            }
            VStack{
                Spacer()
                    .frame(height: 175)
                DisclosureGroup("All of your Entries", isExpanded: $isScrollExpanded) {
                    ScrollView{
                        VStack{
                            ForEach(moodDB.retrieveReasons(moodTable: "everything"), id: \.self) { input in Text("\(input.timeDate) \n\(input.mood): \(input.reason)")
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
                    NavBar()
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct EverythingView_Previews: PreviewProvider {
    static var previews: some View {
        EverythingView()
    }
}
