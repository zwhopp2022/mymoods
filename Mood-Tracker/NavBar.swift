//
//  NavBar.swift
//  Mood-Tracker
//
//  Created by Machintos on 5/1/23.
//

import Foundation
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                ZStack {
                    NavigationLink(destination: FacesView()) {
                        .tabItem {
                            Image(systemName: book.fill)
                                .imageScale(.large)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
