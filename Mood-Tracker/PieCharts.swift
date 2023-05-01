//
//  PieCharts.swift
//  Mood-Tracker
//
//  Created by Zachary Hopp on 4/20/23.
//

import SwiftUI


public struct PiePart: Identifiable {
    public let id = UUID()
    var countOfMood: Double
    var color: Color
    var moodName: String
    
    init(countOfMood: Double, color: Color, moodName: String) {
        self.countOfMood = countOfMood
        self.color = color
        self.moodName = moodName
    }
}


public func createDailyPieChartSlicesFromMoods() -> ([PiePart], Int) {
    let timeNow = Date()
    let calendar = Calendar.current
    let currentMonth: Int = calendar.component(.month, from: timeNow)
    let currentDay: Int = calendar.component(.day, from: timeNow)
    var feelingsToExamine = moodDB.retrieveReasons(moodTable: "everything")
    var pieSlices = [PiePart(countOfMood: 0, color: Color.indigo, moodName: "Saddest"), PiePart(countOfMood: 0, color: Color.green, moodName: "Happiest"), PiePart(countOfMood: 0, color: Color.red, moodName: "Angriest"), PiePart(countOfMood: 0, color: Color.gray, moodName: "Neutral"), PiePart(countOfMood: 0, color: Color.yellow, moodName: "Happy"), PiePart(countOfMood: 0, color: Color.cyan, moodName: "Sad")]
    var counter: Int = 0
    
    
    for input in feelingsToExamine {
        if (input.numDay == currentDay) && (input.numMonth == currentMonth)
        {
            switch input.mood {
            case "Saddest":
                pieSlices[0].countOfMood += 1
                counter += 1
            case "Happiest":
                pieSlices[1].countOfMood += 1
                counter += 1
            case "Angriest":
                pieSlices[2].countOfMood += 1
                counter += 1
            case "Neutral":
                pieSlices[3].countOfMood += 1
                counter += 1
            case "Happy":
                pieSlices[4].countOfMood += 1
                counter += 1
            case "Sad":
                pieSlices[5].countOfMood += 1
                counter += 1
            default:
                break
            }
        }
    }
    
    return (pieSlices, counter)
}

struct PieChart: View {
    
    @State private var animate = false
    @State private var moodSlices = createDailyPieChartSlicesFromMoods().0
    @State private var moodsCount = createDailyPieChartSlicesFromMoods().1
    
    
    
    var body: some View {
        VStack {
            Canvas { context, size in
                if (moodsCount > 0) {
                    let totalSlices = moodSlices.reduce(0) { $0 + $1.countOfMood }
                    context.translateBy(x: (size.width / 2), y: size.height / 2)
                    var pieContext = context
                    pieContext.rotate(by: .degrees(90))
                    
                    let radius = min(size.width, size.height) * 0.35
                    
                    var startAngle = Angle.zero
                    
                    for slice in moodSlices {
                        let angle = Angle(degrees: 360 * (slice.countOfMood / totalSlices))
                        let endAngle = startAngle + angle
                        
                        let path = Path { p in
                            p.move(to: .zero)
                            p.addArc(center: .zero, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                            p.closeSubpath()
                        }
                        pieContext.fill(path, with: .color(slice.color.opacity(1)))
                        pieContext.stroke(path, with: .color(slice.color), lineWidth: 3)
                        startAngle = endAngle
                    }
                    
                }
            }
        }
    }
}
