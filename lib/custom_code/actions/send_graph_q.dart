// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

Future<dynamic> sendGraphQ(FFUploadedFile? imageFile) async {
  // 1. Проверяем, что файл передан.
  if (imageFile == null || imageFile.bytes == null) {
    return {'error': 'No file data provided.'};
  }

  // 2. Указываем адрес GraphQL-сервера (без #).
  final uri = Uri.parse("https://kultovo.ru/api/graphql");

  // 3. Формируем поле "operations".
  // Обратите внимание на сам текст запроса:
  final operations = jsonEncode({
    "query": """
      mutation VintageSearch(\$input: VintageSearchMutationInput!) {
        vintageSearch(input: \$input) {
          full {  ## Заменили vintage на full
            id
            name
            slug
            winery {
              name
            }
            images {
              image
              imageThumbnail {
                low
              }
            }
          }
          partial {  ## Частичные совпадения, если есть
            id
            name
            slug
            winery {
              name
            }
          }
        }
      }
    """,
    // В переменных "input" поле "image" = null, туда вставим файл через map.
    "variables": {
      "input": {"image": null}
    },
    "operationName": "VintageSearch"
  });

  // 4. Формируем поле "map".
  // Указываем, что файл под ключом "0" → "variables.input.image".
  final mapField = jsonEncode({
    "0": ["variables.input.image"]
  });

  // 5. Создаём MultipartRequest.
  final request = http.MultipartRequest("POST", uri);

  // Добавляем operations и map в обычные поля формы.
  request.fields["operations"] = operations;
  request.fields["map"] = mapField;

  // 6. Добавляем файл (ключ "0").
  final fileName = imageFile.name ?? 'uploaded_file.jpg';
  // MIME-тип (contentType) — для примера image/jpeg.
  final mediaType = MediaType("image", "jpeg");

  final filePart = http.MultipartFile.fromBytes(
    "0", // ключ совпадает с "0" из map
    imageFile.bytes!,
    filename: fileName,
    contentType: mediaType,
  );
  request.files.add(filePart);

  // 7. Отправляем запрос и обрабатываем ответ.
  try {
    final streamedResponse = await request.send();
    final responseBody = await streamedResponse.stream.bytesToString();

    if (streamedResponse.statusCode == 200) {
      // Успешный ответ: парсим JSON и возвращаем
      final data = jsonDecode(responseBody);
      return data;
    } else {
      // Ошибка сервера
      return {
        'error': 'Server returned status ${streamedResponse.statusCode}',
        'body': responseBody,
      };
    }
  } catch (e) {
    // Ошибка сети или парсинга
    return {
      'error': e.toString(),
    };
  }
}
