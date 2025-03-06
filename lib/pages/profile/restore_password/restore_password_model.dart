import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'restore_password_widget.dart' show RestorePasswordWidget;
import 'package:flutter/material.dart';

class RestorePasswordModel extends FlutterFlowModel<RestorePasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
