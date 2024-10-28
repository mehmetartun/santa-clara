import 'package:flutter/material.dart';
import 'package:santa_clara/widgets/main_drawer.dart';

class ArticlesLoadingView extends StatelessWidget {
  const ArticlesLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(title: Text("Articles")),
        body: Center(child: CircularProgressIndicator()));
  }
}
