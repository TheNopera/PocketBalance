//
//  transactionModel.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 12/05/23.
//

import Foundation


//Define as categorias
enum Category : String{
    case food = "Comida"
    case bills = "Conta"
    case enterteinment = "Entreterimento"
    case groceries = "Mercado"
    case health = "Saúde"
    case transport = "Transporte"
    case maintence = "Manutenção"
    case clothing = "Roupa"
    case pet = "Pet"
    case namorada = "Namorada"
}

//Define as emoções
enum Emotion:String{
    case triste = "Triste"
    case feliz = "Feliz"
    case raiva = "Raiva"
    case neutro = "Neutro"
}


class Transaction:ObservableObject{
    let id:UUID = UUID()
    @Published var cost:Float
    @Published var category:Category
    @Published var emotion:Emotion
    @Published var date:Date
    
    init(cost: Float, category: Category, emotion: Emotion, date: Date) {
        self.cost = cost
        self.category = category
        self.emotion = emotion
        self.date = date
    }
}
