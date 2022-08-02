import Foundation

struct VerseRepository {
    func getVerses(by chapter: Chapter) async throws -> VersesResponse {
        guard let chapterId = chapter.id,
            let url = URL(string: "https://api.quran.com/api/v4/verses/by_chapter/\(chapterId)?language=en&words=true&page=1&per_page=10") else {
            throw APIError.networking(URLError(.badURL))
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        do {
            return try decoder.decode(VersesResponse.self, from: data)
        } catch let error as DecodingError {
            throw APIError.decoding(error)
        }
    }
}
