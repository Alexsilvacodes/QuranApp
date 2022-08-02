import Foundation

@MainActor
final class ChapterListViewModel: ObservableObject {
    @Published var chapters: [Chapter] = []
    @Published var error: APIError?

    func getChapters() {
        Task {
            do {
                chapters = try await ChapterRepository().getChapters().chapters
            } catch let err as APIError {
                error = err
            }
        }
    }
}
