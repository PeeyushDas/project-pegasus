
class getLastestIssueQuery{
  static const coverMedia = '''
    coverMedia {
        square {
          store
          storePath
          mediaType
          blurhash
        }
        rectangle {
          store
          storePath
          mediaType
          blurhash
        }
      }
  ''';

  static const basicArticleData = '''
    id
      articleType
      title
      inshort
      readTime
      authors {
        name
        details
      }
      categories {
        number
        isSubcategory
      }
      $coverMedia
  ''';


  static const getLastestIssue = '''
    query getLatestIssues(\$limit: Int!, \$onlyPublished: Boolean!) {
  getLatestIssues(limit: \$limit, onlyPublished: \$onlyPublished) {
    id
    featured {
      $basicArticleData
    }
    articles {
      $basicArticleData
    }
  }
}
''';
}