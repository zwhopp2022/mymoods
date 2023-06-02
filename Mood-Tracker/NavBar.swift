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
                        .overlay(
                    HStack {
                        NavigationLink {
                            HappiestDisplay()
                                .onAppear {
                                    showNavigationBar = false
                                }
                        } label: {
                            Image("Happiest")
                                .resizable()
                                .frame(width: 75, height: 75)
                        }
                        NavigationLink {
                            SaddestDisplay()
                                .onAppear {
                                    showNavigationBar = false
                                }
                        } label: {
                            Image("Saddest")
                                .resizable()
                                .frame(width: 75, height: 75)
                        }
                        NavigationLink {
                            HappyDisplay()
                                .onAppear {
                                    showNavigationBar = false
                                }
                        } label: {
                            Image("Happy")
                                .resizable()
                                .frame(width: 75, height: 75)
                        }
                        NavigationLink {
                            SadDisplay()
                                .onAppear {
                                    showNavigationBar = false
                                }
                        } label: {
                            Image("Sad")
                                .resizable()
                                .frame(width: 75, height: 75)
                        }
                    }
                    )
                }
                Spacer()
                    .frame(height: 20)
                .padding()
                ZStack {
                    Color.clear
                        .ignoresSafeArea()
                        .overlay(
                    HStack {
                        NavigationLink {
                            NeutralDisplay()
                                .onAppear {
                                    showNavigationBar = false
                                }
                        } label: {
                            Image("neutral")
                                .resizable()
                                .frame(width: 75, height: 75)
                        }
                        NavigationLink {
                            AngryDisplay()
                                .onAppear {
                                    showNavigationBar = false
                                }
                        } label: {
                            Image("Angriest")
                                .resizable()
                                .frame(width: 75, height: 75)
                        }
                        NavigationLink {
                            EverythingView()
                                .onAppear {
                                    showNavigationBar = false
                                }
                        } label: { Image(colorScheme == .light ? "book" : "bookWhite")}
                    }
                    )
                }
            }
        Spacer()
            .frame(height: 3)
        .padding()
        ZStack {
            Color.clear
                .ignoresSafeArea()
            NavigationStack {
                HStack {
                    NavigationLink {
                        FacesView()
                            .onAppear {
                                showNavigationBar = false
                            }
                    } label: { Image(colorScheme == .light ? "smile" : "smileWhite")}
                    Spacer()
                        .frame(width: 50)
                    NavigationLink {
                        StreaksView()
                            .onAppear {
                                showNavigationBar = false
                            }
                    } label: { Image(colorScheme == .light ? "medal" : "medalWhite") }
                    Spacer()
                        .frame(width: 50)
                    NavigationLink {
                        AnalyticsView()
                            .onAppear {
                                showNavigationBar = false
                            }
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
            Spacer()
                .frame(height: 5)
        }
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar()
    }
}
