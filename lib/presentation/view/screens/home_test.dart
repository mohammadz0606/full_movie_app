import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/get_data.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: Consumer<GetDataAPIProvider>(
        builder: (context, provider, _) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (provider.result.isLoading)
                  const CircularProgressIndicator(),
                if (provider.result.isError)
                  Text('Error: ${provider.result.error}'),
                if (provider.result.isOk)
                  Column(
                    children: [
                      const Text('Data Fetched Successfully!'),
                      Text('Number of Movies: ${provider.popularMovie.length}'),
                    ],
                  ),
                ElevatedButton(
                  onPressed: () {
                    provider.getPopularMovies();
                  },
                  child: const Text('Fetch Popular Movies'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
