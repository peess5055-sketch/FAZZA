import SwiftUI

struct RootView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var authService: AuthService

    var body: some View {
        if authService.isSignedIn {
            TabView(
                selection: $appState.selectedTab
            ) {
                NavigationView { HomeView() }
                    .navigationViewStyle(StackNavigationViewStyle())
                    .tabItem { Label { Text("الرئيسية") } icon: { Image(systemName: "house.fill") } }
                    .tag(AppTab.home)

                NavigationView { VeterinariansView() }
                    .navigationViewStyle(StackNavigationViewStyle())
                    .tabItem { Label { Text("الأطباء") } icon: { Image(systemName: "stethoscope") } }
                    .tag(AppTab.vets)

                NavigationView { PetsView() }
                    .navigationViewStyle(StackNavigationViewStyle())
                    .tabItem { Label { Text("حلالك") } icon: { Image(systemName: "pawprint.fill") } }
                    .tag(AppTab.pets)

                NavigationView { ConsultationsView() }
                    .navigationViewStyle(StackNavigationViewStyle())
                    .tabItem { Label { Text("الاستشارات") } icon: { Image(systemName: "phone.fill") } }
                    .tag(AppTab.consultations)

                NavigationView { ProfileView() }
                    .navigationViewStyle(StackNavigationViewStyle())
                    .tabItem { Label { Text("الملف الشخصي") } icon: { Image(systemName: "person.crop.circle.fill") } }
                    .tag(AppTab.profile)

                if authService.isAdmin {
                    NavigationView { AdminView() }
                        .navigationViewStyle(StackNavigationViewStyle())
                        .tabItem { Label { Text("الإدارة") } icon: { Image(systemName: "gearshape.fill") } }
                        .tag(AppTab.admin)
                }
            }
        } else {
            LoginView()
        }
    }
}
