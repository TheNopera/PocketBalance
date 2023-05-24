//
//  BarChart.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 22/05/23.
//

import SwiftUI
import Charts



struct BarChart: View {
    @ObservedObject var client:Client
    @Binding var catIsShowing:[Category:Bool]
    
    var body: some View {
        
        VStack{
            Chart(categories, id: \.self){ cat in
               if catIsShowing[cat] == true{
                    BarMark(x: .value("awda", cat.rawValue), y: .value("awdad", client.getFullExpenseByCategory(category: cat)))
                       .foregroundStyle(by: .value("category color", cat.rawValue))
                       
                }
            }.chartForegroundStyleScale(["Comida": .orange, "Conta": .red, "Mercado": .cyan, "Saúde": .pink, "Transporte": .yellow, "Manutenção": .purple, "Roupa": .blue, "Pet":.green, "Outro": .gray])
                .frame(width: 326, height: 246)
                .environment(\.colorScheme, .dark)
    
                .onAppear{
                    
                }
            
              
//                Chart(client.getTransactions()){ item in
//                    if item.category != .income{
//                        BarMark(x: .value("Mount",item.emotion.rawValue),
//                                y: .value("Value", item.cost))
//                        .foregroundStyle(by: .value("category color", item.category.rawValue))
//                        .position(by: .value("category", item.category.rawValue))
//                    }
//                }.chartForegroundStyleScale(["Comida": .orange, "Conta": .red, "Mercado": .cyan, "Saúde": .pink, "Transporte": .yellow, "Manutenção": .purple, "Roupa": .blue, "Pet":.green, "Outro": .gray])
//                    .frame(width: 326, height: 246).environment(\.colorScheme, .dark)
            
        }
    }
}

struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        BarChart(client: Client(currentBalance: 0.00, transactionArr: [
            Transaction(type: .expense, name: "awda", description: "awdawd", cost: 35.90, category: .food, emotion: .triste, date: Date()),
            Transaction(type: .expense, name: "example", description: "example description", cost: 10.50, category: .bills, emotion: .feliz, date: Date()),
            Transaction(type: .expense, name: "another expense", description: "another description", cost: 50.00, category: .clothing, emotion: .triste, date: Date()),
            Transaction(type: .expense, name: "expense item", description: "expense description", cost: 25.75, category: .health, emotion: .raiva, date: Date()),
            Transaction(type: .expense, name: "additional expense", description: "additional description", cost: 15.20, category: .maintence, emotion: .neutro, date: Date())
        ]), catIsShowing: .constant([.food: true]))
    }
}
