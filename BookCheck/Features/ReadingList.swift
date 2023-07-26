import SwiftUI

struct ReadingList: View {
    @EnvironmentObject var dataStore: DataStore
    @State var books = Book.previewData
    @Binding var book: Book
    
    
    var body: some View {
        NavigationStack{
            List {
                ForEach($dataStore.readingList)
                {book in
                    NavigationLink(destination: BookDetails(book: $book)){
                        BookRow(book: $book)
                    }
                }
                .swipeActions(edge: .trailing) {
                    Button(role: .destructive) {
                        dataStore.deleteBook(book)
                    } label: { Label("Delete", systemImage: "trash") }
            }
        }
            .navigationTitle("ReadingList")
        }
    }
}



struct ReadingList_Previews: PreviewProvider {
    static var previews: some View {
        ReadingList(book: Binding.constant( Book.previewData[1]))
    }
}


