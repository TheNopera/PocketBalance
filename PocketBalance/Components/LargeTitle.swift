//
//  mainTitleComponent.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 15/05/23.
//

import SwiftUI

struct LargeTitle: View {
    var text:String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color("MainColor"))
    }
}

struct mainTitleComponent_Previews: PreviewProvider {
    static var previews: some View {
        LargeTitle(text:"Main Title")
    }
}
