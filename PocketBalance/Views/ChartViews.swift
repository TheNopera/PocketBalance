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
    @State var currentChart:Int = 1
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            ScrollView {
              
                if client.getTransactions().count != 0{
                    VStack{
                        if currentChart == 1{
                            Picker("test", selection: $currentChart) {
                                Text("Categoria").tag(1)
                                Text("Emoção").tag(2)
                            }.pickerStyle(.segmented)
                                .environment(\.colorScheme, .dark)
                                .padding()
                                .frame(width: 218)
                            HStack {
                                
                                Title(text: "Gastos por categoria")
                                
                                
                                Spacer()
                            }
                            HStack{
                                SubHeadline(text: "Gasto total: R$" + String(format:"%.2f",client.expenseByCategories(array: catIsShowing)).replacingOccurrences(of: ".", with: ",") )
                                    .bold()
                                Spacer()
                            }
                            
                            BarChartCategory(client: client, catIsShowing: $catIsShowing)
                                .padding(.bottom)
                            
                            
                            
                            ForEach(client.getTransactions(), id: \.id){ tran in
                                if tran.category != .income{
                                    CategoryChartControl(client: client, catIsShowing: $catIsShowing, cat: tran.category )
                                }
                            }
                            
                        }else{
                            Picker("test", selection: $currentChart) {
                                Text("Categoria").tag(1)
                                Text("Emoção").tag(2)
                            }.pickerStyle(.segmented)
                                .environment(\.colorScheme, .dark)
                                .padding()
                                .frame(width: 218)
                            HStack {
                                Title(text: "Gastos por emoção")
                                Spacer()
                                
                            }
                            HStack{
                                SubHeadline(text: "Gasto total: R$" + String(format:"%.2f",client.expenseByCategories(array: catIsShowing)) )
                                    .bold()
                                Spacer()
                            }
                            BarChartEmotions(client: client)
                            
                  
                            ForEach(client.getFilteredEmotions(), id: \.id){ tran in
                                if tran.category != .income{
                                    EmotionCharStats(client: client,emotion: tran.emotion)
                                }
                            }
                            Spacer()
                        }
                        
                        
                    }.padding(.horizontal)
                } else{
                    VStack{
                        Title(text: "Nenhuma transação até o momento ")
                            .multilineTextAlignment(.center)
                        
                    }
                    
                }
                
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
