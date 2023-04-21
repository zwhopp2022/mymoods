//
//  NavBar.swift
//  Mood-Tracker
//
//  Created by Machintos on 4/20/23.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $selection) {
                    Page1View()
                        .tabItem {
                            Image(systemName: "house")
                            Text("Faces")
                        }
                        .tag(0)
                    
                    Page2View()
                        .tabItem {
                            Image(systemName: "person")
                            Text("Page 2")
                        }
                        .tag(1)
                    
                    Page3View()
                        .tabItem {
                            Image(systemName: "bell")
                            Text("Page 3")
                        }
                        .tag(2)
                    
                    Page4View()
                        .tabItem {
                            Image(systemName: "gear")
                            Text("Page 4")
                        }
                        .tag(3)
                }
                .navigationBarTitle(Text("Navigation Bar"), displayMode: .  inline)
            }
        }
    }
}

struct Page1View: View {
    var body: some View {
        Text("Page 1")
    }
}

struct Page2View: View {
    var body: some View {
        Text("Page 2")
    }
}

struct Page3View: View {
    var body: some View {
        Text("Page 3")
    }
}

struct Page4View: View {
    var body: some View {
        Text("Page 4")
    }
}
