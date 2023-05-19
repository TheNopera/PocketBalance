//
//  DetiledCard.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 18/05/23.
//

import SwiftUI

struct DetiledCard: View {
    var name:String
    var body: some View {
        VStack{
            Image(name)
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 130, height: 132).overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(.yellow)
                )
        }
    }
}

struct DetiledCard_Previews: PreviewProvider {
    static var previews: some View {
        DetiledCard(name: "Conta")
    }
}
