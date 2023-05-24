//
//  PieChart.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 20/05/23.
//

import SwiftUI
import Charts

struct PieChart: View {
    var sliceData:PieChartData
    var midRadians: Double {
        return Double.pi / 2.0 - (sliceData.startAngle + sliceData.endAngle).radians / 2.0
    }

    var body: some View {
        
        ZStack {
            GeometryReader { geometry in
                Path{ path in
                    let width:CGFloat = deviceWidth
                    let height = width
                    
                    let center = CGPoint(x: width * 0.5, y: height * 0.5)
                    
                    path.move(to: center)
                    
                    path.addArc(
                        center: center,
                        radius: width * 0.5,
                        startAngle: Angle(degrees: -90.0) + sliceData.startAngle,
                        endAngle: Angle(degrees: -90.0) + sliceData.endAngle,
                        clockwise: false)
                }.fill(sliceData.color)
                
                Text(sliceData.text)
                    .foregroundColor(.red)
                    .position(
                        x: geometry.size.width * 0.5 * CGFloat(1.0 + 0.7 * cos(self.midRadians)),
                        y: geometry.size.height * 0.5 * CGFloat(1.0 - 0.8  * sin(self.midRadians))
                    )
            }.aspectRatio(1, contentMode: .fit)
        }
    }
}

struct PieChartData{
    var text:String
    var startAngle: Angle
    var endAngle: Angle
    var color:Color
}

struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        PieChart(sliceData: PieChartData(text: "Hello world",
            startAngle: Angle(degrees:0.0),
            endAngle: Angle(degrees:  45.0),
            color: Color.black))
    }
}
