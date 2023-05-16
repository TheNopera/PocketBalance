//
//  ContentView.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 12/05/23.
//

import SwiftUI

struct ContentView: View {
    //Creates an instance of the class Client. StateObject is here to enable binding of a class instance between views.
    
    @StateObject var client:Client = Client(currentBalance: 0.00, transactionArr: [])
    @State var modalOpen:Bool = false
    
    var body: some View {
        VStack{
            NavigationStack{
                ZStack{
                    Color("BackgroundColor")
                        .ignoresSafeArea()
                    
                    VStack{
                        
                        HStack {
                            LargeTitle(text: "R$" + String(client.getBalance()).replacingOccurrences(of: ".", with: ","))
                            Spacer()
                        }.padding()
                        HStack{
                            Title(text: "Minhas transações")
                            Spacer()
                            
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
                            ForEach(client.getTransactions(), id: \.id){ trans in
                                NavigationLink{
                                    
                                }label: {
                                    ListView(transaction: .constant(trans))
                                }
                                
                            }
                            
                            
                        }
                        Spacer()
                        
                    }
                    VStack{
                        Spacer()
                        Button{
                            modalOpen.toggle()
                        }label: {
                            AddButton()
                        }.padding()
                        .fullScreenCover(isPresented: $modalOpen) {
                            transactionModalView(client: client)
                        }
                    }
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
