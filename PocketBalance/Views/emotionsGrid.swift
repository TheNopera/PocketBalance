//
//  emotionsGrid.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 15/05/23.
//

import SwiftUI
struct emotionsGrid: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
 
    ]

    let emotions:[Emotion] = Emotion.allCases.map {$0}
    @State var boolArr:[Bool] = [false, false, false, false,false]
    @State var position:Int = 0
    
    @Binding var modalSelection:Emotion
    var body: some View {
        LazyVGrid(columns: columns,spacing: 20) {
            ForEach(0..<emotions.count, id: \.self){ i in
                EmotionCard(emotion: emotions[i],arrBool: $boolArr, position: .constant(i), modalSelection: $modalSelection)
            }
        }
    }
}

struct emotionsGrid_Previews: PreviewProvider {
    static var previews: some View {
        emotionsGrid(modalSelection: .constant(.triste))
    }
}
