import Foundation

struct Chapter: Codable, Identifiable, Hashable {
    struct TranslatedName: Codable, Hashable {
        let languageName: String
        let name: String
    }

    let id: Int?
    let nameComplex: String?
    let nameArabic: String?
    let versesCount: Int?
    let translatedName: TranslatedName
}
