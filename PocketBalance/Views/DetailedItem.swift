//
//  DetailedItem.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 18/05/23.
//

import SwiftUI

struct DetailedItem: View {
    @ObservedObject var transaction:Transaction
    @ObservedObject var client:Client
    @State var modalIsOpen:Bool = false
    var body: some View {
        NavigationStack {
            ZStack{
                Color("BackgroundColor")
                    .ignoresSafeArea()
                
                if transaction.type == .income{
                    VStack{
                        LargeTitle(text: transaction.name)
                        Title(text: "R$" + String(format: "%.2f" ,transaction.cost))
                        DetiledCard(name: transaction.category.rawValue)
                        HStack{
                            Text("Descrição")
                                .font(.headline)
                                .foregroundColor(Color("MainColor"))
                                .bold()
                                .padding()
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                        if transaction.description != ""{
                            
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.gray).overlay{
                                    VStack{
                                        Text(transaction.description)
                                            .foregroundColor(.gray)
                                            .padding()
                                            .multilineTextAlignment(.leading)
                                        
                                        Spacer()
                                        
                                    }
                                    
                                }
                            
                        }
                        
                        
                        Spacer()
                        Text("\(transaction.date.formatted())")
                            .foregroundColor(Color("MainColor"))
                            .multilineTextAlignment(.center)
                    }.padding()
                }else{
                    VStack{
                        LargeTitle(text: transaction.name)
                        Title(text: "R$" + String(transaction.cost))
                        HStack{
                            DetiledCard(name: transaction.category.rawValue)
                                .padding()
                            DetiledCard(name: transaction.emotion.rawValue)
                                .padding()
                        }
                        HStack{
                            Text("Descrição")
                                .font(.headline)
                                .foregroundColor(Color("MainColor"))
                                .bold()
                            
                            Spacer()
                        }.padding()
                        Text(transaction.description)
                            .foregroundColor(.gray)
                            .padding()
                        Spacer()
                        Text("\(transaction.date.formatted())")
                            .foregroundColor(Color("MainColor"))
                            .multilineTextAlignment(.center)
                    }.padding()
                    
                    
                    
                }
                
                 
                
            }
            
            .toolbar {
                Button{
                        
                        modalIsOpen.toggle()
                }label: {
                    Text("Edit")
                }.fullScreenCover(isPresented: $modalIsOpen) {
                    EditTransactionVIew(transaction: transaction, formatedCost: String(transaction.cost),client: client)
                }
            }
        }
    }
}

struct DetailedItem_Previews: PreviewProvider {
    static var previews: some View {
        DetailedItem(transaction: Transaction(type: .income, name: "Bolsa Academy", description: "awdadadadadadadadwadawawdawdawdawdawdawdadadadawdadadadadawdawdawdadadadadadawdadadadadadadadawdawawdaawdawdawdawdawdawdawddawdadawdawdwdawawdwadawdadawdadaddda", cost: 1250.00, category: .income, emotion: .neutro, date: Date()),client: Client(currentBalance: 0.00, transactionArr: []))
    }
}
