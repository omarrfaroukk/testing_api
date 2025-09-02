class Book {
  final String title;
  final List<String>? authors;
  final String publishedDate;
  final String imageLinks;


  Book(
      {required this.title,
      required this.authors,
      required this.publishedDate,
      required this.imageLinks
      });

  factory Book.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'] as Map<String, dynamic>;
    return Book(
        title: volumeInfo['title'] as String? ?? 'No title',
        authors: (volumeInfo['authors'] as List<dynamic>?)?.cast<String>(),
        publishedDate:
            volumeInfo['publishedDate'] as String? ?? 'No description',
        imageLinks: 
            volumeInfo['imageLinks']['small'] as String? ?? 'No image',
        );
  }
}
