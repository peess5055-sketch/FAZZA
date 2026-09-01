//
// HomeView.swift
// Fazaa Vet
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appState: AppState

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            VStack(
                alignment: .trailing,
                spacing: 20
            ) {
                ZStack(alignment: .bottomTrailing) {
                    Image("CamelBanner")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 190)
                        .frame(maxWidth: .infinity)
                        .clipped()

                    LinearGradient(
                        colors: [Color.black.opacity(0.65), Color.black.opacity(0)],
                        startPoint: .bottom,
                        endPoint: .top
                    )

                    VStack(alignment: .trailing, spacing: 2) {
                        Text("فزاع")
                            .font(.system(size: 36, weight: .heavy, design: .rounded))
                            .tracking(2)
                            .foregroundStyle(Color.fazaaWhite)
                            .shadow(color: .black.opacity(0.3), radius: 6, y: 2)

                        Text("طبيبك البيطري")
                            .font(.system(size: 14, weight: .semibold))
                            .tracking(3)
                            .foregroundStyle(Color.fazaaWhite.opacity(0.9))
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 18)
                }
                .frame(height: 190)
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 24))

                NavigationLink {
                    EmergencyView()
                } label: {
                    Label("الحالات الطارئة", systemImage: "exclamationmark.triangle.fill")
                        .font(.headline)
                        .foregroundStyle(Color.fazaaGreen)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .background(Color.fazaaWhite)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.fazaaGreen, lineWidth: 2)
                )
                .clipShape(
                    RoundedRectangle(cornerRadius: 16)
                )

                VStack(
                    alignment: .trailing,
                    spacing: 12
                ) {
                    Label("احجز استشارة؟", systemImage: "phone.fill")
                        .font(.title3.bold())
                        .foregroundStyle(Color.fazaaWhite)

                    Text("تواصل مع طبيب بيطري واحجز استشارتك.")
                        .font(.subheadline)
                        .foregroundStyle(Color.fazaaWhite.opacity(0.9))

                    Button {
                        appState.selectedTab = .vets
                    } label: {
                        Text("استشر طبيبنا")
                            .font(.headline)
                            .foregroundStyle(Color.fazaaWhite)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color.fazaaGreen)
                }
                .padding()
                .fazaaCardStyle()

                LazyVGrid(
                    columns: columns,
                    spacing: 16
                ) {
                    NavigationLink {
                        PharmaciesView()
                    } label: {
                        HomeCard(
                            title: "الصيدليات",
                            icon: "cross.case.fill"
                        )
                    }

                    NavigationLink {
                        VaccinationsView()
                    } label: {
                        HomeCard(
                            title: "التطعيمات",
                            icon: "calendar.badge.clock"
                        )
                    }

                    NavigationLink {
                        CoursesView()
                    } label: {
                        HomeCard(
                            title: "الدورات",
                            icon: "play.rectangle.fill"
                        )
                    }

                    Button {
                        appState.selectedTab = .pets
                    } label: {
                        HomeCard(
                            title: "حلالك",
                            icon: "pawprint.fill"
                        )
                    }

                    NavigationLink {
                        VeterinaryInformationView()
                    } label: {
                        HomeCard(
                            title: "المعلومات والتوعية",
                            icon: "book.fill"
                        )
                    }
                }

                Text(
                    """
                    فزاع لا يقدم جرعات دوائية أو وصفات طبية داخل التطبيق.
                    """
                )
                .font(.footnote)
                .foregroundStyle(.secondary)
                .padding()
            }
        }
        .navigationTitle("الرئيسية")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .environmentObject(AppState())
        }
    }
}
