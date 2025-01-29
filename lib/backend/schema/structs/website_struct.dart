// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WebsiteStruct extends BaseStruct {
  WebsiteStruct({
    String? url,
  }) : _url = url;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  static WebsiteStruct fromMap(Map<String, dynamic> data) => WebsiteStruct(
        url: data['url'] as String?,
      );

  static WebsiteStruct? maybeFromMap(dynamic data) =>
      data is Map ? WebsiteStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'url': _url,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
      }.withoutNulls;

  static WebsiteStruct fromSerializableMap(Map<String, dynamic> data) =>
      WebsiteStruct(
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WebsiteStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WebsiteStruct && url == other.url;
  }

  @override
  int get hashCode => const ListEquality().hash([url]);
}

WebsiteStruct createWebsiteStruct({
  String? url,
}) =>
    WebsiteStruct(
      url: url,
    );
