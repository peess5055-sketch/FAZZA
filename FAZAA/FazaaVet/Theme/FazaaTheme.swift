//
//  FazaaTheme.swift
//  Fazaa Vet
//
//  نظام الألوان الرسمي للتطبيق — أخضر وأبيض فقط.
//  أي شاشة جديدة لازم تستخدم هذي الألوان بدل الألوان الافتراضية
//  عشان تحافظ الهوية البصرية على لونين فقط.
//

import SwiftUI

extension Color {

    /// اللون الأساسي للعلامة — أخضر غامق (فزاع)
    static let fazaaGreen = Color(
        red: 0.02,
        green: 0.35,
        blue: 0.20
    )

    /// درجة أفتح من الأخضر، تستخدم للخلفيات الخفيفة أو الحدود
    static let fazaaGreenLight = Color(
        red: 0.85,
        green: 0.93,
        blue: 0.88
    )

    /// الأبيض الرسمي للخلفيات والبطاقات
    static let fazaaWhite = Color.white
}

/// نمط بطاقة موحّد (خلفية بيضاء + حد أخضر خفيف) بدل thinMaterial
/// عشان نتجنب أي رمادي/شفافية تكسر قاعدة اللونين.
struct FazaaCardBackground: ViewModifier {

    func body(content: Content) -> some View {

        content
            .background(Color.fazaaWhite)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.fazaaGreenLight, lineWidth: 1.5)
            )
            .clipShape(
                RoundedRectangle(cornerRadius: 20)
            )
    }
}

extension View {

    func fazaaCardStyle() -> some View {

        modifier(FazaaCardBackground())
    }
}
