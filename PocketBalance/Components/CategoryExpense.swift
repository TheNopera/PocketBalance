//
//  CategoryExpense.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 23/05/23.
//

import SwiftUI

struct CategoryExpense: View {
    var body: some View {
        VStack {
            Divider()
            HStack{
                Image(Category.food.rawValue)
                Image(Category.bills.rawValue)
            }.padding()
            Divider()
            
        }

    }
}

struct CategoryExpense_Previews: PreviewProvider {
    static var previews: some View {
        CategoryExpense()
    }
}
