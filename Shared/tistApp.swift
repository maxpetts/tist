//
//  tistApp.swift
//  Shared
//
//  Created by mp on 26/10/2021.
//

import SwiftUI

@main
struct tistApp: App {
    let tist = TodoList()
    
    var body: some Scene {
        WindowGroup {
            ContentView(view_model: tist)
        }
    }
}
