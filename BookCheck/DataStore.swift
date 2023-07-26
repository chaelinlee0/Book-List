import Foundation

class DataStore: ObservableObject {
    @Published var books: [Book] = Book.previewData
    @Published var readingList: [Book] = []

    func createBook(_ book: Book){
        books.append(book)
    }
    
    func updateBook(_ book: Book){
        if let index = books.firstIndex(where: {$0.id == book.id}){
            books[index] = book
        }
    }
    
    func deleteBook(_ book: Book){
        if let index = books.firstIndex(where: {$0.id == book.id}){
            books.remove(at: index)
        }
    }
    
    func addToReadingList(_ book: Book) {
            readingList.append(book)
    }

    func removeFromReadingList(_ book: Book) {
        if let index = readingList.firstIndex(where: {$0.id == book.id}) {
            readingList.remove(at: index)
        }
    }

}
