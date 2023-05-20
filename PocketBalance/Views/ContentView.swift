//
//  ContentView.swift
//  PocketBalance
//  Created by Daniel Ishida on 12/05/23.

import SwiftUI

struct ContentView: View {
    //Creates an instance of the class Client. StateObject is here to enable binding of a class instance between views.
    
    let deviceWidth = UIScreen.main.bounds.width
    let deviceHeight = UIScreen.main.bounds.height
    
    @StateObject var client:Client = Client(currentBalance: 0.00, transactionArr: [])
    @State var modalOpen:Bool = false
    
    var body: some View {
        VStack{
            NavigationStack{
                ZStack{
                    Color("BackgroundColor")
                        .ignoresSafeArea()
                    Image("BalanceLine")
                        .position(x: 30 / 100 * deviceWidth, y: 9 / 100 * deviceHeight)
                    VStack{
                        HStack{
                            VStack {
                                LargeTitle(text: "R$" + String(format:"%.2f",client.getBalance()).replacingOccurrences(of: ".", with: ","))
                                
                                
                            }
                            Spacer()
                        }.padding()
                        HStack{
                            Title(text: "Minhas transações")
                                .bold()
                                .padding()
                            Spacer()
                            Button{
                            
                            }label: {
                                Image(systemName: "line.3.horizontal.decrease.circle")
                                    .foregroundColor(Color("MainColor"))
                            }.padding(.horizontal)
                        }
                        if client.getTransactions().count == 0{
                            Rectangle()
                                .stroke(style: StrokeStyle(lineWidth: 5, dash: [10]))
                                .foregroundColor(Color("SecondaryColor"))
                                .frame(width: 294, height: 191)
                                .overlay{
                                    Text("Nenhuma transação até o momento....")
                                        .frame(width: 264)
                                        .multilineTextAlignment(.center)
                                        .font(.subheadline)
                                        .bold()
                                        .foregroundColor(.gray)
                                }.padding()
                            
                        }else{
                            ScrollView{
                                ForEach(client.getTransactions(), id: \.id){ trans in
                                    NavigationLink{
                                        DetailedItem(transaction: trans,client: client)
                                    }label: {
                                        ListView(transaction: .constant(trans))
                                    }
                                    
                                }
                            }
                            
                            
                            
                        }
                        Spacer()
                        VStack{
                            Spacer()
                            Button{
                                modalOpen.toggle()
                            }label: {
                                AddButton()
                            }.padding()
                                .fullScreenCover(isPresented: $modalOpen) {
                                    transactionModalView2(transaction: Transaction(type: .income, name: "", description: "", cost: 10, category: .other, emotion: .neutro, date: Date()), client: client)
                                }
                        }.frame(height: 49)
                    }.padding()
                  
                }
            }
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
