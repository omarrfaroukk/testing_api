import '../api/Book.dart';

class BookState {}

class BookInitial extends BookState{}

class BookLoading extends BookState{}

class BookLoaded extends BookState{
  Book b;
  BookLoaded(this.b);
}

class BookError extends BookState{
  String error;
  BookError(this.error);
}