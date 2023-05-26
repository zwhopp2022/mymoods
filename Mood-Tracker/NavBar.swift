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
                    Menu(label: {(colorScheme == .light ? "book" : "bookWhite"))} {
                        NavigationLink {
                            FacesView()
                        } label: { Image(colorScheme == .light ? "smile" : "smileWhite")}
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
