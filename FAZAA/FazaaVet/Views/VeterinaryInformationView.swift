//
//  VeterinaryInformationView.swift
//  Fazaa Vet
//

import SwiftUI

struct VeterinaryInformationView: View {

    var body: some View {

        List {

            Section(
                "العناية"
            ) {

                NavigationLink(
                    "العناية بالقطط"
                ) {

                    EducationalArticleView(
                        title:
                        "العناية بالقطط"
                    )
                }

                NavigationLink(
                    "العناية بالكلاب"
                ) {

                    EducationalArticleView(
                        title:
                        "العناية بالكلاب"
                    )
                }

                NavigationLink(
                    "العناية بالطيور"
                ) {

                    EducationalArticleView(
                        title:
                        "العناية بالطيور"
                    )
                }

                NavigationLink(
                    "العناية بالخيول"
                ) {

                    EducationalArticleView(
                        title:
                        "العناية بالخيول"
                    )
                }

                NavigationLink(
                    "العناية بالإبل"
                ) {

                    EducationalArticleView(
                        title:
                        "العناية بالإبل"
                    )
                }
            }

            Section(
                "المواسم"
            ) {

                NavigationLink(
                    "العناية في الصيف"
                ) {

                    EducationalArticleView(
                        title:
                        "العناية في الصيف"
                    )
                }

                NavigationLink(
                    "العناية في الشتاء"
                ) {

                    EducationalArticleView(
                        title:
                        "العناية في الشتاء"
                    )
                }
            }
        }
        .navigationTitle(
            "العناية والتوعية"
        )
    }
}

struct EducationalArticleView: View {

    let title: String

    var body: some View {

        ScrollView {

            VStack(
                alignment: .trailing,
                spacing: 20
            ) {

                Text(title)
                    .font(.largeTitle.bold())

                Text(
                    """
                    يتم جلب المحتوى هنا من قاعدة البيانات.

                    يجب مراجعة المحتوى الصحي أو الطبي بواسطة مختص بيطري قبل نشره للمستخدمين.
                    """
                )

                Divider()

                Text(
                    """
                    هذا المحتوى توعوي ولا يمثل تشخيصًا بيطريًا أو وصفة طبية.
                    """
                )
                .font(.footnote)
                .foregroundStyle(
                    .secondary
                )
            }
            .padding()
        }
    }
}
