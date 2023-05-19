//
//  Title.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 16/05/23.
//

import SwiftUI

struct Title: View {
    var text:String
    var body: some View {
        Text(text)
            .font(.title)
            .foregroundColor(Color("MainColor"))
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title(text: "Suas transações")
    }
}
