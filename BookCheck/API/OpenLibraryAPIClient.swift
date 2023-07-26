import CoreLocation

protocol OpenLibraryAPI {
  func fetchSynopsis(userInput: String) async throws -> OpenLibraryResponse
}


struct OpenLibraryAPIClient: OpenLibraryAPI, APIClient {
    let session: URLSession = .shared
    

    
    func fetchSynopsis(userInput: String) async throws -> OpenLibraryResponse {
        let path = OpenLibraryEndpoint.path(userInput: userInput)
        let response: OpenLibraryResponse = try await performRequest(url: path)
        return response
    }
}
