import Foundation

struct Verse: Codable, Identifiable, Hashable {
    struct Translation: Codable, Hashable {
        let text: String?
        let languageName: String?
    }

    struct Word: Codable, Hashable {
        let id: Int?
        let position: Int
        let text: String
        let translation: Translation
    }

    let id: Int
    let verseNumber: Int
    let verseKey: String
    let versesCount: Int?
    let textUthmani: String?
    let words: [Word]?
}
