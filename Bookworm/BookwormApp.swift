//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Kenji Dela Cruz on 7/23/24.
//
import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
