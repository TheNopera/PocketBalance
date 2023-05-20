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
    var value:Float
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("SecondaryColor"))
                .frame( height: 51)
                .overlay{
                    HStack{
                        Image(imgName)
                            .padding(.horizontal)
                        SubHeadline(text: transName)
                        Spacer()
                        
                        Text("R$"+String(format: "%.2f", value))
                            .font(.footnote)
                            .foregroundColor(Color("MainColor"))
                    }.padding()
                }
        }
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(imgName: "Outro", transName: "DeveloperID", value: 548.00)
    }
}
