// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExpertStruct extends BaseStruct {
  ExpertStruct({
    String? firstName,
    String? lastName,
    WebsiteStruct? website,
  })  : _firstName = firstName,
        _lastName = lastName,
        _website = website;

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "website" field.
  WebsiteStruct? _website;
  WebsiteStruct get website => _website ?? WebsiteStruct();
  set website(WebsiteStruct? val) => _website = val;

  void updateWebsite(Function(WebsiteStruct) updateFn) {
    updateFn(_website ??= WebsiteStruct());
  }

  bool hasWebsite() => _website != null;

  static ExpertStruct fromMap(Map<String, dynamic> data) => ExpertStruct(
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        website: data['website'] is WebsiteStruct
            ? data['website']
            : WebsiteStruct.maybeFromMap(data['website']),
      );

  static ExpertStruct? maybeFromMap(dynamic data) =>
      data is Map ? ExpertStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'firstName': _firstName,
        'lastName': _lastName,
        'website': _website?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'firstName': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'lastName': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'website': serializeParam(
          _website,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ExpertStruct fromSerializableMap(Map<String, dynamic> data) =>
      ExpertStruct(
        firstName: deserializeParam(
          data['firstName'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['lastName'],
          ParamType.String,
          false,
        ),
        website: deserializeStructParam(
          data['website'],
          ParamType.DataStruct,
          false,
          structBuilder: WebsiteStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ExpertStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ExpertStruct &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        website == other.website;
  }

  @override
  int get hashCode => const ListEquality().hash([firstName, lastName, website]);
}

ExpertStruct createExpertStruct({
  String? firstName,
  String? lastName,
  WebsiteStruct? website,
}) =>
    ExpertStruct(
      firstName: firstName,
      lastName: lastName,
      website: website ?? WebsiteStruct(),
    );
