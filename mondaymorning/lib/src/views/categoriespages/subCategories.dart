import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mondaymorning/src/providers/mockdata/mock_data.dart';
import 'package:mondaymorning/src/services/graphql/graphql_service.dart';
import 'package:mondaymorning/src/services/graphql/queries/category/getArticlesByCategories.dart';
import 'package:mondaymorning/src/services/navigation/router.gr.dart';
import 'package:mondaymorning/src/utils/dummy/articles.dart';
import 'package:mondaymorning/src/utils/routes.dart';
import 'package:mondaymorning/src/widgets/articleCarousel.dart';
import 'package:mondaymorning/src/widgets/article_tile.dart';
import 'package:mondaymorning/src/widgets/categoriesTopBar.dart';

/// SubCategories of various Categories
class SubCategories extends StatelessWidget {

  /// [PathParam] SubCategories of various Categories
  SubCategories({
    required this.category,
    required this.subCategory,
  });

  final String category;
  final String subCategory;


  /// Instance of [Post]
  final articles = DummyData.articles;

  @override
  void initState() {
    getArticles();
  }

  Future<void> getArticles() async {
    try {
      final result = await GraphQLService().query(query: QueryOptions(
        document: gql(getArticlesByCategoriesQuery.getArticlesByCategories),
        variables: {
          'categoryNumbers' : [subCategoriesRoutes[category]?[subCategory]?.idNumber],
          'limit' : 7,
          'offset': 0,
        },
      ),
      );


      final articles = result.data;

      print(articles);
      return;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subCategory),
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoriesTopBar(category: category, isCategory: false, subCategory: subCategory,),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      ArticleCarousel(featured: DummyData.articles,),

                      SizedBox(height: 20.0),

                      ElevatedButton(
                        onPressed: (){
                          getArticles();
                        },
                        child: Text(
                            "Query Data"
                        ),
                      ),

                      for (int i = 1; i < articles.length; i++)
                        ArticleTile(
                          article: articles[i],
                          onTileTap: () {
                            context.router.push(
                              FullRouteArticle(postId: 1),
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}