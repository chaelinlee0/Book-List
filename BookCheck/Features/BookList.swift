import SwiftUI

struct BookList: View {
    @EnvironmentObject var dataStore: DataStore
    @State var editBookFormData = Book.FormData()
    @State var EditingBookForm: Bool = false
    
    var body: some View {
        NavigationStack {
            List($dataStore.books) { $book in
                NavigationLink(destination: BookDetails(book: $book)) {
                    BookRow(book: $book)
                }
            }
            .navigationTitle("Books-cl547")
            .listStyle(.plain)
            .toolbar {
              ToolbarItem(placement: .navigationBarTrailing) {
                Button("Create") { EditingBookForm.toggle() }
              }
            }
            .sheet(isPresented: $EditingBookForm) {
              NavigationStack {
                BookForm(data: $editBookFormData)
                  .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                      Button("Cancel") { EditingBookForm = false }
                      
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                      Button("Save") {
                          let newBook = Book.create(from: editBookFormData)
                        dataStore.createBook(newBook)
                        EditingBookForm = false
                      }
                    }
                  }
              }
              .padding()
            }
        }
    }
}

struct BookRow: View {
    @Binding var book: Book
    
    var body: some View {
        HStack {
            AsyncImage(url: book.coverUrl, content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }, placeholder: {
                if book.coverUrl != nil {
                    ProgressView()
                }
                else {
                  Image(systemName: "book")
                    .font(.largeTitle)
                }
            })
            .frame(maxWidth: 50, maxHeight: 70)
            VStack(alignment:.leading) {
                Text(book.title)
                    .bold(true)
                Text(book.author)
                    .fontWeight(.light)
            }
            .padding()
                Spacer()
        }
    }
}

struct BookList_Previews: PreviewProvider {
    static var previews: some View {
        BookList()
        .environmentObject(DataStore())
    }
}


