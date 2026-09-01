import SwiftUI

struct ProfileView: View {

    var body: some View {
        List {
            Section(header: Text("الحساب")) {
                Label("البيانات الشخصية", systemImage: "person.fill")
                Label("الإشعارات", systemImage: "bell.fill")
                Label("طرق الدفع", systemImage: "creditcard.fill")
            }

            Section(header: Text("الإعدادات")) {
                Label("الخصوصية", systemImage: "lock.fill")
                Label("الشروط والأحكام", systemImage: "doc.text.fill")
                Label("تواصل معنا", systemImage: "message.fill")
            }

            Section(header: Text("التطبيق")) {
                Text("فزاع | طبيبك البيطري")
                    .font(.headline)
                Text("نسخة التطوير الأولية")
                    .foregroundColor(.secondary)
            
            }
        }
        .navigationTitle("حسابي")
    }
}
