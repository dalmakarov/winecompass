import '/flutter_flow/flutter_flow_util.dart';
import 'wine_screen_widget.dart' show WineScreenWidget;
import 'package:flutter/material.dart';

class WineScreenModel extends FlutterFlowModel<WineScreenWidget> {
  ///  Local state fields for this page.

  int? currentYear;

  List<double> rating = [];
  void addToRating(double item) => rating.add(item);
  void removeFromRating(double item) => rating.remove(item);
  void removeAtIndexFromRating(int index) => rating.removeAt(index);
  void insertAtIndexInRating(int index, double item) =>
      rating.insert(index, item);
  void updateRatingAtIndex(int index, Function(double) updateFn) =>
      rating[index] = updateFn(rating[index]);

  String? gastronomy;

  List<String> image = [];
  void addToImage(String item) => image.add(item);
  void removeFromImage(String item) => image.remove(item);
  void removeAtIndexFromImage(int index) => image.removeAt(index);
  void insertAtIndexInImage(int index, String item) =>
      image.insert(index, item);
  void updateImageAtIndex(int index, Function(String) updateFn) =>
      image[index] = updateFn(image[index]);

  Color? favIcolor = const Color(0xff28303f);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
