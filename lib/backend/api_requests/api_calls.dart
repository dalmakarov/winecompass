import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetAllDataCall {
  static Future<ApiCallResponse> call() async {
    const ffApiRequestBody = '''
{
  "query": "query GetAllData { tags(isMain: true) { edges { node { id name isMain widgetType tabType articles { edges { node { id title slug coverThumbnail { medium } } } } wines { edges { node { id name slug } } } } } } }"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetAllData',
      apiUrl: 'https://kultovo.ru/api/graphql#',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? banner(dynamic response) => getJsonField(
        response,
        r'''$.data.tags.edges[?(@.node.widgetType=='BANNER')].node.articles.edges''',
        true,
      ) as List?;
  static List? ratings(dynamic response) => getJsonField(
        response,
        r'''$.data.tags.edges[?(@.node.name=='Рейтинги')].node.articles.edges''',
        true,
      ) as List?;
  static List? expertArticles(dynamic response) => getJsonField(
        response,
        r'''$.data.tags.edges[?(@.node.name=='Статьи экспертов')].node.articles.edges''',
        true,
      ) as List?;
  static List? russiaWinemaking(dynamic response) => getJsonField(
        response,
        r'''$.data.tags.edges[?(@.node.name=='Виноделие России')].node.articles.edges''',
        true,
      ) as List?;
}

class GetWineDetailsVariableCall {
  static Future<ApiCallResponse> call({
    String? slug = '100-ottenkov-krasnogo-saperavi',
  }) async {
    final ffApiRequestBody = '''
{
  "query": "query GetWineBySlug(\$slug: String!) {\\n  wines(slug: \$slug) {\\n    edges {\\n      node {\\n        id\\n        name\\n        slug\\n        wineType {\\n          name\\n        }\\n        wineGrapes {\\n          grape {\\n            variety\\n            slug\\n          }\\n        }\\n        winery {\\n          name\\n        }\\n        brand {\\n          name\\n        }\\n        country {\\n          name\\n        }\\n        appellation {\\n          name\\n        }\\n        vintages {\\n          edges {\\n            node {\\n              year\\n              abvMax\\n              description\\n              gastronomy\\n              images {\\n                image\\n              }\\n              vintageRatings {\\n                id\\n                score\\n                criticReview\\n                rating {\\n                  label\\n                  expert {\\n                    firstName\\n                    lastName\\n                    website {\\n                      url\\n                    }\\n                  }\\n                }\\n              }\\n            }\\n          }\\n        }\\n        overallRating {\\n          rating\\n          count\\n        }\\n      }\\n    }\\n  }\\n}",
  "variables": {
    "slug": "${escapeStringForJson(slug)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetWineDetailsVariable',
      apiUrl: 'https://kultovo.ru/api/graphql#',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.wines.edges[:].node.vintages.edges[:].node.images[:].image''',
      ));
  static List? wineYear(dynamic response) => getJsonField(
        response,
        r'''$.data.wines.edges[*].node.vintages.edges[*]''',
        true,
      ) as List?;
  static List<int>? wineYearChosen(dynamic response) => (getJsonField(
        response,
        r'''$.data.wines.edges[*].node.vintages.edges[*].node.year''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class WinesCall {
  static Future<ApiCallResponse> call() async {
    const ffApiRequestBody = '''
{
  "query": "query GetWeeklyWines { tags(name: \\"Вина недели\\") { edges { node { name wines { edges { node { slug name color { name } winery { name } vintages { edges { node { year images { id title image isPrimary } description } } } } } } } } } }"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Wines',
      apiUrl: 'https://kultovo.ru/api/graphql#',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? nodes(dynamic response) => getJsonField(
        response,
        r'''$.data.tags.edges[?(@.node.name == "Вина недели")].node.wines.edges[:]''',
        true,
      ) as List?;
}

class HighRatingWinesCall {
  static Future<ApiCallResponse> call() async {
    const ffApiRequestBody = '''
{
  "query": "query GetHighRatedWines { tags(name: \\"Вина с высоким рейтингом\\") { edges { node { name wines { edges { node { slug name color { name } winery { name } vintages { edges { node { year images { id title image isPrimary } description } } } } } } } } } }"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'HighRatingWines',
      apiUrl: 'https://kultovo.ru/api/graphql#',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? nodes(dynamic response) => getJsonField(
        response,
        r'''$.data.tags.edges[?(@.node.name == "Вина с высоким рейтингом")].node.wines.edges[*]''',
        true,
      ) as List?;
}

class ExpertsCall {
  static Future<ApiCallResponse> call({
    String? slug = 'vlada-lesnichenko-znachitelnaya-chast-sostava-vina',
  }) async {
    final ffApiRequestBody = '''
{
  "query": "query GetArticlesBySlug(\$slug: String = \\"slug\\") { articles(slug: \$slug) { edges { node { updatedAt title slug expert { avatar avatarThumbnail { medium } firstName lastName } content createdAt coverThumbnail { medium } } } } }",
  "variables": {
    "slug": "${escapeStringForJson(slug)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Experts',
      apiUrl: 'https://kultovo.ru/api/graphql#',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
