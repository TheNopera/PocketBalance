//
//  CategoryChartControl.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 24/05/23.
//

import SwiftUI

struct CategoryChartControl: View {
    @State var  catIsShowing:[Category] = []
    var body: some View {
        VStack{
            HStack{
                Button{
                    
                }label: {
                    Image(Category.food.rawValue)
                }
                
            }
        }
    }
}

struct CategoryChartControl_Previews: PreviewProvider {
    static var previews: some View {
        CategoryChartControl()
    }
}
