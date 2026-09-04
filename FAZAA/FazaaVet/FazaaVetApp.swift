//
// FazaaVetApp.swift
// Fazaa Vet
//

import SwiftUI
import Foundation
import FirebaseCore
import FirebaseAuth

// MARK: - APP DELEGATE

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()

        #if DEBUG
        let authSettings = AuthSettings()
        authSettings.isAppVerificationDisabledForTesting = true
        Auth.auth().settings = authSettings
        #endif

        application.registerForRemoteNotifications()

        return true
    }

    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any] = [:]
    ) -> Bool {
        if Auth.auth().canHandle(url) {
            return true
        }
        return false
    }

    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
        Auth.auth().setAPNSToken(deviceToken, type: .prod)
    }

    func application(
        _ application: UIApplication,
        didReceiveRemoteNotification notification: [AnyHashable: Any],
        fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void
    ) {
        if Auth.auth().canHandleNotification(notification) {
            completionHandler(.noData)
            return
        }
        completionHandler(.newData)
    }

    func application(
        _ application: UIApplication,
        didFailToRegisterForRemoteNotificationsWithError error: Error
    ) {
        print("Failed to register for remote notifications: \(error.localizedDescription)")
    }
}

// MARK: - APP

@main
struct FazaaVetApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var appState = AppState()
    @StateObject private var authService = AuthService()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(appState)
                .environmentObject(authService)
                .environment(\.layoutDirection, .rightToLeft)
                .tint(.fazaaGreen)
        }
    }
}

// MARK: - APP TAB

enum AppTab: Hashable {
    case home
    case vets
    case pets
    case consultations
    case profile
    case admin
}

// MARK: - APP STATE

@MainActor
final class AppState: ObservableObject {
    @Published var selectedTab: AppTab = .home

    let repository = MockFazaaRepository()
    let paymentService = MockPaymentService()
}
