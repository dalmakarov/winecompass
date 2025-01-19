import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'test_model.dart';
export 'test_model.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> with TickerProviderStateMixin {
  late TestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            children: [
              Expanded(
                child: TabBarView(
                  controller: _model.tabBarController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const Alignment(0.0, 0),
                child: FlutterFlowButtonTabBar(
                  useToggleButtonStyle: true,
                  labelStyle: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleMediumFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleMediumFamily),
                      ),
                  unselectedLabelStyle: const TextStyle(),
                  backgroundColor: const Color(0xFFF5F5FA),
                  borderWidth: 0.0,
                  borderRadius: 32.0,
                  elevation: 1.0,
                  buttonMargin:
                      const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  padding: const EdgeInsets.all(34.0),
                  tabs: [
                    Opacity(
                      opacity: _model.tabBarCurrentIndex == 1 ? 1.0 : 0.4,
                      child: const Tab(
                        icon: Icon(
                          Icons.home_rounded,
                          color: Color(0xFF143161),
                          size: 32.0,
                        ),
                        iconMargin:
                            EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                      ),
                    ),
                    Opacity(
                      opacity: _model.tabBarCurrentIndex == 2 ? 1.0 : 0.4,
                      child: const Tab(
                        icon: Icon(
                          Icons.apps_rounded,
                          color: Color(0xFF143161),
                          size: 32.0,
                        ),
                        iconMargin:
                            EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                      ),
                    ),
                    Opacity(
                      opacity: _model.tabBarCurrentIndex == 3 ? 1.0 : 0.4,
                      child: const Tab(
                        icon: Icon(
                          Icons.camera_enhance,
                          color: Color(0xFF143161),
                          size: 50.0,
                        ),
                        iconMargin:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      ),
                    ),
                    Opacity(
                      opacity: _model.tabBarCurrentIndex == 4 ? 1.0 : 0.4,
                      child: const Tab(
                        icon: Icon(
                          Icons.star_rounded,
                          color: Color(0xFF143161),
                          size: 32.0,
                        ),
                        iconMargin:
                            EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                      ),
                    ),
                    Opacity(
                      opacity: _model.tabBarCurrentIndex == 5 ? 1.0 : 0.4,
                      child: const Tab(
                        icon: Icon(
                          Icons.person,
                          color: Color(0xFF143161),
                          size: 32.0,
                        ),
                        iconMargin:
                            EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
                      ),
                    ),
                  ],
                  controller: _model.tabBarController,
                  onTap: (i) async {
                    [
                      () async {},
                      () async {},
                      () async {},
                      () async {},
                      () async {}
                    ][i]();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
