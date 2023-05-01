//
//  AnalyticsView.swift
//  Mood-Tracker
//
//  Created by Zachary Hopp on 4/20/23.
//

import SwiftUI

struct AnalyticsView: View {
    @State var currentDay = TimeAndDate().userDay
    var currentMonth = TimeAndDate().userMonth
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            VStack{
                Text("Analytics\n \(currentMonth) \(currentDay)")
                    .bold()
                    .font(.system(size: 38))
                PieChart()
            }
        }
    }
}

struct AnalyticsView_Previews: PreviewProvider {
    static var previews: some View {
        AnalyticsView()
    }
}
