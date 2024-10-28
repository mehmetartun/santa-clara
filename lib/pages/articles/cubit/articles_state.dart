part of 'articles_cubit.dart';

@immutable
sealed class ArticlesState {}

final class ArticlesInitial extends ArticlesState {}

final class ArticlesLoaded extends ArticlesState {
  final List<Article> articles;
  final void Function() addArticleCallback;
  final void Function({String? id}) deleteArticleCallback;
  final void Function(Article article) viewArticleCallback;

  ArticlesLoaded({
    required this.articles,
    required this.addArticleCallback,
    required this.deleteArticleCallback,
    required this.viewArticleCallback,
  });
}

final class ArticlesEdit extends ArticlesState {}

final class ArticlesDetail extends ArticlesState {
  final Article article;
  final void Function() close;

  ArticlesDetail({required this.article, required this.close});
}

final class ArticlesEditArticle extends ArticlesState {}

final class ArticlesAddArticle extends ArticlesState {
  final void Function(Map<String, dynamic>) saveArticleCallback;
  final void Function() close;

  ArticlesAddArticle({
    required this.saveArticleCallback,
    required this.close,
  });
}
