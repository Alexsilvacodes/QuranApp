import Foundation

enum APIError: Error {
    case networking(URLError)
    case encoding(EncodingError)
    case decoding(DecodingError)
    case other(String)
}
