
import 'package:fetching_api/cubit/book_cubit.dart';
import 'package:fetching_api/cubit/book_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Fetching data from API")),
        body: BlocBuilder<BookCubit,BookState>(
          builder:
          (context,state){
            if (state is BookLoading)
            {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is BookError)
            {
              return Center(child: Text("error occured: ${state.error}"),);
            }
            if (state is BookLoaded)
            {
              final book = state.b;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    width: 300,
                    height: 600,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255, 144, 18, 18)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(book.title),
                        Text(book.authors?.join(', ') ?? 'No Authors'),
                        if (book.imageLinks.startsWith('http'))
                          Image.network(book.imageLinks, errorBuilder: (context, error, stackTrace) => const Text('Image failed to load')),
                        if (!book.imageLinks.startsWith('http'))
                          const Text('No valid image available'),
                      ],
                    )
                  )
                  ),
              );
                
            }
            return const Center(child: Text('Initial State'));
          }
           )
        );
  }
}
