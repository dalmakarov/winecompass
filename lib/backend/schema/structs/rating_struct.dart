// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RatingStruct extends BaseStruct {
  RatingStruct({
    String? label,
    ExpertStruct? expert,
  })  : _label = label,
        _expert = expert;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  // "expert" field.
  ExpertStruct? _expert;
  ExpertStruct get expert => _expert ?? ExpertStruct();
  set expert(ExpertStruct? val) => _expert = val;

  void updateExpert(Function(ExpertStruct) updateFn) {
    updateFn(_expert ??= ExpertStruct());
  }

  bool hasExpert() => _expert != null;

  static RatingStruct fromMap(Map<String, dynamic> data) => RatingStruct(
        label: data['label'] as String?,
        expert: data['expert'] is ExpertStruct
            ? data['expert']
            : ExpertStruct.maybeFromMap(data['expert']),
      );

  static RatingStruct? maybeFromMap(dynamic data) =>
      data is Map ? RatingStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'label': _label,
        'expert': _expert?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'expert': serializeParam(
          _expert,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static RatingStruct fromSerializableMap(Map<String, dynamic> data) =>
      RatingStruct(
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        expert: deserializeStructParam(
          data['expert'],
          ParamType.DataStruct,
          false,
          structBuilder: ExpertStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'RatingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RatingStruct &&
        label == other.label &&
        expert == other.expert;
  }

  @override
  int get hashCode => const ListEquality().hash([label, expert]);
}

RatingStruct createRatingStruct({
  String? label,
  ExpertStruct? expert,
}) =>
    RatingStruct(
      label: label,
      expert: expert ?? ExpertStruct(),
    );
