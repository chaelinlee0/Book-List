# Book-List

## Functionality
You have two lists, a list of books and a reading list. When you tap on a book, you can see detail about that book: the book cover, title, author, and the synopsis fetched from OpenLibrary. There is also a button in the upper right corner. If the book is not on the reading list, it says “Add to List”. If the book is on the reading list, it says “Remove from List”. And, clearly, that button adds and removes books on the reading list. You can view the reading list by tapping on its tab button. The books on the reading list are not click-able, but you can swipe them to remove them from the reading list. <br />

## Book Model
The book model includes an id, title, the author’s name, and a coverUrl for the image. You’ll want to have the app fetch the cover image and display it.<br />

## API 
OpenLibrary documentation is here: https://openlibrary.org/dev/docs/api/books <br />

## DataStore 
The DataStore will have two arrays: an array of books, and an array of books that are currently on your reading list. You may not add a boolean to your book model to indicate it is on the list; you will add it and remove it to the array that you create in the DataStore. It will also be the DataStore’s job to actually add and remove books on the readingList as well as allowing you to create a new book.
BookList - Displays the list of books! You can create a new book from this page or navigate to a detail view.
BookForm - If you type the Create button on the BookList, you will display a form in a modal sheet. The form only needs to provide for an id field, a title, and an author. Do not worry about the URL. You do not have to support editing books. The form should clear it’s data after a cancel or a successful create.<br />

## ReadingList
Displays the current reading list. Also has a delete swipe action to facilitate remove items from the reading list. <br />

## SynopsisLoader 
Will start the API call to fetch the synopsis and will provide the current state of that call <br />

## BookDetail 
Displays the book details. It also has a toolbar with a button that lets you Add and Remove a book from the readingList. And it tells the SynopsisLoader to go get the book synopsis and displays an error if there was an API error. This view is a little different than what you’ve done with an API call in that only a portion of the page is populated with what you’re getting from the API. Make sure to show a ProgressView() for the synopsis until it is loaded.<br />
## OpenLibraryEndpoint 
This will construct the URL to make the API call OpenLibraryAPIService - This will actually make the API call.
