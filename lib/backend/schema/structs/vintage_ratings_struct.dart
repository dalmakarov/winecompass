// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VintageRatingsStruct extends BaseStruct {
  VintageRatingsStruct({
    String? id,
    double? score,
    String? criticReview,
    RatingStruct? rating,
  })  : _id = id,
        _score = score,
        _criticReview = criticReview,
        _rating = rating;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "score" field.
  double? _score;
  double get score => _score ?? 0.0;
  set score(double? val) => _score = val;

  void incrementScore(double amount) => score = score + amount;

  bool hasScore() => _score != null;

  // "criticReview" field.
  String? _criticReview;
  String get criticReview => _criticReview ?? '';
  set criticReview(String? val) => _criticReview = val;

  bool hasCriticReview() => _criticReview != null;

  // "rating" field.
  RatingStruct? _rating;
  RatingStruct get rating => _rating ?? RatingStruct();
  set rating(RatingStruct? val) => _rating = val;

  void updateRating(Function(RatingStruct) updateFn) {
    updateFn(_rating ??= RatingStruct());
  }

  bool hasRating() => _rating != null;

  static VintageRatingsStruct fromMap(Map<String, dynamic> data) =>
      VintageRatingsStruct(
        id: data['id'] as String?,
        score: castToType<double>(data['score']),
        criticReview: data['criticReview'] as String?,
        rating: data['rating'] is RatingStruct
            ? data['rating']
            : RatingStruct.maybeFromMap(data['rating']),
      );

  static VintageRatingsStruct? maybeFromMap(dynamic data) => data is Map
      ? VintageRatingsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'score': _score,
        'criticReview': _criticReview,
        'rating': _rating?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'score': serializeParam(
          _score,
          ParamType.double,
        ),
        'criticReview': serializeParam(
          _criticReview,
          ParamType.String,
        ),
        'rating': serializeParam(
          _rating,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static VintageRatingsStruct fromSerializableMap(Map<String, dynamic> data) =>
      VintageRatingsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        score: deserializeParam(
          data['score'],
          ParamType.double,
          false,
        ),
        criticReview: deserializeParam(
          data['criticReview'],
          ParamType.String,
          false,
        ),
        rating: deserializeStructParam(
          data['rating'],
          ParamType.DataStruct,
          false,
          structBuilder: RatingStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'VintageRatingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VintageRatingsStruct &&
        id == other.id &&
        score == other.score &&
        criticReview == other.criticReview &&
        rating == other.rating;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, score, criticReview, rating]);
}

VintageRatingsStruct createVintageRatingsStruct({
  String? id,
  double? score,
  String? criticReview,
  RatingStruct? rating,
}) =>
    VintageRatingsStruct(
      id: id,
      score: score,
      criticReview: criticReview,
      rating: rating ?? RatingStruct(),
    );
