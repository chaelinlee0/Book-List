import SwiftUI

struct BookForm: View {
    @Binding var data: Book.FormData
    var body: some View {
        Form{
            TextFieldWithLabel(label: "ID", text: $data.id, prompt: "Enter the id")
            TextFieldWithLabel(label: "Title", text: $data.title, prompt: "Enter the Title")
            TextFieldWithLabel(label: "Author", text: $data.author, prompt: "Tell me the Author")
        }
    }
}

struct TextFieldWithLabel: View {
  let label: String
  @Binding var text: String
  var prompt: String? = nil

  var body: some View {
    VStack(alignment: .leading) {
      Text(label)
        .bold()
        .font(.caption)
      TextField(label, text: $text, prompt: prompt != nil ? Text(prompt!) : nil)
        .padding(.bottom, 20)
    }
  }
}

struct BookForm_Previews: PreviewProvider {
    static var previews: some View {
      BookForm(data: Binding.constant(Book.previewData[0].dataForForm))
    }
}
