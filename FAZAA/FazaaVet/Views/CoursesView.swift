//
//  CoursesView.swift
//  Fazaa Vet
//

import SwiftUI

struct CoursesView: View {

    @EnvironmentObject var appState: AppState

    var body: some View {

        List(
            appState.repository.courses
        ) { course in

            VStack(
                alignment: .trailing,
                spacing: 8
            ) {

                Text(course.title)
                    .font(.headline)

                Text(
                    course.description
                )

                Text(
                    "\(course.lessons) دروس"
                )

                Text(
                    course.isFree
                    ?
                    "مجاني"
                    :
                    "مدفوع"
                )
                .foregroundStyle(
                    .secondary
                )
            }
        }
        .navigationTitle(
            "الكورسات"
        )
    }
}
