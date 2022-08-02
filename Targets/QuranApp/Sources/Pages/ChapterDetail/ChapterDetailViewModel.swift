import Foundation

@MainActor
final class ChapterDetailViewModel: ObservableObject {
    var chapter: Chapter
    @Published var verses: [Verse] = []
    @Published var error: APIError?

    init(chapter: Chapter) {
        self.chapter = chapter
        getVerses()
    }

    func getVerses() {
        Task {
            do {
                verses = try await VerseRepository().getVerses(by: chapter).verses
            } catch let err as APIError {
                error = err
            }
        }
    }
}
