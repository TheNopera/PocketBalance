//
//  ContentView.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 12/05/23.
//

import SwiftUI

struct ContentView: View {
    //Creates an instance of the class Client. StateObject is here to enable binding of a class instance between views.
    @StateObject var client:Client = Client(currentBalance: 0.00, transactionArr: [])
    
    var body: some View {
        VStack{
            NavigationStack{
                Text(String(client.getBalance()))
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
