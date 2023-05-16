//
//  ListRow.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 16/05/23.
//

import SwiftUI

struct ListRow: View {
    var imgName:String
    var transName:String
    var value:String
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("SecondaryColor"))
                .frame(width: .infinity, height: 51)
                .overlay{
                    HStack{
                        Image(imgName)
                            .padding(.horizontal)
                        SubHeadline(text: transName)
                        
                        
                        Spacer()
                        Text(value)
                            
                        
                    }.padding()
                }
        }
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(imgName: "Outro", transName: "DeveloperID", value: "R$548,00")
    }
}
