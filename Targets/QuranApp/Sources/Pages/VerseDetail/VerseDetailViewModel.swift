import Foundation

@MainActor
final class VerseDetailViewModel: ObservableObject {
    var verse: Verse

    init(verse: Verse) {
        self.verse = verse
    }
}
