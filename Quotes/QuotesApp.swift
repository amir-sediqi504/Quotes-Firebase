//
//  QuotesApp.swift
//  Quotes
//
//  Created by Amir Sediqi on 2021-08-26.
//

import SwiftUI
import Firebase
import UIKit

@main
struct QuotesApp: App {
    @StateObject private var quotesFactory = QuotesFactory()
    
    // Create a reference to the App Delegate
         @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView(quotesFactory: testFactory)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Configure FirebaseApp
        FirebaseApp.configure()
        return true
    }
}
