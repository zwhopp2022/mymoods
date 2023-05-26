//
//  NavBar.swift
//  Mood-Tracker
//
//  Created by Zachary Hopp on 5/8/23.
//

import SwiftUI

var showNavigationBar = false

struct NavBar: View {
    @Environment(\.colorScheme) var colorScheme
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
                    NavigationLink {
                        Button (action: {
                            showNavigationBar = true
                        }) {
                            if showNavigationBar {
                                ZStack {
                                    HStack {
                                        NavigationLink {
                                            FacesView()
                                        } label: { Image(colorScheme == .light ? "medal" : "medalWhite")}
                                    }
                                }
                            }
                        }
                    } label: { Image(colorScheme == .light ? "book" : "bookWhite")}
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
