import SwiftUI


struct EditTransactionVIew: View {
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var transaction:Transaction
    @State var formatedCost:String = "0,00"
    @ObservedObject var client:Client
    
    @FocusState var isFocused : Bool // 1
    
    
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                .ignoresSafeArea()
            ScrollView{
                VStack{
                    HStack {
                        HStack {
                            Button{
                                dismiss.callAsFunction()
                            }label: {
                                Text("<Back")
                                    .foregroundColor(.gray)
                                    .padding(.horizontal)
                            }
                            
                        }
                        segmentControl($transaction.type)
                            .environment(\.colorScheme, .dark)
                        Spacer()
                    }
                }

            
                    //Transaction value "Text field"
                    VStack {
                        HStack{
                            //Spotlight: 14/05/23 (1)
                            LargeTitle(text: "R$")
                            LargeTextInput(placeholder: "0,00", value:$formatedCost)
//                            Image(systemName: "pencil")
//                                .foregroundColor(.gray)
//                                .font(.system(size: 22))
                            Spacer()
                        }.padding(.horizontal).padding(.top)
                        HStack{
                            VStack {
                                TextInput(placeHolder: "Nome", text: $transaction.name)
                                Divider()
                            }
                            VStack{
                                //Spotlight: 14/05/23 (1)
                                DatePicker(selection: $transaction.date, displayedComponents: [.date]) {
                                    Image(systemName: "calendar")
                                        .foregroundColor(.gray)
                                    
                                }.foregroundColor(.red)
                                    .environment(\.colorScheme, .dark)
                                
                                
                            }
                        }.padding()
                        VStack{
                            TextField("Descrição (opcional)", text: $transaction.description)
                                .environment(\.colorScheme, .dark)
                            Divider()
                        }.padding(.horizontal)
                        
                        if transaction.type == .expense{
                            HStack{
                                SubHeadline(text: "Categoria")
                                    .padding(.horizontal).padding(.top,20)
                                Spacer()
                                
                            }
                            categoryCardGridView(modalSelection: $transaction.category)
                            HStack{
                                SubHeadline(text: "Como você estava se sentindo?")
                                    .padding(.horizontal)
                                Spacer()
                                
                            }
                            emotionsGrid(modalSelection: $transaction.emotion)
                        }
                        
                        Button{
                            
                            transaction.cost = Float(formatedCost.replacingOccurrences(of: ",", with: "."))!
                            client.updateBalance(transaction: transaction)
                           
                            dismiss.callAsFunction()
                            
                        }label: {
                            MainButton(text: "Atualizar")
                        }.padding()
                    }
                    Spacer()
            }.padding().scrollDismissesKeyboard(.interactively)
            //.highPriorityGesture(TapGesture().onEnded({ _ in
               // hideKeyboard()
            //}))
            
        }//.gesture(Ta.onChanged{_ in UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)})
    }
}

