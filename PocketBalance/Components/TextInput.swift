//
//  TextInput.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 17/05/23.
//

import SwiftUI

struct TextInput: View {
    @FocusState var isFocused : Bool // 1
    var placeHolder:String
    @Binding var text:String
    var body: some View {
        VStack{
            TextField(placeHolder, text: $text)
                  .environment(\.colorScheme, .dark)
                  .focused($isFocused)
        }
    }
}

struct TextInput_Previews: PreviewProvider {
    static var previews: some View {
        TextInput(placeHolder: "nome", text: .constant(""))
    }
}
