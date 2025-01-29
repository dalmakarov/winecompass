// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class YearWineStruct extends BaseStruct {
  YearWineStruct({
    int? year,
    int? abvMax,
    String? description,
    String? gastronomy,
    List<ImagesStruct>? images,
    List<VintageRatingsStruct>? vintageRatings,
  })  : _year = year,
        _abvMax = abvMax,
        _description = description,
        _gastronomy = gastronomy,
        _images = images,
        _vintageRatings = vintageRatings;

  // "year" field.
  int? _year;
  int get year => _year ?? 0;
  set year(int? val) => _year = val;

  void incrementYear(int amount) => year = year + amount;

  bool hasYear() => _year != null;

  // "abvMax" field.
  int? _abvMax;
  int get abvMax => _abvMax ?? 0;
  set abvMax(int? val) => _abvMax = val;

  void incrementAbvMax(int amount) => abvMax = abvMax + amount;

  bool hasAbvMax() => _abvMax != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "gastronomy" field.
  String? _gastronomy;
  String get gastronomy => _gastronomy ?? '';
  set gastronomy(String? val) => _gastronomy = val;

  bool hasGastronomy() => _gastronomy != null;

  // "images" field.
  List<ImagesStruct>? _images;
  List<ImagesStruct> get images => _images ?? const [];
  set images(List<ImagesStruct>? val) => _images = val;

  void updateImages(Function(List<ImagesStruct>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  // "vintageRatings" field.
  List<VintageRatingsStruct>? _vintageRatings;
  List<VintageRatingsStruct> get vintageRatings => _vintageRatings ?? const [];
  set vintageRatings(List<VintageRatingsStruct>? val) => _vintageRatings = val;

  void updateVintageRatings(Function(List<VintageRatingsStruct>) updateFn) {
    updateFn(_vintageRatings ??= []);
  }

  bool hasVintageRatings() => _vintageRatings != null;

  static YearWineStruct fromMap(Map<String, dynamic> data) => YearWineStruct(
        year: castToType<int>(data['year']),
        abvMax: castToType<int>(data['abvMax']),
        description: data['description'] as String?,
        gastronomy: data['gastronomy'] as String?,
        images: getStructList(
          data['images'],
          ImagesStruct.fromMap,
        ),
        vintageRatings: getStructList(
          data['vintageRatings'],
          VintageRatingsStruct.fromMap,
        ),
      );

  static YearWineStruct? maybeFromMap(dynamic data) =>
      data is Map ? YearWineStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'year': _year,
        'abvMax': _abvMax,
        'description': _description,
        'gastronomy': _gastronomy,
        'images': _images?.map((e) => e.toMap()).toList(),
        'vintageRatings': _vintageRatings?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'year': serializeParam(
          _year,
          ParamType.int,
        ),
        'abvMax': serializeParam(
          _abvMax,
          ParamType.int,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'gastronomy': serializeParam(
          _gastronomy,
          ParamType.String,
        ),
        'images': serializeParam(
          _images,
          ParamType.DataStruct,
          isList: true,
        ),
        'vintageRatings': serializeParam(
          _vintageRatings,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static YearWineStruct fromSerializableMap(Map<String, dynamic> data) =>
      YearWineStruct(
        year: deserializeParam(
          data['year'],
          ParamType.int,
          false,
        ),
        abvMax: deserializeParam(
          data['abvMax'],
          ParamType.int,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        gastronomy: deserializeParam(
          data['gastronomy'],
          ParamType.String,
          false,
        ),
        images: deserializeStructParam<ImagesStruct>(
          data['images'],
          ParamType.DataStruct,
          true,
          structBuilder: ImagesStruct.fromSerializableMap,
        ),
        vintageRatings: deserializeStructParam<VintageRatingsStruct>(
          data['vintageRatings'],
          ParamType.DataStruct,
          true,
          structBuilder: VintageRatingsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'YearWineStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is YearWineStruct &&
        year == other.year &&
        abvMax == other.abvMax &&
        description == other.description &&
        gastronomy == other.gastronomy &&
        listEquality.equals(images, other.images) &&
        listEquality.equals(vintageRatings, other.vintageRatings);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([year, abvMax, description, gastronomy, images, vintageRatings]);
}

YearWineStruct createYearWineStruct({
  int? year,
  int? abvMax,
  String? description,
  String? gastronomy,
}) =>
    YearWineStruct(
      year: year,
      abvMax: abvMax,
      description: description,
      gastronomy: gastronomy,
    );
