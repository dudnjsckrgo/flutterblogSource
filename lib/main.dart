import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Blog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blueGrey,
        ).copyWith(
          secondary: Colors.amber,
        ),
      ),
      home: const MyHomePage(title: 'My Blog Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Blog Post $index'),
            subtitle: Text('This is the content of blog post $index.'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlogPostPage(index: index),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class BlogPostPage extends StatelessWidget {
  final int index;

  const BlogPostPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog Post $index'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('This is the content of blog post $index.'),
      ),
    );
  }
}
