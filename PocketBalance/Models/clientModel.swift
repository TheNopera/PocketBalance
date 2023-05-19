//
//  clientModel.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 12/05/23.
//

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
    
    
    
}
