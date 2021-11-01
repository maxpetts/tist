//
//  Todo.swift
//  tist
//
//  Created by mp on 26/10/2021.
//

import Foundation

/// - Tag: DataModel
struct TodoTask: Identifiable {
    let id = UUID()
    var complete: Bool = false
    let title: String
    
    init(_ p_title: String) {
        title = p_title
    }
}
