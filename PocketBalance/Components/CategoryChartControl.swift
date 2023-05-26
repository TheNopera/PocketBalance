//
//  CategoryChartControl.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 24/05/23.
//

import SwiftUI


struct CategoryChartControl: View {
    @ObservedObject var client:Client
    @Binding var catIsShowing:[Category: Bool]
    @State var highlight:Bool = true
    var cat:Category
    var body: some View {
        VStack {
            
            ZStack {
                Button{
                    catIsShowing[cat]?.toggle()
                    highlight.toggle()
                }label: {
                    if highlight{
                        HStack {
                            Image(cat.rawValue)
                            Text(cat.rawValue)
                                .font(.footnote)
                                .foregroundColor(.gray)
                            Spacer()
                            Text(String(format: "R$%.2f", client.getFullExpenseByCategory(category: cat)).replacingOccurrences(of: ".", with: ","))
                                .foregroundColor(.gray)
                        }
                    }else{
                        HStack {
                            Image(cat.rawValue)
                            Text(cat.rawValue)
                                .font(.footnote)
                                .foregroundColor(.gray)
                            Spacer()
                            Text(String(format: "R$%.2f", client.getFullExpenseByCategory(category: cat)))
                                .strikethrough(true)
                        }.grayscale(1)
                    }
                
                    
                }.padding(.horizontal)
            
            }
              
            Divider()
            
        }
        
        
    }
}

struct CategoryChartControl_Previews: PreviewProvider {
    static var previews: some View {
        CategoryChartControl(client: Client(currentBalance: 0.00, transactionArr: []),catIsShowing: .constant([:]), cat: .food)
    }
}
