//
//  ContentView.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 12/05/23.
//

import SwiftUI

let cliente:Client = Client(currentBalance: 0.00, transactionArr: [])

struct ContentView: View {
    @ObservedObject var client:Client = cliente
    var body: some View {
        VStack {
            Text(String(client.getBalance()))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
