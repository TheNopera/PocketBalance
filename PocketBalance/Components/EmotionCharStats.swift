//
//  EmotionCharStats.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 25/05/23.
//

import SwiftUI



struct EmotionCharStats: View {
    @ObservedObject var client:Client
    var emotion:Emotion
    var body: some View {
        VStack {
            
            HStack{
                Image(emotion.rawValue)
                    
                Text(String(format: "R$ %.2f",client.getFullExpenseByEmotions(emotion: emotion)).replacingOccurrences(of: ".", with: ","))
                    .font(.footnote)
                    .foregroundColor(.gray)
           
                Spacer()
                Text(String(format: "(%.1f",client.getFullExpenseByEmotions(emotion: emotion) * 100 / client.getFullExpense()) + "%)")
                               .font(.footnote)
                               .foregroundColor(.gray)
            }
            
        }.padding()
    }
}

struct EmotionCharStats_Previews: PreviewProvider {
    static var previews: some View {
        EmotionCharStats(client:Client(currentBalance: 0.00, transactionArr: [
            Transaction(type: .expense, name: "awda", description: "awdawd", cost: 35.90, category: .food, emotion: .triste, date: Date()),
            Transaction(type: .expense, name: "example", description: "example description", cost: 10.50, category: .bills, emotion: .feliz, date: Date()),
            Transaction(type: .expense, name: "another expense", description: "another description", cost: 50.00, category: .clothing, emotion: .triste, date: Date()),
            Transaction(type: .expense, name: "expense item", description: "expense description", cost: 25.75, category: .health, emotion: .raiva, date: Date()),
            Transaction(type: .expense, name: "additional expense", description: "additional description", cost: 15.20, category: .maintence, emotion: .neutro, date: Date())
        ] ), emotion: .triste)
    }
}
