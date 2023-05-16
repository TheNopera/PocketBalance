//
//  transactionModalView.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 12/05/23.
//


import SwiftUI



struct transactionModalView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var type:Int = InOrOut.expense.rawValue//This state here is supoosed to represent what kinda of transaction it is (income or expense), might have to change it later but thats the way I found to work with the Segmented Picker
    @State private var name:String = ""
    @State private var description:String = ""
    @State private var date:Date = Date()
    @State private var emotion:String = ""
    @State private var category:String = ""
    @State private var cost:String = "0,00"
    
    @State var cat:Category = Category.bills
    @State var emo:Emotion = Emotion.neutro
    @State var tip:InOrOut = InOrOut.expense
    @ObservedObject var client:Client
    
    
    
    var body: some View {
        
        ZStack{
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack{
                
                HStack{
                    
                    ZStack {
                        segmentControl($type)
                            .environment(\.colorScheme, .dark)
                        HStack {
                            Button{
                                dismiss.callAsFunction()
                            }label: {
                                Text("<Back")
                                    .foregroundColor(.gray)
                                    .padding(.horizontal)
                            }

                            Spacer()
                        }
                    }
          
                }

                //Transaction value "Text field"
                HStack{
                    //Spotlight: 14/05/23 (1)
                    LargeTitle(text: "R$")
                    TextField("R$ 0,00", text: $cost)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(width: 128)
                        .foregroundColor(Color("MainColor"))
                    Image(systemName: "pencil")
                        .foregroundColor(.gray)
                        .font(.system(size: 22))
                    Spacer()
                }.padding(.horizontal).padding(.top)
                HStack{
                    VStack {
                        TextField("Nome", text: $name)
                            .environment(\.colorScheme, .dark)
                        Divider()
                    }
                    VStack{
                        //Spotlight: 14/05/23 (1)
                        DatePicker(selection: $date, displayedComponents: [.date]) {
                            Image(systemName: "calendar")
                                .foregroundColor(.gray)
                            
                        }.foregroundColor(.red)
                        .environment(\.colorScheme, .dark)
                        
                
                    }
                    
                }.padding()
                VStack{
                    TextField("Descrição (opcional)", text: $description)
                        .environment(\.colorScheme, .dark)
                    Divider()
                }.padding(.horizontal)
                HStack{
                    SubHeadline(text: "Categoria")
                        .padding(.horizontal).padding(.top,20)
                    Spacer()
                    
                }
                categoryCardGridView(modalSelection: $category)
                HStack{
                    SubHeadline(text: "Como você estava se sentindo?")
                        .padding(.horizontal)
                    Spacer()
                    
                }
                emotionsGrid(modalSelection: $emotion)
                Button{
                    for categoria in Category.allCases{
                        if categoria.rawValue == category{
                            cat = categoria
                        }
                    }
                    for emocao in Emotion.allCases{
                        if emocao.rawValue == emotion{
                            emo = emocao
                        }
                    }
                    
                    for tipo in InOrOut.allCases{
                        if tipo.rawValue == type{
                            tip = tipo
                        }
                    }
                    
                    client.addTransaction(transaction: Transaction(type: tip, name: name, description: description, cost: Float(cost.replacingOccurrences(of: ",", with: "."))!, category: cat, emotion: emo, date: date))
                    dismiss.callAsFunction()
                }label: {
                    MainButton(text: "Adicionar")
                }.padding()
                Spacer()
            }.padding()
        }
        
        
        
    }
}

struct transactionModalView_Previews: PreviewProvider {
    static var previews: some View {
        transactionModalView(client:Client(currentBalance: 0.00, transactionArr: []))
    }
}
