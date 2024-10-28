import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:santa_clara/models/article.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit() : super(ArticlesInitial());

  List<Article> articles = [];

  void init() async {
    await refreshArticles();
    emit(
      ArticlesLoaded(
        articles: articles,
        addArticleCallback: addArticle,
        deleteArticleCallback: deleteArticle,
        viewArticleCallback: viewArticle,
      ),
    );
  }

  Future<void> refreshArticles() async {
    articles = [];
    var qs = await FirebaseFirestore.instance.collection('articles').get();

    for (var doc in qs.docs) {
      articles.add(Article.fromMap({...doc.data(), 'id': doc.id}));
    }
  }

  void addArticle() async {
    emit(ArticlesAddArticle(
        saveArticleCallback: saveArticle, close: closeDetail));
  }

  void saveArticle(Map<String, dynamic> data) async {
    emit(ArticlesInitial());
    await FirebaseFirestore.instance.collection('articles').add(data);
    await refreshArticles();
    emit(ArticlesLoaded(
      articles: articles,
      addArticleCallback: addArticle,
      deleteArticleCallback: deleteArticle,
      viewArticleCallback: viewArticle,
    ));
  }

  void closeDetail() {
    emit(ArticlesLoaded(
      articles: articles,
      addArticleCallback: addArticle,
      deleteArticleCallback: deleteArticle,
      viewArticleCallback: viewArticle,
    ));
  }

  void viewArticle(Article article) {
    emit(ArticlesDetail(article: article, close: closeDetail));
  }

  void deleteArticle({String? id}) async {
    emit(ArticlesInitial());
    if (id != null) {
      await FirebaseFirestore.instance.collection('articles').doc(id).delete();
    }
    await refreshArticles();
    emit(ArticlesLoaded(
      articles: articles,
      addArticleCallback: addArticle,
      deleteArticleCallback: deleteArticle,
      viewArticleCallback: viewArticle,
    ));
  }
}
