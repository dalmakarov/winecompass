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

Future<dynamic> sendGraphQLUploadRequest(
  FFUploadedFile? imageFile,
// String? endpoint,
) async {
  // Проверяем входные параметры
  if (imageFile == null || imageFile.bytes == null) {
    return {'error': 'No file data provided.'};
  }
//  if (endpoint == null || endpoint.isEmpty) {
//    return {'error': 'No endpoint provided.'};
//  }

  // 1. Формируем поле "operations"
  // Для примера используем одну переменную $image: Upload!
  // и передаем её в vintageSearch(input: { image: $image }).
  final operations = jsonEncode({
    "query": """
      mutation VintageSearch(\$image: Upload!) {
        vintageSearch(input: { image: \$image }) {
          full {
            matchPercent
            vintage {
              id
              wine {
                slug
              }
            }
          }
          partial {
            matchPercent
            vintage {
              id
              wine {
                slug
                name
              }
              images {
                image
                renderMode
              }
              year
            }
          }
        }
      }
    """,
    "variables": {
      "image": null // Здесь сервер ожидает файл
    },
    "operationName": "VintageSearch"
  });

  // 2. Формируем поле "map"
  // Говорим, что файл с ключом "0" будет вставлен в "variables.image"
  final mapField = jsonEncode({
    "0": ["variables.image"]
  });

  // 3. Создаём multipart-запрос
  final uri = Uri.parse('https://kultovo.ru/api/graphql');
  final request = http.MultipartRequest("POST", uri);

  // Добавляем operations и map как простые поля формы
  request.fields["operations"] = operations;
  request.fields["map"] = mapField;

  // 4. Добавляем файл (ключ "0")
  // Возьмём имя файла из imageFile.name (если есть), иначе - "uploaded_file"
  final fileName = imageFile.name ?? 'uploaded_file';
  // Определим MIME-тип. Для простоты указываем image/jpeg
  final mediaType = MediaType("image", "jpeg");

  // Превращаем bytes в MultipartFile
  final filePart = http.MultipartFile.fromBytes(
    "0", // Должно совпадать с ключом в map
    imageFile.bytes!,
    filename: fileName,
    contentType: mediaType,
  );
  request.files.add(filePart);

  // 5. Отправляем запрос и обрабатываем ответ
  try {
    final streamedResponse = await request.send();
    final responseBody = await streamedResponse.stream.bytesToString();

    if (streamedResponse.statusCode == 200) {
      // Успешный ответ: возвращаем распарсенный JSON
      return jsonDecode(responseBody);
    } else {
      // Сервер вернул ошибку
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
