//
//  categoryCardGridView.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 14/05/23.
//

import SwiftUI

struct categoryCardGridView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let categories:[Category] = Category.allCases.map {$0}

    @State var selectedArray:[Bool] = [false,false,false,false,false,false,false,false,false,false]
    @State var position:Int = 0
    @Binding var modalSelection:Category
    var body: some View {
        //Check ghost later
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(0..<9, id: \.self){ i in
                CategoryCard(selectedArray: $selectedArray, position: .constant(i),modalSelection: $modalSelection, category: categories[i])
            }
        }.padding()
    }
}

struct categoryCardGridView_Previews: PreviewProvider {
    static var previews: some View {
        categoryCardGridView(modalSelection: .constant(.food))
    }
}
