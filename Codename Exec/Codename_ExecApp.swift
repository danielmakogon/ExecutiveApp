//
//  Codename_ExecApp.swift
//  Codename Exec
//
//  Created by Danny Makogon on 8/2/21.
//

import SwiftUI

@main
struct Codename_ExecApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var ViewChanger = viewChanger()
    var body: some Scene {
        WindowGroup {
            MainView(ViewChanger: viewChanger())
        }
    }
}
