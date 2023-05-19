//
//  transactionModalView.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 12/05/23.
//
//
//
//import SwiftUI
//extension View {
//    func hideKeyboard() {
//        let resign = #selector(UIResponder.resignFirstResponder)
//        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
//    }
//}
//
//
//struct transactionModalView: View {
//    
//    @Environment(\.dismiss) var dismiss
//    
//    @State private var type:Int = InOrOut.expense.rawValue//This state here is supoosed to represent what kinda of transaction it is (income or expense), might have to change it later but thats the way I found to work with the Segmented Picker
//    @State private var name:String = ""
//    @State private var description:String = ""
//    @State private var date:Date = Date()
//    @State private var emotion:String = ""
//    @State private var category:String = ""
//    @State private var cost:String = "0,00"
//    
//    @State var cat:Category = Category.bills
//    @State var emo:Emotion = Emotion.neutro
//    @State var tip:InOrOut = InOrOut.expense
//    @ObservedObject var client:Client
//    
//    @FocusState var isFocused : Bool // 1
//    
//    
//    var body: some View {
//        ZStack{
//            Color("BackgroundColor")
//                .ignoresSafeArea()
//            ScrollView{
//                VStack{
//                    HStack {
//                        HStack {
//                            Button{
//                                dismiss.callAsFunction()
//                            }label: {
//                                Text("<Back")
//                                    .foregroundColor(.gray)
//                                    .padding(.horizontal)
//                            }
//                            
//                        }
//                        segmentControl($type)
//                            .environment(\.colorScheme, .dark)
//                        Spacer()
//                    }
//                }
//
//            
//                    //Transaction value "Text field"
//                    VStack {
//                        HStack{
//                            //Spotlight: 14/05/23 (1)
//                            LargeTitle(text: "R$")
//                            LargeTextInput(placeholder: .constant("0,00"), value: $cost)
//                            Image(systemName: "pencil")
//                                .foregroundColor(.gray)
//                                .font(.system(size: 22))
//                            Spacer()
//                        }.padding(.horizontal).padding(.top)
//                        HStack{
//                            VStack {
//                                TextInput(placeHolder: "Nome", text: $name)
//                                Divider()
//                            }
//                            VStack{
//                                //Spotlight: 14/05/23 (1)
//                                DatePicker(selection: $date, displayedComponents: [.date]) {
//                                    Image(systemName: "calendar")
//                                        .foregroundColor(.gray)
//                                    
//                                }.foregroundColor(.red)
//                                    .environment(\.colorScheme, .dark)
//                                
//                                
//                            }
//                        }.padding()
//                        VStack{
//                            TextField("Descrição (opcional)", text: $description)
//                                .environment(\.colorScheme, .dark)
//                            Divider()
//                        }.padding(.horizontal)
//                        
//                        if type == 2{
//                            HStack{
//                                SubHeadline(text: "Categoria")
//                                    .padding(.horizontal).padding(.top,20)
//                                Spacer()
//                                
//                            }
//                            categoryCardGridView(modalSelection: $category)
//                            HStack{
//                                SubHeadline(text: "Como você estava se sentindo?")
//                                    .padding(.horizontal)
//                                Spacer()
//                                
//                            }
//                            emotionsGrid(modalSelection: $emotion)
//                        }
//                        
//                        Button{
//                            client.addTransaction(type: type, name: name, description: description, cost: cost, category: category, emotion: emotion, date: date)
//                            dismiss.callAsFunction()
//                        }label: {
//                            MainButton(text: "Adicionar")
//                        }.padding()
//                    }
//                    Spacer()
//            }.padding().scrollDismissesKeyboard(.interactively)
//            //.highPriorityGesture(TapGesture().onEnded({ _ in
//               // hideKeyboard()
//            //}))
//            
//        }//.gesture(Ta.onChanged{_ in UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)})
//    }
//}
//
//
//struct transactionModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        transactionModalView(client:Client(currentBalance: 0.00, transactionArr: []))
//    }
//}
