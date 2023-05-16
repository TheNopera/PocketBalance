//
//  transactionModel.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 12/05/23.
//

import Foundation

//O tipo de transação
enum InOrOut:Int,CaseIterable{
    case income = 0
    case expense = 1
}


//Define as categorias
enum Category : String, CaseIterable{
    case food = "Comida"
    case bills = "Conta"
    case enterteinment = "Entreterimento"
    case groceries = "Mercado"
    case health = "Saúde"
    case transport = "Transporte"
    case maintence = "Manutenção"
    case clothing = "Roupa"
    case pet = "Pet"
    case other = "Outro"
    case namorada = "Namorada"
}

//Define as emoções
enum Emotion:String,CaseIterable{
    case triste = "Triste"
    case feliz = "Feliz"
    case raiva = "Raiva"
    case neutro = "Neutro"
}


class Transaction:ObservableObject, Identifiable{
    let id:UUID = UUID()
    @Published var type:InOrOut
    @Published var name:String
    @Published var description:String?
    @Published var cost:Float
    @Published var category:Category
    @Published var emotion:Emotion
    @Published var date:Date
    
    init(type:InOrOut, name: String, description: String, cost: Float, category: Category, emotion: Emotion, date: Date) {
        self.type = type
        self.name = name
        self.description = description
        self.cost = cost
        self.category = category
        self.emotion = emotion
        self.date = date
    }
    
}
