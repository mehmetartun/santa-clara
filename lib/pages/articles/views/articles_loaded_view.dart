import 'package:flutter/material.dart';
import 'package:santa_clara/models/article.dart';
import 'package:santa_clara/widgets/main_drawer.dart';

class ArticlesLoadedView extends StatelessWidget {
  final List<Article> articles;
  final void Function() addArticleCallback;
  final void Function({String? id}) deleteArticleCallback;
  final void Function(Article article) viewArticleCallback;
  const ArticlesLoadedView({
    super.key,
    required this.articles,
    required this.addArticleCallback,
    required this.deleteArticleCallback,
    required this.viewArticleCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: Text("Articles"), actions: [
        TextButton(child: Text("Add"), onPressed: addArticleCallback)
      ]),
      body: ListView(
          children: articles.map((article) {
        return GestureDetector(
          onTap: () {
            viewArticleCallback(article);
          },
          child: ListTile(
              title: Text(article.title),
              subtitle: Text(article.author),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  bool? confirmDelete = await showDialog<bool>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          title: Text("Confirm Deletion"),
                          content: Text(
                              "Are you sure you want to delete this article permanently?"),
                          actions: [
                            FilledButton.tonal(
                              child: Text("Yes"),
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                            ),
                            FilledButton(
                              child: Text("Cancel"),
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                            )
                          ]);
                    },
                  );

                  if (confirmDelete ?? false) {
                    deleteArticleCallback(id: article.id);
                  }
                },
              )),
        );
      }).toList()),
    );
  }
}
