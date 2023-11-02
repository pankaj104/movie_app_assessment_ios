//
//  Movie_App_AssessmentApp.swift
//  Movie App Assessment
//
//  Created by Pankaj Kumar on 18/09/22.
//

import SwiftUI

@main
struct Movie_App_AssessmentApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(presenter: ItemsPresenter())
        }
    }
}
