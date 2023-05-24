//
//  ChartViews.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 20/05/23.
//

import SwiftUI



                                    


struct ChartViews: View {
    @ObservedObject var client:Client
    @State var catIsShowing:[Category:Bool] = Dictionary(uniqueKeysWithValues: categories.map{($0, true)})
    
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            ScrollView {
                VStack{
                    HStack {
                        Title(text: "Gastos por categoria")
                            .bold()
                        
                        Spacer()
                    }
                    HStack{
                        SubHeadline(text: "Gasto total: R$" + String(format:"%.2f",client.getFullExpense()) )
                        Spacer()
                    }
                    
                    BarChart(client: client, catIsShowing: $catIsShowing)
                    
                    HStack {
                        ForEach(client.getTransactions(), id: \.id){ tran in
                            CategoryChartControl(catIsShowing: $catIsShowing, cat: tran.category )
                        }
                    }
                    
                    Spacer()
                }.padding()
            }
        }
    }
}

struct ChartViews_Previews: PreviewProvider {
    static var previews: some View {
        ChartViews(client:Client(currentBalance: 0.00, transactionArr: [
            Transaction(type: .expense, name: "awda", description: "awdawd", cost: 35.90, category: .food, emotion: .triste, date: Date()),
            Transaction(type: .expense, name: "example", description: "example description", cost: 10.50, category: .bills, emotion: .feliz, date: Date()),
            Transaction(type: .expense, name: "another expense", description: "another description", cost: 50.00, category: .clothing, emotion: .triste, date: Date()),
                Transaction(type: .expense, name: "expense item", description: "expense description", cost: 25.75, category: .health, emotion: .raiva, date: Date()),
            Transaction(type: .expense, name: "additional expense", description: "additional description", cost: 15.20, category: .maintence, emotion: .neutro, date: Date())
        ] ))
    }
}
