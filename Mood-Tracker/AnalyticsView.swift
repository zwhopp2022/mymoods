//
//  AnalyticsView.swift
//  Mood-Tracker
//
//  Created by Zachary Hopp on 4/20/23.
//

import SwiftUI

enum PieType {
    case daily
    case monthly
    case weekly
    case nothing
}


struct AnalyticsView: View {
    @State var currentDay = TimeAndDate().userDay
    @State var selectedPieChart: PieType = .nothing
    var currentMonth = TimeAndDate().userMonth
    var currentYear = TimeAndDate().userYear
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            VStack{
                Text("Analytics")
                    .bold()
                    .font(.system(size: 38))
                Spacer()
                switch selectedPieChart {
                case .daily:
                    Text("\(currentMonth) \(currentDay)")
                        .bold()
                        .font(.system(size: 40))
                    DailyPieChart()
                case .monthly:
                    Text("\(currentMonth) \(currentYear)")
                        .bold()
                        .font(.system(size:40))
                    MonthlyPieChart()
                default:
                    Text("")
                }
                HStack {
                    Button(action: {
                        selectedPieChart = .daily
                    }, label: {
                        Text("Daily")
                    })
                    Button(action: {
                        selectedPieChart = .monthly
                    }, label: {
                        Text("Monthly")
                    })
                }
            }
        }
    }
}

struct AnalyticsView_Previews: PreviewProvider {
    static var previews: some View {
        AnalyticsView()
    }
}
