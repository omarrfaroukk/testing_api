import 'package:bloc/bloc.dart';
import 'package:fetching_api/api/Book.dart';
import 'package:fetching_api/api/api_service.dart';

import 'book_state.dart';

class BookCubit extends Cubit<BookState>{
  final ApiService _apiService ;
  BookCubit(this._apiService) : super(BookInitial());

  Future <void> fetchBook()async
  {
    try{
      emit(BookLoading());
      final book = await _apiService.fetchBook();
      emit(BookLoaded(book));
    }catch(e){
      emit(BookError(e.toString()));
    }
  }
}