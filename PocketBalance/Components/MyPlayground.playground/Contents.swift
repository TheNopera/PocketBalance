import UIKit
enum Category : String, CaseIterable{
    case food = "Comida"
    case bills = "Conta"
    case groceries = "Mercado"
    case health = "Saúde"
    case transport = "Transporte"
    case maintence = "Manutenção"
    case clothing = "Roupa"
    case pet = "Pet"
    case other = "Outro"
    case income = "Income"
}

let categories:[Category] = Category.allCases.map {$0}

var catIsShowing:[Category:Bool] = Dictionary(uniqueKeysWithValues: categories.map{($0, false)})
print(catIsShowing.keys)
