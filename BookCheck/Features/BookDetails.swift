import SwiftUI

struct BookDetails: View {
    @Binding var book: Book
    @EnvironmentObject var synopsisLoader: SynopsisLoader
    @EnvironmentObject var dataStore: DataStore
    @State private var isAddingtoReadingList: Bool = false
    
//    init(book: Binding<Book>) {
//        self._book = book
//        self._isAddingtoReadingList = State(initialValue: dataStore.readingList.contains{$0.title == book.wrappedValue.title})
//    }
    
    var body: some View {
        ScrollView {
            AsyncImage(url: book.coverUrl,
                       content: {image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            }, placeholder: {
                ProgressView()}
            )
            Text(book.title)
                .font(.largeTitle)
            
            Text(book.author)
                .font(.headline)
                .padding(.bottom, 20)
            Text("Synopsis")
            switch synopsisLoader.state {
            case .idle: Color.clear
            case .loading: ProgressView()
            case .failed(let error): Text("Error \(error.localizedDescription)")
            case .success(let response):
                Text(response.responseContainer.synopsis)
            }
        }
        .task { await synopsisLoader.loadSynopsis(book: book) }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    if ((isAddingtoReadingList == false)){
                        dataStore.addToReadingList(book)
                    }
                    else {
                        dataStore.removeFromReadingList(book)
                    }
                    isAddingtoReadingList.toggle()
                }) {
                    Text(self.isAddingtoReadingList == false ? "Add to List" : "Remove from the List")
                }
            }
        }
    }
}

struct BookDetails_Previews: PreviewProvider {
    static var previews: some View {
        BookDetails(book: Binding.constant( Book.previewData[1]))
            .environmentObject(DataStore())
    }
}

