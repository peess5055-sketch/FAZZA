//
//  EmergencyView.swift
//  Fazaa Vet
//

import SwiftUI

struct EmergencyView: View {

    @EnvironmentObject var appState: AppState

    private var availableVets: [Veterinarian] {

        appState.repository.veterinarians.filter {
            $0.availability == .available
        }
    }

    var body: some View {

        List {

            Section {

                VStack(
                    alignment: .trailing,
                    spacing: 10
                ) {

                    Label(
                        "حالة طارئة؟",
                        systemImage: "exclamationmark.triangle.fill"
                    )
                    .font(.title3.bold())
                    .foregroundStyle(Color.fazaaGreen)

                    Text(
                        "تواصل فورًا مع أقرب طبيب بيطري متاح، أو اتصل بالخط الساخن أدناه."
                    )
                    .foregroundStyle(.secondary)
                }
                .frame(
                    maxWidth: .infinity,
                    alignment: .trailing
                )
                .padding(.vertical, 6)
            }

            Section(
                "تواصل فوري"
            ) {

                Link(
                    destination: URL(string: "tel:0000000000")!
                ) {

                    Label(
                        "اتصال بالخط الساخن",
                        systemImage: "phone.fill"
                    )
                    .foregroundStyle(Color.fazaaGreen)
                }
            }

            Section(
                "الأطباء المتاحون الآن"
            ) {

                if availableVets.isEmpty {

                    Text(
                        "لا يوجد طبيب متاح الآن، جرّب حجز استشارة من قائمة الأطباء."
                    )
                    .foregroundStyle(.secondary)

                } else {

                    ForEach(availableVets) { vet in

                        NavigationLink {

                            VeterinarianDetailView(
                                veterinarian: vet
                            )

                        } label: {

                            VStack(
                                alignment: .trailing,
                                spacing: 4
                            ) {

                                Text(vet.name)
                                    .font(.headline)

                                Text(
                                    "\(vet.city) • \(vet.specialty)"
                                )
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }

            Section {

                Text(
                    """
                    هذا القسم مبدئي لأغراض التطوير حاليًا، ويجب ربطه برقم طوارئ رسمي وفريق استجابة فعلي قبل إطلاق التطبيق.
                    """
                )
                .font(.footnote)
                .foregroundStyle(.secondary)
            }
        }
        .navigationTitle(
            "الحالات الطارئة"
        )
    }
}
