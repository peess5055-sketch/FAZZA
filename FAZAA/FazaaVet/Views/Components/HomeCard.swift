import SwiftUI

struct HomeCard: View {
    let title: String
    let icon: String

    var body: some View {
        VStack(spacing: 14) {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(Color.fazaaGreen)

            Text(title)
                .font(.headline)
                .foregroundColor(Color.fazaaGreen)
                .multilineTextAlignment(.center)
        }
        .frame(
            maxWidth: .infinity,
            minHeight: 130
        )
        .fazaaCardStyle()
    }
}
