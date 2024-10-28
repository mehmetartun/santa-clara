import 'package:flutter/material.dart';
import 'package:santa_clara/models/article.dart';
import 'package:santa_clara/widgets/main_drawer.dart';

class ArticlesAddArticleView extends StatefulWidget {
  final void Function(Map<String, dynamic>) saveArticleCallback;
  final void Function() close;
  const ArticlesAddArticleView(
      {super.key, required this.saveArticleCallback, required this.close});

  @override
  State<ArticlesAddArticleView> createState() => _ArticlesAddArticleViewState();
}

class _ArticlesAddArticleViewState extends State<ArticlesAddArticleView> {
  Map<String, dynamic> data = {'title': null, 'author': null, 'text': null};
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text("Articles"),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: widget.close,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add Article",
                  style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Title",
                ),
                onSaved: (val) {
                  data['title'] = val;
                },
                validator: (val) {
                  if (val?.trim().isEmpty ?? true) {
                    return "Cannot be empty";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Author",
                ),
                onSaved: (val) {
                  data['author'] = val;
                },
                validator: (val) {
                  if (val?.trim().isEmpty ?? true) {
                    return "Cannot be empty";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Text",
                ),
                onSaved: (val) {
                  data['text'] = val;
                },
                minLines: 5,
                maxLines: 10,
                validator: (val) {
                  if (val?.trim().isEmpty ?? true) {
                    return "Cannot be empty";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                child: FilledButton(
                  child: Text("Save"),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      widget.saveArticleCallback(data);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
