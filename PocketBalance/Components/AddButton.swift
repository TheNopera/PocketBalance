//
//  AddButton.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 16/05/23.
//

import SwiftUI

struct AddButton: View {
    var body: some View {
        Image(systemName: "plus.circle.fill")
            .font(.system(size: 43))
            .foregroundColor(Color("MainColor"))
            .frame(height: 49)
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton()
    }
}
