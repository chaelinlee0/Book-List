import Foundation

class SynopsisLoader: ObservableObject {
  let apiClient: OpenLibraryAPIClient
  @Published private(set) var state: LoadingState = .idle

  enum LoadingState {
    case idle
    case loading
    case success(data: OpenLibraryResponse)
    case failed(error: Error)
  }

  init(apiClient: OpenLibraryAPIClient) {
    self.apiClient = apiClient
  }

  @MainActor
    func loadSynopsis(book:Book) async {
    self.state = .loading
    do {
        let openLibraryResponse = try await apiClient.fetchSynopsis(userInput: book.id)
        self.state = .success(data: openLibraryResponse)
      } catch {
        self.state = .failed(error: error)
      }
  }
}
