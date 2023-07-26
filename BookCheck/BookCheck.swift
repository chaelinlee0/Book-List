import SwiftUI

@main
struct BookCheck: App {
    @StateObject var synopsisLoader = SynopsisLoader(apiClient: OpenLibraryAPIClient())
    @StateObject var dataStore = DataStore()
    var body: some Scene {
        WindowGroup {
            TabContainer()
                .environmentObject(synopsisLoader)
                .environmentObject(dataStore)
        }
    }
}
