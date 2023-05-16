//
//  CategoryCard.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 14/05/23.
//

import SwiftUI
// This view will receive a parameter of a string, to render different categories. The string must be the same as the image names saved in the assets. They are also the same as the "Category" enum on the transactionModel file.
struct CategoryCard: View {
    @Binding var selectedArray:[Bool]
    @Binding var position:Int
    @Binding var modalSelection:String
    var Category:String
    //Spotlight - 14/05/23 (3)
    var body: some View {
        VStack{
            //Spotlight - 14/05/23 (3)
            if(selectedArray[position]){
                Button{
                    selectedArray[position].toggle()
                }label: {
                    VStack {
                        Image(Category)
                        Text(Category)
                            .font(.caption2)
                            .foregroundColor(.gray)
                        
                    }.frame(width: 72, height: 72).overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(.yellow)
                    )
                }
            } else{
                Button{
                    for i in 0..<selectedArray.count{
                        for j in 0..<selectedArray.count{
                            if i != j {
                                selectedArray[j] = false
                            }
                        }
                        selectedArray[position].toggle()
                        modalSelection = Category
                    }
                }label: {
                    VStack {
                        Image(Category)
                        Text(Category)
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }
            }
            
        }.frame(width: 72, height: 72)
    }
}

struct CategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCard(selectedArray:.constant([false,false,false,false,false,false,false,false,false]), position: .constant(0), modalSelection: .constant("Comida"),Category:Category.food.rawValue)
    }
}
