import Foundation

protocol ChapterRepositoryProtocol {
    func getChapters() async throws -> [Chapter]
}

struct ChapterRepository {
    func getChapters() async throws -> ChaptersResponse {
        guard let url = URL(string: "https://api.quran.com/api/v4/chapters?language=en") else {
            throw APIError.networking(URLError(.badURL))
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        do {
            return try decoder.decode(ChaptersResponse.self, from: data)
        } catch let error as DecodingError {
            throw APIError.decoding(error)
        }
    }
}
