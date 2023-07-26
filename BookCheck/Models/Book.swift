import Foundation

struct Book: Identifiable {
  var id: String
  var title: String
  var author: String
  var coverUrl: URL?

  struct FormData {
    var id: String = ""
    var title: String = ""
    var author: String = ""
  }

  var dataForForm: FormData {
    FormData(
      id: id,
      title: title,
      author: author
    )
  }

  static func create(from formData: FormData) -> Book {
    Book(id: formData.id, title: formData.title, author: formData.author)
  }
}

extension Book {
  static let previewData = [
    Book(id: "OL28003301M", title: "Wolf Hall", author: "Hilary Mantel", coverUrl: URL(string:"https://education-jrp.s3.amazonaws.com/BookImages/Book-WolfHall.jpg")!),
    Book(id: "OL25773328M", title: "Between the World and Me", author: "Ta-Nehisi Coates", coverUrl: URL(string:"https://education-jrp.s3.amazonaws.com/BookImages/Book-BetweenTheWorld.jpg")!),
    Book(id: "OL32312251M", title: "The Wind-Up Bird Chronicle", author: "Haruki Murakami", coverUrl: URL(string:"https://education-jrp.s3.amazonaws.com/BookImages/Book-WindUpBird.jpg")!),
    Book(id: "OL28287554M", title: "Half of a Yellow Sun", author: "Chimamanda Ngozi Adichie", coverUrl: URL(string:"https://education-jrp.s3.amazonaws.com/BookImages/Book-YellowSun.jpg")!),
    Book(id: "OL28132170M", title: "The God of Small Things", author: "Arundhati Roy", coverUrl: URL(string:"https://education-jrp.s3.amazonaws.com/BookImages/Book-GodSmallThings.jpg")!),
    Book(id: "OL20670294W", title: "Kim Jiyoung, Born 1982", author: "Cho Nam-joo", coverUrl: URL(string:"https://education-jrp.s3.amazonaws.com/BookImages/Book-KimJiyoung.jpg")!),
    Book(id: "OL20783698W", title: "On Earth We're Briefly Gorgeous", author: "Ocean Vuong", coverUrl: URL(string:"https://education-jrp.s3.amazonaws.com/BookImages/Book-OnEarth.jpg")!),
    Book(id: "badid", title: "Book with Bad Id", author: "Jon Phillips")
  ]
}
