//
//  CategoryChartControl.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 24/05/23.
//

import SwiftUI


struct CategoryChartControl: View {
    @Binding var catIsShowing:[Category: Bool]
    var cat:Category
    var body: some View {
        
        
        Button{
            catIsShowing[cat]?.toggle()
        }label: {
            VStack {
                Image(cat.rawValue)
                
            }
        }
        
        
    }
}

struct CategoryChartControl_Previews: PreviewProvider {
    static var previews: some View {
        CategoryChartControl(catIsShowing: .constant([:]), cat: .food)
    }
}
