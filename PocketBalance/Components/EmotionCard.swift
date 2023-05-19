//
//  EmotionCard.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 15/05/23.
//

import SwiftUI

struct EmotionCard: View {
    var emotion:Emotion
    @Binding var arrBool:[Bool]
    @Binding var position:Int
    
    @Binding var modalSelection:Emotion
    var body: some View {
        HStack{
            if arrBool[position]{
                Button{
                    arrBool[position].toggle()
                }label: {
                    Image(emotion.rawValue)
                }
                .frame(width: 72, height: 72).overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(.yellow)
                )
            }else{
                Button{
                   
                    for i in 0..<arrBool.count{
                        for j in 0..<arrBool.count{
                            if i != j {
                                arrBool[j] = false
                            }
                        }
                        arrBool[position].toggle()
                        modalSelection = emotion
                    }
                }label: {
                    Image(emotion.rawValue)
                }
            }
        }.frame(width: 72, height: 72)
        
    }
}

struct EmotionCard_Previews: PreviewProvider {
    static var previews: some View {
        EmotionCard(emotion: .triste,arrBool:.constant([false,false,false,false]) , position: .constant(1), modalSelection: .constant(.triste))
    }
}
