//
//  InfoRow.swift
//  Fazaa Vet
//

import SwiftUI

struct InfoRow: View {

    let title: String

    let value: String

    var body: some View {

        HStack {

            Text(value)

            Spacer()

            Text(title)
                .fontWeight(.semibold)
        }
    }
}
