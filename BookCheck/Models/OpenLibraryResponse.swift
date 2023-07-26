import Foundation

struct OpenLibraryResponse: Decodable {
  var responseContainer: OpenLibraryResponseContainer

  enum CodingKeys: String, CodingKey {
    case responseContainer = "description"
  }
}

struct OpenLibraryResponseContainer: Decodable {
  var synopsis: String

  enum CodingKeys: String, CodingKey {
    case synopsis = "value"
  }
}

