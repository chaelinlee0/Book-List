import SwiftUI

struct TabContainer: View {
  
  var body: some View {
    TabView{
      NavigationView {
        BookList()
      }
      .tabItem {
        Label("Books", systemImage: "book")
      }
      NavigationView {
        ReadingList(book: Binding.constant( Book.previewData[1]))
      }
      .tabItem {
        Label("Reading List", systemImage: "list.star")
      }
    }
  }
}

struct TabContainer_Previews: PreviewProvider {
  static var previews: some View {
    TabContainer()
  }
}
