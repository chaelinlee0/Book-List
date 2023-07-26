import Foundation
import CoreLocation

struct OpenLibraryEndpoint: Decodable {
    static let baseUrl = "https://openlibrary.org/works"
    

    static func path(userInput: String) -> String {
        return "\(baseUrl)/\(userInput).json"
      }
}


