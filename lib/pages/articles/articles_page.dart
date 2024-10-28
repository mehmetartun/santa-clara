import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santa_clara/pages/articles/cubit/articles_cubit.dart';
import 'package:santa_clara/pages/articles/views/articles_add_article_view.dart';
import 'package:santa_clara/pages/articles/views/articles_detail_view.dart';
import 'package:santa_clara/pages/articles/views/articles_loaded_view.dart';
import 'package:santa_clara/pages/articles/views/articles_loading_view.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticlesCubit()..init(),
      child: BlocBuilder<ArticlesCubit, ArticlesState>(
        builder: (context, state) {
          switch (state) {
            case ArticlesLoaded _:
              return ArticlesLoadedView(
                articles: state.articles,
                addArticleCallback: state.addArticleCallback,
                deleteArticleCallback: state.deleteArticleCallback,
                viewArticleCallback: state.viewArticleCallback,
              );
            case ArticlesEdit _:
              return Container();
            case ArticlesDetail _:
              return ArticlesDetailView(
                  article: state.article, close: state.close);
            case ArticlesEditArticle _:
              return Container();
            case ArticlesAddArticle _:
              return ArticlesAddArticleView(
                saveArticleCallback: state.saveArticleCallback,
                close: state.close,
              );
            case ArticlesInitial _:
            default:
              return ArticlesLoadingView();
          }
        },
      ),
    );
  }
}
