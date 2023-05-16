//
//  MainButton.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 15/05/23.
//

import SwiftUI

struct MainButton: View {
    var text:String
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 26)
                .fill(Color("MainColor"))
                .frame(width: 184, height: 50)
                .overlay{
                    Text(text)
                        .foregroundColor(Color("SecondaryColor"))
                        .bold()
                }
            
        }
    }
}

struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        MainButton(text: "Adicionar")
    }
}
