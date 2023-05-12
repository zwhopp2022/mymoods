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
    let calendar = Calendar.current
    let currentWeekInterval = determineWeek()
    let dateFormatter = DateFormatter()
    
//    let startDay: Int
//    let startMonth: String
//    let endMonth: String
//    let endDay: Int
    
//    startDay = calendar.component(.day, from: currentWeekInterval.0)
//    startMonth = calendar.component(.month, from: currentWeekInterval.0)
//    endMonth = calendar.component(.month, from: currentWeekInterval.1)
//    endDay = calendar.component(.day, from: currentWeekInterval.1)
    
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
                case .weekly:
                    Text("\(dateFormatter.monthSymbols[(calendar.component(.month, from: currentWeekInterval.0)) - 1]) \(calendar.component(.day, from: currentWeekInterval.0)) - \(dateFormatter.monthSymbols[(calendar.component(.month, from: currentWeekInterval.1))-1]) \(calendar.component(.day, from: currentWeekInterval.1))")
                        .bold()
                        .font(.system(size: 40))
                    WeeklyPieChart()
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
                        selectedPieChart = .weekly
                    }, label: {
                        Text("Weekly")
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
