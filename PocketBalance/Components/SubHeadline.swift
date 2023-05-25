//
//  SubHeadline.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 15/05/23.
//

import SwiftUI

struct SubHeadline: View {
    var text:String
    var body: some View {
        Text(text)
            .font(.subheadline)
            .foregroundColor(Color("MainColor"))
    }
}

struct SubHeadline_Previews: PreviewProvider {
    static var previews: some View {
        SubHeadline(text: "SubHeadline")
    }
}
