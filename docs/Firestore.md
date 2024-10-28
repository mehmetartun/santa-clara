# Firestore data entry and retrieval

Elements of the CRUD operation for the Firestore database are shown in the **Articles** page.

## Simple model

The simple `Article` model in [article.dart](/lib/models/article.dart) has a few parameters. Here we access the `articles` collection in the Firestore database and store the `article` data there.

## Cubit

The `ArticlesCubit` which gets created with the `ArticlesPage` initializes to fetch all the articles from the database. Then creates a `List<Article>` and changes the state to be able to display these. There is a mechanism to add new articles and delete articles. The **update** has not been implemented yet.

![Articles Operations](/docs/images/Articles.gif)