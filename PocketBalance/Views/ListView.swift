//
//  ListView.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 16/05/23.
//

import SwiftUI

struct ListView: View {
    
    @Binding var transaction:Transaction
    
    var body: some View {
        VStack{
            ListRow(imgName:transaction.category.rawValue , transName: transaction.name, value: "R$ \(String(transaction.cost))").padding()
            
        }
    }
    
    
    
    
    
    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            let transaction3 = Transaction(type: .expense,  name: "Hitman", description: "fuck Bills", cost: 20.0,category: .other, emotion: .feliz, date: Date())
            
            
            ListView(transaction: .constant(transaction3))
        }
    }
}
