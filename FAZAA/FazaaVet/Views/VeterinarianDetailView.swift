import SwiftUI

struct VeterinarianDetailView: View {
    let veterinarian: Veterinarian

    var body: some View {
        ScrollView {
            VStack(
                alignment: .trailing,
                spacing: 18
            ) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .frame(maxWidth: .infinity)

                Text(veterinarian.name)
                    .font(.title.bold())

                Divider()

                Group {
                    InfoRow(title: "التخصص", value: veterinarian.specialty)
                    InfoRow(title: "المدينة", value: veterinarian.city)
                    InfoRow(title: "الخبرة", value: "\(veterinarian.yearsOfExperience) سنوات")
                    InfoRow(title: "الترخيص", value: veterinarian.licenseNumber)
                    InfoRow(title: "التقييم", value: String(format: "%.1f", veterinarian.rating))
                }

                Text(veterinarian.bio)
                    .padding(.vertical)

                NavigationLink {
                    BookConsultationView(veterinarian: veterinarian)
                } label: {
                    Text("احجز استشارة")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.fazaaGreen)
                        .cornerRadius(12)
                }

                Text("السعر \(String(describing: veterinarian.consultationPrice)) ريال")            }
            .padding()
        }
        .navigationTitle("الطبيب البيطري")
    }
}
