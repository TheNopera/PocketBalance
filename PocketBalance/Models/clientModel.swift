//
//  clientModel.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 12/05/23.
//
import SwiftUI
import Foundation

class Client:ObservableObject
{
    @Published private var currentBalance:Float
    @Published private var transactionArr:[Transaction]
    
    
    //CONSTRUCTOR
    init(currentBalance: Float, transactionArr: [Transaction]) {
        self.currentBalance = currentBalance
        self.transactionArr = transactionArr
    }
    
    //"GET" FUNCTIONS
    func getBalance() -> Float{
        return self.currentBalance
    }
    
    func getTransactions() -> [Transaction]{
        return self.transactionArr
    }
    
    func getFullExpense() -> Float{
        var sum:Float = 0
        for transaction in transactionArr {
            if transaction.category != .income{
                sum += transaction.cost
            }
        }
        return sum
    }
    
    func expenseByCategories(array:[Category:Bool]) -> Float{
        var sum:Float = 0
        for cat in array{
            if cat.value && cat.key != .income{
                sum += getFullExpenseByCategory(category: cat.key )
            }
        }
        return sum
    }
    func getFullExpenseByCategory(category:Category) -> Float{
        var sum:Float = 0
        for tran in transactionArr {
            if tran.category == category{
                sum += tran.cost
            }
        }
        return sum
    }
    
    func getFullExpenseByEmotions(emotion:Emotion) -> Float{
        var sum:Float = 0
        for emo in transactionArr{
            if emo.emotion == emotion{
                sum += emo.cost
            }
        }
        return sum
    }
    
    func getFilteredEmotions() -> [Transaction]{
        var filteredArray:[Transaction] = []
        for transaction in transactionArr {
            if !filteredArray.contains(where: { tran in
                tran.emotion == transaction.emotion
            }){
                filteredArray.append(transaction)
            }
        }
        
        
        return filteredArray
    }
    //"SET" FUNCTIONS
    func setBalance(quant:Float){
        self.currentBalance = quant
    }
    
    func addTransaction(transaction:Transaction){
        if (transaction.type == .income){
            transaction.category = .income
            self.currentBalance += transaction.cost
            
        } else{
            self.currentBalance -= transaction.cost
        }
        self.transactionArr.append(transaction)
    }
    
    func addToBalance(quant:String) -> Bool{
        
        if let unwrappQuant = Float(quant){
            self.currentBalance += unwrappQuant
            return true
        }else{
            return false
        }
        
        
    }
    
    func removeFromBalance(quant:Float){
        self.currentBalance -= quant
    }
    
    func updateBalance(transaction:Transaction){
        for i in 0..<transactionArr.count{
            if transactionArr[i].id == transaction.id{
                transactionArr[i] = transaction
            }
        }
    }
}
