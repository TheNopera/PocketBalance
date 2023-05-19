//
//  segmentControl.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 15/05/23.
//

import SwiftUI

struct segmentControl: View {
    @Binding var currentIndex: InOrOut

    
    init(_ currentIndex: Binding<InOrOut>) {
         self._currentIndex = currentIndex
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.green)], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color.accentColor)], for: .disabled)
     }
    
    
    
    var body: some View {
        Picker("test", selection: $currentIndex) {
            Text("Entrada").tag(InOrOut.income)
            Text("Saída").tag(InOrOut.expense)
        }.pickerStyle(.segmented)
            .frame(width: 218)
    }
}

struct segmentControl_Previews: PreviewProvider {
    static var previews: some View {
        segmentControl(.constant(.income))
    }
}
