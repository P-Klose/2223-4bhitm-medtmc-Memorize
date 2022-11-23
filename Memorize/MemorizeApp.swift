//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Peter Klose on 28.09.22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
