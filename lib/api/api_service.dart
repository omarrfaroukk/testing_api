
import 'package:dio/dio.dart';
import 'package:fetching_api/api/Book.dart';


class ApiService {
  final Dio _dio = Dio();

   Future <Book> fetchBook() async
  {
    final response = await _dio.get('https://www.googleapis.com/books/v1/volumes/zyTCAlFPjgYC?utm_source=chatgpt.com');
    if (response.statusCode ==200){
      return Book.fromJson(response.data);
    }else{
      throw Exception('Failed to load data');
    }
  }
}