//
//  PocketBalanceApp.swift
//  PocketBalance
//
//  Created by Daniel Ishida on 12/05/23.
//

import SwiftUI

@main
struct PocketBalanceApp: App {
    var body: some Scene {
        WindowGroup {
            transactionModalView(client: Client(currentBalance: 0.00, transactionArr: []))
        }
    }
}
