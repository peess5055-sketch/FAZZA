//
//  FazaaEmblem.swift
//  Fazaa Vet
//
//  شعار مبسّط (شخص وناقته) للبانر العلوي بالرئيسية.
//  مرسوم بأشكال بسيطة فقط (Capsule / Circle / Ellipse) بلون واحد
//  التزامًا بهوية التطبيق البصرية (أخضر وأبيض فقط) — بدون أي صورة خارجية.
//

import SwiftUI

struct FazaaEmblem: View {

    var color: Color = .fazaaWhite

    var body: some View {

        HStack(alignment: .bottom, spacing: -4) {

            personFigure

            camelFigure
        }
        .frame(height: 72)
        .accessibilityHidden(true)
    }

    // MARK: - الشخص

    private var personFigure: some View {

        VStack(spacing: 3) {

            Circle()
                .fill(color)
                .frame(width: 13, height: 13)

            Capsule()
                .fill(color)
                .frame(width: 12, height: 24)

            HStack(spacing: 5) {

                Capsule()
                    .fill(color)
                    .frame(width: 4.5, height: 18)

                Capsule()
                    .fill(color)
                    .frame(width: 4.5, height: 18)
            }
        }
    }

    // MARK: - الناقة

    private var camelFigure: some View {

        ZStack(alignment: .bottom) {

            HStack(spacing: 11) {

                ForEach(0..<4, id: \.self) { _ in

                    Capsule()
                        .fill(color)
                        .frame(width: 5, height: 28)
                }
            }
            .padding(.horizontal, 6)

            VStack(spacing: -4) {

                Ellipse()
                    .fill(color)
                    .frame(width: 24, height: 20)
                    .offset(x: 6)

                Capsule()
                    .fill(color)
                    .frame(width: 76, height: 26)
            }
            .offset(y: -22)

            Capsule()
                .fill(color)
                .frame(width: 9, height: 32)
                .rotationEffect(.degrees(-35))
                .offset(x: 32, y: -48)

            Ellipse()
                .fill(color)
                .frame(width: 15, height: 9)
                .offset(x: 44, y: -66)
        }
        .frame(width: 92, height: 72)
    }
}

struct FazaaEmblem_Previews: PreviewProvider {

    static var previews: some View {

        FazaaEmblem()
            .padding(40)
            .background(Color.fazaaGreen)
    }
}
