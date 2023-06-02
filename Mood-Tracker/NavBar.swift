//
//  NavBar.swift
//  Mood-Tracker
//
//  Created by Zachary Hopp on 5/8/23.
//

import SwiftUI


struct NavBar: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var showNavigationBar = false
    var body: some View {
        if showNavigationBar {
            ZStack {
                Color.clear
                    .ignoresSafeArea()
                HStack {
                    NavigationLink {
                        HappiestDisplay()
                    } label: {
                        Image("Happiest")
                            .resizable()
                            .frame(width: 75, height: 75)
                    }
                    NavigationLink {
                        SaddestDisplay()
                    } label: {
                        Image("Saddest")
                            .resizable()
                            .frame(width: 75, height: 75)
                    }
                    NavigationLink {
                        HappyDisplay()
                    } label: {
                        Image("Happy")
                            .resizable()
                            .frame(width: 75, height: 75)
                    }
                }
            }
            ZStack {
                Color.clear
                    .ignoresSafeArea()
                HStack {
                    NavigationLink {
                        SadDisplay()
                    } label: {
                        Image("Sad")
                            .resizable()
                            .frame(width: 75, height: 75)
                    }
                    NavigationLink {
                        NeutralDisplay()
                    } label: {
                        Image("neutral")
                            .resizable()
                            .frame(width: 75, height: 75)
                    }
                    NavigationLink {
                        AngryDisplay()
                    } label: {
                        Image("Angriest")
                            .resizable()
                            .frame(width: 75, height: 75)
                    }
                }
            }
            ZStack {
                Color.clear
                    .ignoresSafeArea()
                HStack {
                    NavigationLink {
                        EverythingView()
                    } label: { Image(colorScheme == .light ? "book" : "bookWhite")}
                }
            }
        }
        ZStack {
            Color.clear
                .ignoresSafeArea()
            NavigationStack {
                HStack {
                    NavigationLink {
                        FacesView()
                    } label: { Image(colorScheme == .light ? "smile" : "smileWhite")}
                    Spacer()
                        .frame(width: 50)
                    NavigationLink {
                        StreaksView()
                    } label: { Image(colorScheme == .light ? "medal" : "medalWhite") }
                    Spacer()
                        .frame(width: 50)
                    NavigationLink {
                        AnalyticsView()
                    } label: { Image(colorScheme == .light ? "pie" : "pieWhite") }
                    Spacer()
                        .frame(width: 50)
                    Button(action: {
                        self.showNavigationBar.toggle()
                    }) {
                        Image(colorScheme == .light ? "book" : "bookWhite")
                    }
                }
            }
        }
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar()
    }
}

//Button (action: {
//    showNavigationBar.toggle()
//}) { label: { Image(colorScheme == .light ? "book" : "bookWhite")}
//    if showNavigationBar {
//            HStack {
//                NavigationLink {
//                  FacesView()
//                } label: { Image(colorScheme == .light ? "medal" : "medalWhite")}
//                Spacer()
//                    .frame(width: 50)
//            }
//    }
//}

//Menu(label: {(colorScheme == .light ? "book" : "bookWhite"))} {
//    NavigationLink {
//        FacesView()
//    } label: { Image(colorScheme == .light ? "smile" : "smileWhite")}
//}

//.resizable()
//.scaledToFill()
//.aspectRatio(contentMode: .fit)
//.frame(width: 75, height: 75)
