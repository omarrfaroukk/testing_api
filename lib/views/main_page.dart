import 'package:fetching_api/api/api_service.dart';
import 'package:fetching_api/api/Book.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final apiservice = ApiService(); // Create an instance of ApiService class
    return Scaffold(
        appBar: AppBar(title: const Text("Fetching data from API")),
        body: FutureBuilder<Book>(
          future: apiservice.fetchBook(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                  child: Text("Error has occured: ${snapshot.error}"));
            }
            final book = snapshot.data ??
                Book(title: 'No Data', authors: [], publishedDate: '', imageLinks: '');
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  width: 400,
                  height: 700,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color.fromARGB(255, 144, 18, 18)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(book.title),
                      Text("by: ${book.authors?.join(', ') ?? 'No Authors'}"),
                      Text(book.publishedDate),
                      Padding(
                        padding:const EdgeInsets.all(50),
                        child: Image.network(book.imageLinks))
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
