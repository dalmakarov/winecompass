import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_widget.dart' show SearchWidget;
import 'package:flutter/material.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
  ///  Local state fields for this page.

  String incentiveValue = 'вино';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (IncentiveSearch)] action in Search widget.
  ApiCallResponse? apiResultIncentive;
  // State field(s) for SearchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (WineSearch)] action in SearchField widget.
  ApiCallResponse? apiResultWineSearch;
  // Stores action output result for [Backend Call - API (ArticleSearch)] action in SearchField widget.
  ApiCallResponse? apiResultArticleSearch;
  // Stores action output result for [Backend Call - API (WinerySearch)] action in SearchField widget.
  ApiCallResponse? apiResultWinerySearch;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();
    searchFieldTextController?.dispose();
  }
}
