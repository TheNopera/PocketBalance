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
    let categories:[String] = ["Comida", "Mercado", "Conta", "Transporte", "Pet", "Saúde", "Roupa", "Manutenção", "Outro", "ghost"]
    @State var selectedArray:[Bool] = [false,false,false,false,false,false,false,false,false,false]
    @State var position:Int = 0
    @Binding var modalSelection:String
    var body: some View {
        //Check ghost later
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(0..<9, id: \.self){ i in
                CategoryCard(selectedArray: $selectedArray, position: .constant(i),modalSelection: $modalSelection, Category: categories[i])
            }
        }.padding()
    }
}

struct categoryCardGridView_Previews: PreviewProvider {
    static var previews: some View {
        categoryCardGridView(modalSelection: .constant("Comida"))
    }
}
