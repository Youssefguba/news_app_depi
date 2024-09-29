import 'package:flutter/material.dart';
import 'package:news_app/news_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NewScreen(),
    );
  }
}

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  late Future<List<dynamic>> listOfNews;

  @override
  void initState() {
    super.initState();
    listOfNews = NewsRepository().getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed Screen'),
      ),
      body: FutureBuilder(
        future: listOfNews,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data != null) {
            final list = snapshot.data as List<dynamic>;

            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                final item = list[index];
                return ListTile(
                  title: Text(
                    item['title'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(item['author']),
                  trailing: Image.network(
                    item['urlToImage'],
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    // TODO (2) Navigate the data to new screen
                    // getHttp();
                  },
                );
              },
            );
          }

          return const Text('There is an error, try again!');
        },
      ),
    );
  }
}
