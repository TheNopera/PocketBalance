//
//  LargeTextInput.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 17/05/23.
//

import SwiftUI


struct LargeTextInput: View {
    var placeholder:String
    @Binding var value:String
    
    var body: some View {
        TextField(placeholder, text: $value)
            .keyboardType(.decimalPad)
            .font(.largeTitle)
            .fontWeight(.bold)
//            .frame(width: 128)
            .foregroundColor(Color("MainColor"))
            .submitLabel(.done)
    }
}

struct LargeTextInput_Previews: PreviewProvider {
    static var previews: some View {
        LargeTextInput(placeholder: "R$ 0,00", value: .constant("0"))
    }
}
