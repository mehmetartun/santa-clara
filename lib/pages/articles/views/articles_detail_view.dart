import 'package:flutter/material.dart';
import 'package:santa_clara/models/article.dart';
import 'package:santa_clara/widgets/main_drawer.dart';

class ArticlesDetailView extends StatelessWidget {
  final void Function() close;
  final Article article;
  const ArticlesDetailView(
      {super.key, required this.article, required this.close});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(title: Text("Article"), actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: close,
          )
        ]),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(article.title,
                    style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(height: 10),
                Text(article.author,
                    style: Theme.of(context).textTheme.titleMedium),
                SizedBox(height: 10),
                Text(article.text,
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
        ));
  }
}
