import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main_page_model.dart';
export 'main_page_model.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({super.key});

  static String routeName = 'MainPage';
  static String routePath = '/mainPage';

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget>
    with TickerProviderStateMixin {
  late MainPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainPageModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: min(
          valueOrDefault<int>(
            FFAppState().ActiveTabIndex,
            0,
          ),
          4),
    )..addListener(() => safeSetState(() {}));
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.emailTextController ??=
        TextEditingController(text: FFAppState().userMail);
    _model.emailFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: GetAllDataCall.call(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).alternate,
                  ),
                ),
              ),
            ),
          );
        }
        final mainPageGetAllDataResponse = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                children: [
                  Expanded(
                    child: TabBarView(
                      controller: _model.tabBarController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        KeepAliveWidgetWrapper(
                          builder: (context) => SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  height: 261.0,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 2.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final banner = GetAllDataCall.banner(
                                              mainPageGetAllDataResponse
                                                  .jsonBody,
                                            )?.toList() ??
                                            [];

                                        return Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: Stack(
                                            children: [
                                              PageView.builder(
                                                controller: _model
                                                        .pageViewController1 ??=
                                                    PageController(
                                                        initialPage: max(
                                                            0,
                                                            min(
                                                                0,
                                                                banner.length -
                                                                    1))),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: banner.length,
                                                itemBuilder:
                                                    (context, bannerIndex) {
                                                  final bannerItem =
                                                      banner[bannerIndex];
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Flexible(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: Stack(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              24.0),
                                                                  child: Image
                                                                      .network(
                                                                    '${FFAppState().graphQLimageURL}${getJsonField(
                                                                      bannerItem,
                                                                      r'''$..medium''',
                                                                    ).toString()}',
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        1.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          24.0),
                                                                  child: Text(
                                                                    getJsonField(
                                                                      bannerItem,
                                                                      r'''$..title''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Onest Cyr',
                                                                          fontSize:
                                                                              18.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey('Onest Cyr'),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: smooth_page_indicator
                                                      .SmoothPageIndicator(
                                                    controller: _model
                                                            .pageViewController1 ??=
                                                        PageController(
                                                            initialPage: max(
                                                                0,
                                                                min(
                                                                    0,
                                                                    banner.length -
                                                                        1))),
                                                    count: banner.length,
                                                    axisDirection:
                                                        Axis.horizontal,
                                                    onDotClicked: (i) async {
                                                      await _model
                                                          .pageViewController1!
                                                          .animateToPage(
                                                        i,
                                                        duration: Duration(
                                                            milliseconds: 500),
                                                        curve: Curves.ease,
                                                      );
                                                      safeSetState(() {});
                                                    },
                                                    effect: smooth_page_indicator
                                                        .ExpandingDotsEffect(
                                                      expansionFactor: 2.5,
                                                      spacing: 5.0,
                                                      radius: 8.0,
                                                      dotWidth: 8.0,
                                                      dotHeight: 8.0,
                                                      dotColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      activeDotColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      paintStyle:
                                                          PaintingStyle.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context
                                            .pushNamed(SearchWidget.routeName);
                                      },
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 10.0, 0.0, 0.0),
                                            child: Icon(
                                              FFIcons.kloupe2,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 22.0,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    42.0, 0.0, 12.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 42.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF5F5FA),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(16.0),
                                                  bottomRight:
                                                      Radius.circular(16.0),
                                                  topLeft:
                                                      Radius.circular(15.0),
                                                  topRight:
                                                      Radius.circular(16.0),
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Поиск',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color:
                                                              Color(0xFFAFB0B4),
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Material(
                                  color: Colors.transparent,
                                  child: ListTile(
                                    title: Text(
                                      getJsonField(
                                        mainPageGetAllDataResponse.jsonBody,
                                        r'''$.data.tags.edges[1].node.name''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Onest Cyr',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Onest Cyr'),
                                          ),
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    dense: false,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                FutureBuilder<ApiCallResponse>(
                                  future: WinesCall.call(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final winesWeekWinesResponse =
                                        snapshot.data!;

                                    return Container(
                                      width: double.infinity,
                                      height: 220.0,
                                      decoration: BoxDecoration(),
                                      child: Stack(
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              final winesList = WinesCall.nodes(
                                                    winesWeekWinesResponse
                                                        .jsonBody,
                                                  )?.toList() ??
                                                  [];

                                              return ListView.separated(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 3.0),
                                                primary: false,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: winesList.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(width: 3.0),
                                                itemBuilder:
                                                    (context, winesListIndex) {
                                                  final winesListItem =
                                                      winesList[winesListIndex];
                                                  return Container(
                                                    width: 172.0,
                                                    height: 200.0,
                                                    child: Stack(
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              WineWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'slug':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    winesListItem,
                                                                    r'''$..node.slug''',
                                                                  ).toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );

                                                            FFAppState()
                                                                    .WineGastronomy =
                                                                getJsonField(
                                                              winesListItem,
                                                              r'''$.node.vintages.edges[0].node.gastronomy''',
                                                            ).toString();
                                                            FFAppState()
                                                                    .WinesYear =
                                                                getJsonField(
                                                              winesListItem,
                                                              r'''$.node.vintages.edges[:].node.year''',
                                                              true,
                                                            )!
                                                                    .toList()
                                                                    .cast<
                                                                        int>();
                                                            FFAppState()
                                                                    .WinesRate =
                                                                getJsonField(
                                                              winesListItem,
                                                              r'''$.node.vintages.edges[0].node.vintageRatings[:].score''',
                                                              true,
                                                            )!
                                                                    .toList()
                                                                    .cast<
                                                                        double>();
                                                            FFAppState()
                                                                    .WinesImage =
                                                                (getJsonField(
                                                              winesListItem,
                                                              r'''$.node.vintages.edges[0].node.vintageRatings[:].rating.labelThumbnail.medium''',
                                                              true,
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFF5F5FA),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        28.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        28.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        28.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        28.0),
                                                              ),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 160.0,
                                                                  height: 156.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    gradient:
                                                                        LinearGradient(
                                                                      colors: [
                                                                        Color(
                                                                            0xFFFCFCFE),
                                                                        Color(
                                                                            0xFFE9EBEE)
                                                                      ],
                                                                      stops: [
                                                                        0.0,
                                                                        1.0
                                                                      ],
                                                                      begin: AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                      end: AlignmentDirectional(
                                                                          0,
                                                                          1.0),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              28.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              28.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              28.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              28.0),
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          6.0,
                                                                          13.0,
                                                                          6.0,
                                                                          13.0),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child:
                                                                            CachedNetworkImage(
                                                                          fadeInDuration:
                                                                              Duration(milliseconds: 500),
                                                                          fadeOutDuration:
                                                                              Duration(milliseconds: 500),
                                                                          imageUrl:
                                                                              '${FFAppState().graphQLimageURL}${getJsonField(
                                                                            winesListItem,
                                                                            r'''$.node.vintages.edges[0].node.images[0].image''',
                                                                          ).toString()}',
                                                                          width:
                                                                              48.0,
                                                                          height:
                                                                              125.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      170.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Text(
                                                            getJsonField(
                                                              winesListItem,
                                                              r'''$.node.name''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Onest Cyr',
                                                                  color: Color(
                                                                      0xFF070707),
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          'Onest Cyr'),
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                Material(
                                  color: Colors.transparent,
                                  child: ListTile(
                                    title: Text(
                                      getJsonField(
                                        mainPageGetAllDataResponse.jsonBody,
                                        r'''$.data.tags.edges[2].node.name''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Onest Cyr',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Onest Cyr'),
                                          ),
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    dense: false,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 72.0,
                                  decoration: BoxDecoration(),
                                  child: Stack(
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          final ratingsMain =
                                              GetAllDataCall.ratings(
                                                    mainPageGetAllDataResponse
                                                        .jsonBody,
                                                  )?.toList() ??
                                                  [];

                                          return ListView.separated(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 3.0),
                                            primary: false,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: ratingsMain.length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(width: 3.0),
                                            itemBuilder:
                                                (context, ratingsMainIndex) {
                                              final ratingsMainItem =
                                                  ratingsMain[ratingsMainIndex];
                                              return Container(
                                                width: 98.0,
                                                height: 72.0,
                                                child: Stack(
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          ArticlesWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'slug':
                                                                serializeParam(
                                                              getJsonField(
                                                                ratingsMainItem,
                                                                r'''$..node.slug''',
                                                              ).toString(),
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFF5F5FA),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    20.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    20.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    20.0),
                                                          ),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        13.0,
                                                                        13.0,
                                                                        13.0,
                                                                        13.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                '${FFAppState().graphQLimageURL}${getJsonField(
                                                                  ratingsMainItem,
                                                                  r'''$..medium''',
                                                                ).toString()}',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  child: ListTile(
                                    title: Text(
                                      getJsonField(
                                        mainPageGetAllDataResponse.jsonBody,
                                        r'''$.data.tags.edges[3].node.name''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Onest Cyr',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Onest Cyr'),
                                          ),
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    dense: false,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 222.0,
                                  decoration: BoxDecoration(),
                                  child: Stack(
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          final expertArcticles =
                                              GetAllDataCall.expertArticles(
                                                    mainPageGetAllDataResponse
                                                        .jsonBody,
                                                  )?.toList() ??
                                                  [];

                                          return ListView.separated(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 3.0),
                                            primary: false,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: expertArcticles.length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(width: 3.0),
                                            itemBuilder: (context,
                                                expertArcticlesIndex) {
                                              final expertArcticlesItem =
                                                  expertArcticles[
                                                      expertArcticlesIndex];
                                              return Container(
                                                width: 318.0,
                                                child: Stack(
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          ArticlesWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'slug':
                                                                serializeParam(
                                                              getJsonField(
                                                                expertArcticlesItem,
                                                                r'''$..node.slug''',
                                                              ).toString(),
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFF5F5FA),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    28.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    28.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    28.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    28.0),
                                                          ),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 306.0,
                                                              height: 156.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: [
                                                                    Color(
                                                                        0xFFFCFCFE),
                                                                    Color(
                                                                        0xFFE9EBEE)
                                                                  ],
                                                                  stops: [
                                                                    0.0,
                                                                    1.0
                                                                  ],
                                                                  begin:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                  end:
                                                                      AlignmentDirectional(
                                                                          0,
                                                                          1.0),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          28.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          28.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          28.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          28.0),
                                                                ),
                                                              ),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image
                                                                    .network(
                                                                  '${FFAppState().graphQLimageURL}${getJsonField(
                                                                    expertArcticlesItem,
                                                                    r'''$..medium''',
                                                                  ).toString()}',
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  182.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Text(
                                                        getJsonField(
                                                          expertArcticlesItem,
                                                          r'''$..node.title''',
                                                        ).toString(),
                                                        maxLines: 2,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Onest Cyr',
                                                              color: Color(
                                                                  0xFF070707),
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              useGoogleFonts: GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      'Onest Cyr'),
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  child: ListTile(
                                    title: Text(
                                      getJsonField(
                                        mainPageGetAllDataResponse.jsonBody,
                                        r'''$.data.tags.edges[4].node.name''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Onest Cyr',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Onest Cyr'),
                                          ),
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    dense: false,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                FutureBuilder<ApiCallResponse>(
                                  future: WHighRatingWineCall.call(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final highRatingWinesWHighRatingWineResponse =
                                        snapshot.data!;

                                    return Container(
                                      width: double.infinity,
                                      height: 220.0,
                                      decoration: BoxDecoration(),
                                      child: Stack(
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              final whighRatingWines =
                                                  WHighRatingWineCall.nodes(
                                                        highRatingWinesWHighRatingWineResponse
                                                            .jsonBody,
                                                      )?.toList() ??
                                                      [];

                                              return ListView.separated(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 3.0),
                                                primary: false,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    whighRatingWines.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(width: 3.0),
                                                itemBuilder: (context,
                                                    whighRatingWinesIndex) {
                                                  final whighRatingWinesItem =
                                                      whighRatingWines[
                                                          whighRatingWinesIndex];
                                                  return Container(
                                                    width: 172.0,
                                                    height: 200.0,
                                                    child: Stack(
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              WineWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'slug':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    whighRatingWinesItem,
                                                                    r'''$.slug''',
                                                                  ).toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );

                                                            FFAppState()
                                                                    .WineGastronomy =
                                                                getJsonField(
                                                              whighRatingWinesItem,
                                                              r'''$.vintages.edges[0].node.gastronomy''',
                                                            ).toString();
                                                            FFAppState()
                                                                    .WinesYear =
                                                                getJsonField(
                                                              whighRatingWinesItem,
                                                              r'''$.vintages.edges[:].node.year''',
                                                              true,
                                                            )!
                                                                    .toList()
                                                                    .cast<
                                                                        int>();
                                                            FFAppState()
                                                                    .WinesRate =
                                                                getJsonField(
                                                              whighRatingWinesItem,
                                                              r'''$.vintages.edges[:].node.vintageRatings[0].score''',
                                                              true,
                                                            )!
                                                                    .toList()
                                                                    .cast<
                                                                        double>();
                                                            FFAppState()
                                                                    .WinesImage =
                                                                (getJsonField(
                                                              whighRatingWinesItem,
                                                              r'''$.vintages.edges[:].node.vintageRatings[0].rating.label''',
                                                              true,
                                                            ) as List)
                                                                    .map<String>(
                                                                        (s) => s
                                                                            .toString())
                                                                    .toList()
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFF5F5FA),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        28.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        28.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        28.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        28.0),
                                                              ),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 160.0,
                                                                  height: 156.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    gradient:
                                                                        LinearGradient(
                                                                      colors: [
                                                                        Color(
                                                                            0xFFFCFCFE),
                                                                        Color(
                                                                            0xFFE9EBEE)
                                                                      ],
                                                                      stops: [
                                                                        0.0,
                                                                        1.0
                                                                      ],
                                                                      begin: AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                      end: AlignmentDirectional(
                                                                          0,
                                                                          1.0),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              28.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              28.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              28.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              28.0),
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          6.0,
                                                                          13.0,
                                                                          6.0,
                                                                          13.0),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        child: Image
                                                                            .network(
                                                                          '${FFAppState().graphQLimageURL}${getJsonField(
                                                                            whighRatingWinesItem,
                                                                            r'''$.vintages.edges[0].node.images[0].image''',
                                                                          ).toString()}',
                                                                          width:
                                                                              48.0,
                                                                          height:
                                                                              125.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 1.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        16.0),
                                                            child: Text(
                                                              getJsonField(
                                                                whighRatingWinesItem,
                                                                r'''$.name''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Onest Cyr',
                                                                    color: Color(
                                                                        0xFF070707),
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            'Onest Cyr'),
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                Material(
                                  color: Colors.transparent,
                                  child: ListTile(
                                    title: Text(
                                      getJsonField(
                                        mainPageGetAllDataResponse.jsonBody,
                                        r'''$.data.tags.edges[5].node.name''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Onest Cyr',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Onest Cyr'),
                                          ),
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    dense: false,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 131.0,
                                  decoration: BoxDecoration(),
                                  child: Stack(
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          final russiaWinemaking =
                                              GetAllDataCall.russiaWinemaking(
                                                    mainPageGetAllDataResponse
                                                        .jsonBody,
                                                  )?.toList() ??
                                                  [];

                                          return ListView.separated(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 3.0),
                                            primary: false,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: russiaWinemaking.length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(width: 3.0),
                                            itemBuilder: (context,
                                                russiaWinemakingIndex) {
                                              final russiaWinemakingItem =
                                                  russiaWinemaking[
                                                      russiaWinemakingIndex];
                                              return Container(
                                                width: 242.0,
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              ArticlesWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'slug':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    russiaWinemakingItem,
                                                                    r'''$..node.slug''',
                                                                  ).toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 242.0,
                                                            height: 131.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  Color(
                                                                      0xFFFCFCFE),
                                                                  Color(
                                                                      0xFFE9EBEE)
                                                                ],
                                                                stops: [
                                                                  0.0,
                                                                  1.0
                                                                ],
                                                                begin:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                end:
                                                                    AlignmentDirectional(
                                                                        0, 1.0),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        28.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        28.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        28.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        28.0),
                                                              ),
                                                            ),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                '${FFAppState().graphQLimageURL}${getJsonField(
                                                                  russiaWinemakingItem,
                                                                  r'''$..medium''',
                                                                ).toString()}',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  22.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Text(
                                                        getJsonField(
                                                          russiaWinemakingItem,
                                                          r'''$..node.title''',
                                                        ).toString(),
                                                        maxLines: 2,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Onest Cyr',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          'Onest Cyr'),
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ].divide(SizedBox(height: 10.0)),
                            ),
                          ),
                        ),
                        KeepAliveWidgetWrapper(
                          builder: (context) => Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 48.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 8.0, 0.0),
                                          child: Icon(
                                            FFIcons.kloupe2,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 22.0,
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: double.infinity,
                                            child: TextFormField(
                                              controller:
                                                  _model.textController1,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                hintText: 'Вино',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          color:
                                                              Color(0xFFAFB0B4),
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                filled: true,
                                                fillColor: Color(0xFFF5F5FA),
                                                hoverColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              validator: _model
                                                  .textController1Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () {
                                              print('Button pressed ...');
                                            },
                                            text: 'Отмена',
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily),
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Builder(
                                        builder: (context) {
                                          final articles = FFAppConstants
                                              .ArticlesCategories.toList();

                                          return ListView.separated(
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: articles.length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(width: 8.0),
                                            itemBuilder:
                                                (context, articlesIndex) {
                                              final articlesItem =
                                                  articles[articlesIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  FFAppState()
                                                          .activeArticleItem =
                                                      articlesItem;
                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  width: 104.0,
                                                  height: 44.0,
                                                  decoration: BoxDecoration(
                                                    color: articlesItem ==
                                                            FFAppState()
                                                                .activeArticleItem
                                                        ? Color(0xFF143161)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(14.0),
                                                      bottomRight:
                                                          Radius.circular(14.0),
                                                      topLeft:
                                                          Radius.circular(14.0),
                                                      topRight:
                                                          Radius.circular(14.0),
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      articlesItem,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Onest Cyr',
                                                            color: articlesItem ==
                                                                    FFAppState()
                                                                        .activeArticleItem
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Onest Cyr'),
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  if ((FFAppState().activeArticleItem ==
                                          'Вина') ||
                                      (FFAppState().activeArticleItem == ''))
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Material(
                                          color: Colors.transparent,
                                          child: ListTile(
                                            title: Text(
                                              'Популярные вина',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Onest Cyr',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts:
                                                            GoogleFonts.asMap()
                                                                .containsKey(
                                                                    'Onest Cyr'),
                                                      ),
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            dense: false,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 220.0,
                                          decoration: BoxDecoration(),
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final popularWines =
                                                        FFAppConstants
                                                                .PopularWines
                                                            .toList();

                                                    return ListView.separated(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 3.0),
                                                      primary: false,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount:
                                                          popularWines.length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          SizedBox(width: 3.0),
                                                      itemBuilder: (context,
                                                          popularWinesIndex) {
                                                        final popularWinesItem =
                                                            popularWines[
                                                                popularWinesIndex];
                                                        return FutureBuilder<
                                                            ApiCallResponse>(
                                                          future:
                                                              GetWineDetailsVariableCall
                                                                  .call(
                                                            slug:
                                                                popularWinesItem,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            final stackGetWineDetailsVariableResponse =
                                                                snapshot.data!;

                                                            return Container(
                                                              width: 172.0,
                                                              height: 200.0,
                                                              child: Stack(
                                                                children: [
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        WineWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'slug':
                                                                              serializeParam(
                                                                            popularWinesItem,
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );

                                                                      FFAppState()
                                                                              .WineGastronomy =
                                                                          getJsonField(
                                                                        stackGetWineDetailsVariableResponse
                                                                            .jsonBody,
                                                                        r'''$.data.wines.edges[*].node.vintages.edges[*].node.gastronomy''',
                                                                      ).toString();
                                                                      FFAppState()
                                                                          .WinesYear = getJsonField(
                                                                        stackGetWineDetailsVariableResponse
                                                                            .jsonBody,
                                                                        r'''$.data.wines.edges[*].node.vintages.edges[*].node.year''',
                                                                        true,
                                                                      )!
                                                                          .toList()
                                                                          .cast<int>();
                                                                      FFAppState()
                                                                          .WinesRate = getJsonField(
                                                                        stackGetWineDetailsVariableResponse
                                                                            .jsonBody,
                                                                        r'''$.data.wines.edges[*].node.vintages.edges[*].node.vintageRatings[*].score''',
                                                                        true,
                                                                      )!
                                                                          .toList()
                                                                          .cast<double>();
                                                                      FFAppState()
                                                                          .WinesImage = (getJsonField(
                                                                        stackGetWineDetailsVariableResponse
                                                                            .jsonBody,
                                                                        r'''$.data.wines.edges[*].node.vintages.edges[*].node.vintageRatings[*].rating.label''',
                                                                        true,
                                                                      ) as List)
                                                                          .map<String>((s) => s.toString())
                                                                          .toList()
                                                                          .toList()
                                                                          .cast<String>();
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFF5F5FA),
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(28.0),
                                                                          bottomRight:
                                                                              Radius.circular(28.0),
                                                                          topLeft:
                                                                              Radius.circular(28.0),
                                                                          topRight:
                                                                              Radius.circular(28.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                160.0,
                                                                            height:
                                                                                156.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              gradient: LinearGradient(
                                                                                colors: [
                                                                                  Color(0xFFFCFCFE),
                                                                                  Color(0xFFE9EBEE)
                                                                                ],
                                                                                stops: [
                                                                                  0.0,
                                                                                  1.0
                                                                                ],
                                                                                begin: AlignmentDirectional(0.0, -1.0),
                                                                                end: AlignmentDirectional(0, 1.0),
                                                                              ),
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(28.0),
                                                                                bottomRight: Radius.circular(28.0),
                                                                                topLeft: Radius.circular(28.0),
                                                                                topRight: Radius.circular(28.0),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, -1.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(6.0, 13.0, 6.0, 13.0),
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  child: Image.network(
                                                                                    '${FFAppState().graphQLimageURL}${getJsonField(
                                                                                      stackGetWineDetailsVariableResponse.jsonBody,
                                                                                      r'''$.data.wines.edges[:].node.vintages.edges[0].node.images[0].image''',
                                                                                    ).toString()}',
                                                                                    width: 48.0,
                                                                                    height: 125.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            170.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      getJsonField(
                                                                        stackGetWineDetailsVariableResponse
                                                                            .jsonBody,
                                                                        r'''$.data.wines.edges[:].node.name''',
                                                                      ).toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Onest Cyr',
                                                                            color:
                                                                                Color(0xFF070707),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey('Onest Cyr'),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          child: ListTile(
                                            title: Text(
                                              'Подборки',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Onest Cyr',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts:
                                                            GoogleFonts.asMap()
                                                                .containsKey(
                                                                    'Onest Cyr'),
                                                      ),
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            dense: false,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 160.0,
                                          decoration: BoxDecoration(),
                                          child: Stack(
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  final selectionArtItem =
                                                      FFAppConstants
                                                              .ArticleSelection
                                                          .toList();

                                                  return ListView.separated(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 3.0),
                                                    primary: false,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        selectionArtItem.length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(width: 3.0),
                                                    itemBuilder: (context,
                                                        selectionArtItemIndex) {
                                                      final selectionArtItemItem =
                                                          selectionArtItem[
                                                              selectionArtItemIndex];
                                                      return FutureBuilder<
                                                          ApiCallResponse>(
                                                        future:
                                                            ArticlesCall.call(
                                                          slug:
                                                              selectionArtItemItem,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final stackArticlesResponse =
                                                              snapshot.data!;

                                                          return Stack(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      ArticlesWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'slug':
                                                                            serializeParam(
                                                                          selectionArtItemItem,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        210.0,
                                                                    height:
                                                                        155.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      image:
                                                                          DecorationImage(
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        image: Image
                                                                            .network(
                                                                          '${FFAppState().graphQLimageURL}${getJsonField(
                                                                            stackArticlesResponse.jsonBody,
                                                                            r'''$.data.articles.edges[*].node.coverThumbnail.medium''',
                                                                          ).toString()}',
                                                                        ).image,
                                                                      ),
                                                                      gradient:
                                                                          LinearGradient(
                                                                        colors: [
                                                                          Color(
                                                                              0xFFFCFCFE),
                                                                          Color(
                                                                              0xFFE9EBEE)
                                                                        ],
                                                                        stops: [
                                                                          0.0,
                                                                          1.0
                                                                        ],
                                                                        begin: AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                        end: AlignmentDirectional(
                                                                            0,
                                                                            1.0),
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(28.0),
                                                                        bottomRight:
                                                                            Radius.circular(28.0),
                                                                        topLeft:
                                                                            Radius.circular(28.0),
                                                                        topRight:
                                                                            Radius.circular(28.0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        '${FFAppState().graphQLimageURL}${getJsonField(
                                                                          stackArticlesResponse
                                                                              .jsonBody,
                                                                          r'''$.data.articles.edges[*].node.coverThumbnail.medium''',
                                                                        ).toString()}',
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        22.0,
                                                                        8.0,
                                                                        0.0),
                                                                child: Text(
                                                                  getJsonField(
                                                                    stackArticlesResponse
                                                                        .jsonBody,
                                                                    r'''$.data.articles.edges[*].node.title''',
                                                                  )
                                                                      .toString()
                                                                      .maybeHandleOverflow(
                                                                        maxChars:
                                                                            32,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Onest Cyr',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey('Onest Cyr'),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          child: ListTile(
                                            title: Text(
                                              'Высокий рейтинг',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Onest Cyr',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts:
                                                            GoogleFonts.asMap()
                                                                .containsKey(
                                                                    'Onest Cyr'),
                                                      ),
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            dense: false,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 220.0,
                                          decoration: BoxDecoration(),
                                          child: Stack(
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  final highRateWines =
                                                      FFAppConstants
                                                              .HighRatingWines
                                                          .toList();

                                                  return ListView.separated(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 3.0),
                                                    primary: false,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        highRateWines.length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(width: 3.0),
                                                    itemBuilder: (context,
                                                        highRateWinesIndex) {
                                                      final highRateWinesItem =
                                                          highRateWines[
                                                              highRateWinesIndex];
                                                      return FutureBuilder<
                                                          ApiCallResponse>(
                                                        future:
                                                            GetWineDetailsVariableCall
                                                                .call(
                                                          slug:
                                                              highRateWinesItem,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final stackGetWineDetailsVariableResponse =
                                                              snapshot.data!;

                                                          return Container(
                                                            width: 172.0,
                                                            height: 200.0,
                                                            child: Stack(
                                                              children: [
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      WineWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'slug':
                                                                            serializeParam(
                                                                          highRateWinesItem,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );

                                                                    FFAppState()
                                                                            .WineGastronomy =
                                                                        getJsonField(
                                                                      stackGetWineDetailsVariableResponse
                                                                          .jsonBody,
                                                                      r'''$.data.wines.edges[*].node.vintages.edges[*].node.gastronomy''',
                                                                    ).toString();
                                                                    FFAppState()
                                                                        .WinesYear = getJsonField(
                                                                      stackGetWineDetailsVariableResponse
                                                                          .jsonBody,
                                                                      r'''$.data.wines.edges[*].node.vintages.edges[*].node.year''',
                                                                      true,
                                                                    )!
                                                                        .toList()
                                                                        .cast<int>();
                                                                    FFAppState()
                                                                        .WinesRate = getJsonField(
                                                                      stackGetWineDetailsVariableResponse
                                                                          .jsonBody,
                                                                      r'''$.data.wines.edges[*].node.vintages.edges[*].node.vintageRatings[*].score''',
                                                                      true,
                                                                    )!
                                                                        .toList()
                                                                        .cast<double>();
                                                                    FFAppState()
                                                                        .WinesImage = (getJsonField(
                                                                      stackGetWineDetailsVariableResponse
                                                                          .jsonBody,
                                                                      r'''$.data.wines.edges[*].node.vintages.edges[*].node.vintageRatings[*].rating.label''',
                                                                      true,
                                                                    ) as List)
                                                                        .map<String>((s) => s.toString())
                                                                        .toList()
                                                                        .toList()
                                                                        .cast<String>();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFF5F5FA),
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(28.0),
                                                                        bottomRight:
                                                                            Radius.circular(28.0),
                                                                        topLeft:
                                                                            Radius.circular(28.0),
                                                                        topRight:
                                                                            Radius.circular(28.0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              160.0,
                                                                          height:
                                                                              156.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            gradient:
                                                                                LinearGradient(
                                                                              colors: [
                                                                                Color(0xFFFCFCFE),
                                                                                Color(0xFFE9EBEE)
                                                                              ],
                                                                              stops: [
                                                                                0.0,
                                                                                1.0
                                                                              ],
                                                                              begin: AlignmentDirectional(0.0, -1.0),
                                                                              end: AlignmentDirectional(0, 1.0),
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(28.0),
                                                                              bottomRight: Radius.circular(28.0),
                                                                              topLeft: Radius.circular(28.0),
                                                                              topRight: Radius.circular(28.0),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(6.0, 13.0, 6.0, 13.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.network(
                                                                                  '${FFAppState().graphQLimageURL}${getJsonField(
                                                                                    stackGetWineDetailsVariableResponse.jsonBody,
                                                                                    r'''$.data.wines.edges[:].node.vintages.edges[0].node.images[0].image''',
                                                                                  ).toString()}',
                                                                                  width: 48.0,
                                                                                  height: 125.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          170.0,
                                                                          8.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    getJsonField(
                                                                      stackGetWineDetailsVariableResponse
                                                                          .jsonBody,
                                                                      r'''$.data.wines.edges[:].node.name''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Onest Cyr',
                                                                          color:
                                                                              Color(0xFF070707),
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey('Onest Cyr'),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          child: ListTile(
                                            title: Text(
                                              'Для начинающих',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Onest Cyr',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts:
                                                            GoogleFonts.asMap()
                                                                .containsKey(
                                                                    'Onest Cyr'),
                                                      ),
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            dense: false,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) {
                                            final articlesNewbiesItems =
                                                FFAppConstants.ArticlesNewbies
                                                    .toList();

                                            return ListView.separated(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 3.0),
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  articlesNewbiesItems.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 3.0),
                                              itemBuilder: (context,
                                                  articlesNewbiesItemsIndex) {
                                                final articlesNewbiesItemsItem =
                                                    articlesNewbiesItems[
                                                        articlesNewbiesItemsIndex];
                                                return FutureBuilder<
                                                    ApiCallResponse>(
                                                  future: ArticlesCall.call(
                                                    slug:
                                                        articlesNewbiesItemsItem,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final articlesFavItemArticlesResponse =
                                                        snapshot.data!;

                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          ArticlesWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'slug':
                                                                serializeParam(
                                                              articlesNewbiesItemsItem,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFF5F5FA),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    28.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    28.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    28.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    28.0),
                                                          ),
                                                        ),
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 140.0,
                                                                height: 140.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFFFCFCFE),
                                                                      Color(
                                                                          0xFFE9EBEE)
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    end: AlignmentDirectional(
                                                                        0, 1.0),
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            28.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            28.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            28.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            28.0),
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            13.0,
                                                                            6.0,
                                                                            13.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        '${FFAppState().graphQLimageURL}${getJsonField(
                                                                          articlesFavItemArticlesResponse
                                                                              .jsonBody,
                                                                          r'''$.data.articles.edges[*].node.coverThumbnail.medium''',
                                                                        ).toString()}',
                                                                        width:
                                                                            120.0,
                                                                        height:
                                                                            120.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 210.0,
                                                                  height: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Text(
                                                                    getJsonField(
                                                                      articlesFavItemArticlesResponse
                                                                          .jsonBody,
                                                                      r'''$.data.articles.edges[*].node.title''',
                                                                    )
                                                                        .toString()
                                                                        .maybeHandleOverflow(
                                                                          maxChars:
                                                                              42,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                    maxLines: 5,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelLargeFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  if (FFAppState().activeArticleItem ==
                                      'Новости')
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          height: 261.0,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(32.0),
                                              bottomRight:
                                                  Radius.circular(32.0),
                                              topLeft: Radius.circular(32.0),
                                              topRight: Radius.circular(32.0),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 2.0, 0.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final newsBanner =
                                                    FFAppConstants.news
                                                        .toList();

                                                return Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  child: Stack(
                                                    children: [
                                                      PageView.builder(
                                                        controller: _model
                                                                .pageViewController2 ??=
                                                            PageController(
                                                                initialPage: max(
                                                                    0,
                                                                    min(
                                                                        0,
                                                                        newsBanner.length -
                                                                            1))),
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount:
                                                            newsBanner.length,
                                                        itemBuilder: (context,
                                                            newsBannerIndex) {
                                                          final newsBannerItem =
                                                              newsBanner[
                                                                  newsBannerIndex];
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Flexible(
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                  child: FutureBuilder<
                                                                      ApiCallResponse>(
                                                                    future:
                                                                        ArticlesCall
                                                                            .call(
                                                                      slug:
                                                                          newsBannerItem,
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final stackArticlesResponse =
                                                                          snapshot
                                                                              .data!;

                                                                      return Stack(
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                context.pushNamed(
                                                                                  ArticlesWidget.routeName,
                                                                                  queryParameters: {
                                                                                    'slug': serializeParam(
                                                                                      newsBannerItem,
                                                                                      ParamType.String,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(24.0),
                                                                                child: Image.network(
                                                                                  '${FFAppState().graphQLimageURL}${getJsonField(
                                                                                    stackArticlesResponse.jsonBody,
                                                                                    r'''$.data.articles.edges[*].node.coverThumbnail.medium''',
                                                                                  ).toString()}',
                                                                                  width: double.infinity,
                                                                                  height: double.infinity,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 24.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  stackArticlesResponse.jsonBody,
                                                                                  r'''$.data.articles.edges[*].node.title''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                      fontFamily: 'Onest Cyr',
                                                                                      fontSize: 18.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey('Onest Cyr'),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: smooth_page_indicator
                                                              .SmoothPageIndicator(
                                                            controller: _model
                                                                    .pageViewController2 ??=
                                                                PageController(
                                                                    initialPage: max(
                                                                        0,
                                                                        min(
                                                                            0,
                                                                            newsBanner.length -
                                                                                1))),
                                                            count: newsBanner
                                                                .length,
                                                            axisDirection:
                                                                Axis.horizontal,
                                                            onDotClicked:
                                                                (i) async {
                                                              await _model
                                                                  .pageViewController2!
                                                                  .animateToPage(
                                                                i,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        500),
                                                                curve:
                                                                    Curves.ease,
                                                              );
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            effect: smooth_page_indicator
                                                                .ExpandingDotsEffect(
                                                              expansionFactor:
                                                                  2.5,
                                                              spacing: 5.0,
                                                              radius: 8.0,
                                                              dotWidth: 8.0,
                                                              dotHeight: 8.0,
                                                              dotColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              activeDotColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                              paintStyle:
                                                                  PaintingStyle
                                                                      .fill,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          child: ListTile(
                                            title: Text(
                                              'Новое',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Onest Cyr',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts:
                                                            GoogleFonts.asMap()
                                                                .containsKey(
                                                                    'Onest Cyr'),
                                                      ),
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            dense: false,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) {
                                            final newArticlesItems =
                                                FFAppConstants.newArticles
                                                    .toList();

                                            return ListView.separated(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 3.0),
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  newArticlesItems.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 3.0),
                                              itemBuilder: (context,
                                                  newArticlesItemsIndex) {
                                                final newArticlesItemsItem =
                                                    newArticlesItems[
                                                        newArticlesItemsIndex];
                                                return FutureBuilder<
                                                    ApiCallResponse>(
                                                  future: ArticlesCall.call(
                                                    slug: newArticlesItemsItem,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final newArtItemArticlesResponse =
                                                        snapshot.data!;

                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          ArticlesWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'slug':
                                                                serializeParam(
                                                              newArticlesItemsItem,
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFF5F5FA),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    28.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    28.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    28.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    28.0),
                                                          ),
                                                        ),
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 140.0,
                                                                height: 140.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  gradient:
                                                                      LinearGradient(
                                                                    colors: [
                                                                      Color(
                                                                          0xFFFCFCFE),
                                                                      Color(
                                                                          0xFFE9EBEE)
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0
                                                                    ],
                                                                    begin:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    end: AlignmentDirectional(
                                                                        0, 1.0),
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            28.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            28.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            28.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            28.0),
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          -1.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            13.0,
                                                                            6.0,
                                                                            13.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        '${FFAppState().graphQLimageURL}${getJsonField(
                                                                          newArtItemArticlesResponse
                                                                              .jsonBody,
                                                                          r'''$.data.articles.edges[*].node.coverThumbnail.medium''',
                                                                        ).toString()}',
                                                                        width:
                                                                            120.0,
                                                                        height:
                                                                            120.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 210.0,
                                                                  height: 100.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Text(
                                                                    getJsonField(
                                                                      newArtItemArticlesResponse
                                                                          .jsonBody,
                                                                      r'''$.data.articles.edges[*].node.title''',
                                                                    )
                                                                        .toString()
                                                                        .maybeHandleOverflow(
                                                                          maxChars:
                                                                              42,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                    maxLines: 5,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelLargeFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                ]
                                    .divide(SizedBox(height: 12.0))
                                    .addToStart(SizedBox(height: 12.0)),
                              ),
                            ),
                          ),
                        ),
                        KeepAliveWidgetWrapper(
                          builder: (context) => Container(),
                        ),
                        KeepAliveWidgetWrapper(
                          builder: (context) => SingleChildScrollView(
                            primary: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  child: ListTile(
                                    title: Text(
                                      'Избранное',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Onest Cyr',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Onest Cyr'),
                                          ),
                                    ),
                                    tileColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    dense: false,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 48.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Builder(
                                      builder: (context) {
                                        final favorites =
                                            FFAppConstants.Favorites.toList();

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: favorites.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(width: 8.0),
                                          itemBuilder:
                                              (context, favoritesIndex) {
                                            final favoritesItem =
                                                favorites[favoritesIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState()
                                                        .activeFavoriteItem =
                                                    favoritesItem;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: 104.0,
                                                height: 44.0,
                                                decoration: BoxDecoration(
                                                  color: favoritesItem ==
                                                          FFAppState()
                                                              .activeFavoriteItem
                                                      ? Color(0xFF143161)
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(14.0),
                                                    bottomRight:
                                                        Radius.circular(14.0),
                                                    topLeft:
                                                        Radius.circular(14.0),
                                                    topRight:
                                                        Radius.circular(14.0),
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    favoritesItem,
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Onest Cyr',
                                                              color: favoritesItem ==
                                                                      FFAppState()
                                                                          .activeFavoriteItem
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              useGoogleFonts: GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      'Onest Cyr'),
                                                            ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                if (FFAppState().activeFavoriteItem == 'Вина')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final favWines =
                                            FFAppConstants.FavWines.toList();

                                        return ListView.separated(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 6.0),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: favWines.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 6.0),
                                          itemBuilder:
                                              (context, favWinesIndex) {
                                            final favWinesItem =
                                                favWines[favWinesIndex];
                                            return FutureBuilder<
                                                ApiCallResponse>(
                                              future: GetWineDetailsVariableCall
                                                  .call(
                                                slug: favWinesItem,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final winesFavItemGetWineDetailsVariableResponse =
                                                    snapshot.data!;

                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      WineWidget.routeName,
                                                      queryParameters: {
                                                        'slug': serializeParam(
                                                          favWinesItem,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );

                                                    FFAppState()
                                                            .WineGastronomy =
                                                        getJsonField(
                                                      winesFavItemGetWineDetailsVariableResponse
                                                          .jsonBody,
                                                      r'''$.data.wines.edges[*].node.vintages.edges[*].node.gastronomy''',
                                                    ).toString();
                                                    FFAppState().WinesYear =
                                                        getJsonField(
                                                      winesFavItemGetWineDetailsVariableResponse
                                                          .jsonBody,
                                                      r'''$.data.wines.edges[*].node.vintages.edges[*].node.year''',
                                                      true,
                                                    )!
                                                            .toList()
                                                            .cast<int>();
                                                    FFAppState().WinesRate =
                                                        getJsonField(
                                                      winesFavItemGetWineDetailsVariableResponse
                                                          .jsonBody,
                                                      r'''$.data.wines.edges[*].node.vintages.edges[*].node.vintageRatings[*].score''',
                                                      true,
                                                    )!
                                                            .toList()
                                                            .cast<double>();
                                                    FFAppState().WinesImage =
                                                        (getJsonField(
                                                      winesFavItemGetWineDetailsVariableResponse
                                                          .jsonBody,
                                                      r'''$.data.wines.edges[*].node.vintages.edges[*].node.vintageRatings[*].rating.label''',
                                                      true,
                                                    ) as List)
                                                            .map<String>((s) =>
                                                                s.toString())
                                                            .toList()
                                                            .toList()
                                                            .cast<String>();
                                                    FFAppState().favorWine =
                                                        true;
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFF5F5FA),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                28.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                28.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                28.0),
                                                        topRight:
                                                            Radius.circular(
                                                                28.0),
                                                      ),
                                                    ),
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 100.0,
                                                            height: 156.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  Color(
                                                                      0xFFFCFCFE),
                                                                  Color(
                                                                      0xFFE9EBEE)
                                                                ],
                                                                stops: [
                                                                  0.0,
                                                                  1.0
                                                                ],
                                                                begin:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                end:
                                                                    AlignmentDirectional(
                                                                        0, 1.0),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        28.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        28.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        28.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        28.0),
                                                              ),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        6.0,
                                                                        13.0,
                                                                        6.0,
                                                                        13.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .network(
                                                                    '${FFAppState().graphQLimageURL}${getJsonField(
                                                                      winesFavItemGetWineDetailsVariableResponse
                                                                          .jsonBody,
                                                                      r'''$.data.wines.edges[:].node.vintages.edges[0].node.images[0].image''',
                                                                    ).toString()}',
                                                                    width: 48.0,
                                                                    height:
                                                                        125.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 250.0,
                                                              height: 66.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Text(
                                                                getJsonField(
                                                                  winesFavItemGetWineDetailsVariableResponse
                                                                      .jsonBody,
                                                                  r'''$.data.wines.edges[:].node.name''',
                                                                )
                                                                    .toString()
                                                                    .maybeHandleOverflow(
                                                                      maxChars:
                                                                          42,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                maxLines: 2,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleLargeFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleLargeFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                if (FFAppState().activeFavoriteItem == 'Статьи')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final favArticles =
                                            FFAppConstants.FavArticles.toList();

                                        return ListView.separated(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 3.0),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: favArticles.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 3.0),
                                          itemBuilder:
                                              (context, favArticlesIndex) {
                                            final favArticlesItem =
                                                favArticles[favArticlesIndex];
                                            return FutureBuilder<
                                                ApiCallResponse>(
                                              future: ArticlesCall.call(
                                                slug: favArticlesItem,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final articlesFavItemArticlesResponse =
                                                    snapshot.data!;

                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      ArticlesWidget.routeName,
                                                      queryParameters: {
                                                        'slug': serializeParam(
                                                          favArticlesItem,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFF5F5FA),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                28.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                28.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                28.0),
                                                        topRight:
                                                            Radius.circular(
                                                                28.0),
                                                      ),
                                                    ),
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 140.0,
                                                            height: 140.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  Color(
                                                                      0xFFFCFCFE),
                                                                  Color(
                                                                      0xFFE9EBEE)
                                                                ],
                                                                stops: [
                                                                  0.0,
                                                                  1.0
                                                                ],
                                                                begin:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                end:
                                                                    AlignmentDirectional(
                                                                        0, 1.0),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        28.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        28.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        28.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        28.0),
                                                              ),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        6.0,
                                                                        13.0,
                                                                        6.0,
                                                                        13.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .network(
                                                                    '${FFAppState().graphQLimageURL}${getJsonField(
                                                                      articlesFavItemArticlesResponse
                                                                          .jsonBody,
                                                                      r'''$.data.articles.edges[*].node.expert.avatar''',
                                                                    ).toString()}',
                                                                    width:
                                                                        120.0,
                                                                    height:
                                                                        120.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 210.0,
                                                              height: 100.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Text(
                                                                getJsonField(
                                                                  articlesFavItemArticlesResponse
                                                                      .jsonBody,
                                                                  r'''$.data.articles.edges[*].node.title''',
                                                                )
                                                                    .toString()
                                                                    .maybeHandleOverflow(
                                                                      maxChars:
                                                                          42,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                maxLines: 5,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelLargeFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelLargeFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                if (FFAppState().activeFavoriteItem ==
                                    'Винодельни')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Text(
                                        'Ваш список любимых виноделен пуст.',
                                        maxLines: 2,
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Onest Cyr',
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey('Onest Cyr'),
                                            ),
                                      ),
                                    ),
                                  ),
                              ]
                                  .divide(SizedBox(height: 12.0))
                                  .addToStart(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                        KeepAliveWidgetWrapper(
                          builder: (context) => Stack(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SingleChildScrollView(
                                    primary: false,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 311.0,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Flexible(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Stack(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                        child: Image.network(
                                                          'https://kultovo.ru/images/login/background.png',
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/Group.svg',
                                                            width: 120.0,
                                                            height: 120.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 1.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          0.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      32.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      32.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Material(
                                                color: Colors.transparent,
                                                child: ListTile(
                                                  title: Text(
                                                    'Профиль',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily:
                                                              'Onest Cyr',
                                                          color:
                                                              Color(0xFF1F1F1F),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts:
                                                              GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      'Onest Cyr'),
                                                        ),
                                                  ),
                                                  dense: false,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(14.0, 0.0,
                                                              12.0, 0.0),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 68.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              child: TextFormField(
                                                controller:
                                                    _model.emailTextController,
                                                focusNode:
                                                    _model.emailFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.emailTextController',
                                                  Duration(milliseconds: 2000),
                                                  () => safeSetState(() {}),
                                                ),
                                                autofocus: false,
                                                textInputAction:
                                                    TextInputAction.next,
                                                readOnly: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelText: 'Email',
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Onest Cyr',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            GoogleFonts.asMap()
                                                                .containsKey(
                                                                    'Onest Cyr'),
                                                      ),
                                                  alignLabelWithHint: false,
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Onest Cyr',
                                                        color:
                                                            Color(0xFFAFB0B4),
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            GoogleFonts.asMap()
                                                                .containsKey(
                                                                    'Onest Cyr'),
                                                      ),
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  focusedErrorBorder:
                                                      InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(12.0, 8.0,
                                                              0.0, 0.0),
                                                  hoverColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Onest Cyr',
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      useGoogleFonts:
                                                          GoogleFonts.asMap()
                                                              .containsKey(
                                                                  'Onest Cyr'),
                                                    ),
                                                maxLength: 96,
                                                maxLengthEnforcement:
                                                    MaxLengthEnforcement
                                                        .enforced,
                                                buildCounter: (context,
                                                        {required currentLength,
                                                        required isFocused,
                                                        maxLength}) =>
                                                    null,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .emailTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons
                                                      .contact_support_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              'Если вы обнаружили ошибку. ',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                        TextSpan(
                                                          text: 'Напишите нам!',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: Color(
                                                                    0xFF143161),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                          mouseCursor:
                                                              SystemMouseCursors
                                                                  .click,
                                                          recognizer:
                                                              TapGestureRecognizer()
                                                                ..onTap =
                                                                    () async {
                                                                  await launchUrl(Uri(
                                                                      scheme: 'mailto',
                                                                      path: 'example@mail.ru',
                                                                      query: {
                                                                        'subject':
                                                                            'Предложение по улучшению WineCompas',
                                                                        'body':
                                                                            'Введите Ваш текст здесь',
                                                                      }.entries.map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&')));
                                                                },
                                                        )
                                                      ],
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 4.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              FFAppState().userLoggedIn = false;
                                              FFAppState().ActiveTabIndex = 0;
                                              safeSetState(() {});

                                              context.pushNamed(
                                                  MainPageWidget.routeName);
                                            },
                                            child: Icon(
                                              Icons.logout_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState().userLoggedIn =
                                                    false;
                                                FFAppState().ActiveTabIndex = 0;
                                                safeSetState(() {});

                                                context.pushNamed(
                                                    MainPageWidget.routeName);
                                              },
                                              child: RichText(
                                                textScaler:
                                                    MediaQuery.of(context)
                                                        .textScaler,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Выйти из профиля',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 190.0,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          28.0, 0.0, 0.0, 0.0),
                                                  child: Icon(
                                                    Icons.delete_forever,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 20.0,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              'Удаление аккаунта',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: Color(
                                                                    0xFF143161),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                          mouseCursor:
                                                              SystemMouseCursors
                                                                  .click,
                                                          recognizer:
                                                              TapGestureRecognizer()
                                                                ..onTap =
                                                                    () async {
                                                                  await launchURL(
                                                                      'https://forms.gle/335PsR9khzTvb6fX9');
                                                                },
                                                        )
                                                      ],
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: Color(
                                                                    0xFF710107),
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 4.0)),
                                      ),
                                    ),
                                  ),
                                  if (!(isWeb
                                      ? MediaQuery.viewInsetsOf(context)
                                              .bottom >
                                          0
                                      : _isKeyboardVisible))
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 12.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 24.0,
                                          decoration: BoxDecoration(),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              'Только для лиц старше 18 лет',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Onest Cyr',
                                                        color:
                                                            Color(0x1F1F1F1F),
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            GoogleFonts.asMap()
                                                                .containsKey(
                                                                    'Onest Cyr'),
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.0, 0),
                    child: FlutterFlowButtonTabBar(
                      useToggleButtonStyle: true,
                      labelStyle: FlutterFlowTheme.of(context)
                          .titleMedium
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleMediumFamily),
                          ),
                      unselectedLabelStyle: TextStyle(),
                      backgroundColor: Color(0xFFF5F5FA),
                      borderWidth: 0.0,
                      borderRadius: 32.0,
                      elevation: 1.0,
                      buttonMargin:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      padding: EdgeInsets.all(34.0),
                      tabs: [
                        Opacity(
                          opacity: _model.tabBarCurrentIndex == 0 ? 1.0 : 0.4,
                          child: Tab(
                            icon: Icon(
                              Icons.home_rounded,
                              color: Color(0xFF143161),
                              size: 32.0,
                            ),
                            iconMargin: EdgeInsetsDirectional.fromSTEB(
                                0.0, 18.0, 0.0, 0.0),
                          ),
                        ),
                        Opacity(
                          opacity: _model.tabBarCurrentIndex == 1 ? 1.0 : 0.4,
                          child: Tab(
                            icon: Icon(
                              Icons.apps_rounded,
                              color: Color(0xFF143161),
                              size: 32.0,
                            ),
                            iconMargin: EdgeInsetsDirectional.fromSTEB(
                                0.0, 18.0, 0.0, 0.0),
                          ),
                        ),
                        Opacity(
                          opacity: _model.tabBarCurrentIndex == 2 ? 1.0 : 0.4,
                          child: Tab(
                            icon: Icon(
                              Icons.camera_enhance,
                              color: Color(0xFF143161),
                              size: 50.0,
                            ),
                            iconMargin: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                          ),
                        ),
                        Opacity(
                          opacity: _model.tabBarCurrentIndex == 3 ? 1.0 : 0.4,
                          child: Tab(
                            icon: Icon(
                              Icons.star_rounded,
                              color: Color(0xFF143161),
                              size: 32.0,
                            ),
                            iconMargin: EdgeInsetsDirectional.fromSTEB(
                                0.0, 18.0, 0.0, 0.0),
                          ),
                        ),
                        Opacity(
                          opacity: _model.tabBarCurrentIndex == 4 ? 1.0 : 0.4,
                          child: Tab(
                            icon: Icon(
                              Icons.person,
                              color: Color(0xFF143161),
                              size: 32.0,
                            ),
                            iconMargin: EdgeInsetsDirectional.fromSTEB(
                                0.0, 18.0, 0.0, 0.0),
                          ),
                        ),
                      ],
                      controller: _model.tabBarController,
                      onTap: (i) async {
                        [
                          () async {
                            FFAppState().ActiveTabIndex =
                                _model.tabBarCurrentIndex;
                            safeSetState(() {});
                          },
                          () async {
                            FFAppState().ActiveTabIndex =
                                _model.tabBarCurrentIndex;
                            safeSetState(() {});
                          },
                          () async {
                            FFAppState().ActiveTabIndex =
                                _model.tabBarCurrentIndex;
                            safeSetState(() {});
                            final selectedMedia = await selectMedia(
                              imageQuality: 100,
                              multiImage: false,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              safeSetState(() => _model.isDataUploading = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              try {
                                showUploadMessage(
                                  context,
                                  'Uploading file...',
                                  showLoading: true,
                                );
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                          blurHash: m.blurHash,
                                        ))
                                    .toList();
                              } finally {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                _model.isDataUploading = false;
                              }
                              if (selectedUploadedFiles.length ==
                                  selectedMedia.length) {
                                safeSetState(() {
                                  _model.uploadedLocalFile =
                                      selectedUploadedFiles.first;
                                });
                                showUploadMessage(context, 'Success!');
                              } else {
                                safeSetState(() {});
                                showUploadMessage(
                                    context, 'Failed to upload data');
                                return;
                              }
                            }

                            _model.searchOutput =
                                await actions.sendGraphQLUploadRequest(
                              _model.uploadedLocalFile,
                            );
                            FFAppState().searchOutputVar = _model.searchOutput!;
                            FFAppState().fullScanSlug = getJsonField(
                              FFAppState().searchOutputVar,
                              r'''$.data.vintageSearch.full[*].vintage.wine.slug''',
                            ).toString();
                            FFAppState().partialScanSlug = getJsonField(
                              FFAppState().searchOutputVar,
                              r'''$.data.vintageSearch.partial[*].vintage.wine.slug''',
                            ).toString();
                            if ((FFAppState().fullScanSlug != '') ||
                                (FFAppState().partialScanSlug != '')) {
                              context.pushNamed(
                                WineWidget.routeName,
                                queryParameters: {
                                  'slug': serializeParam(
                                    '${FFAppState().fullScanSlug != 'null' ? FFAppState().fullScanSlug : ''}${FFAppState().partialScanSlug != 'null' ? FFAppState().partialScanSlug : ''}',
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            }

                            safeSetState(() {});
                          },
                          () async {
                            FFAppState().ActiveTabIndex =
                                _model.tabBarCurrentIndex;
                            safeSetState(() {});
                          },
                          () async {
                            if (FFAppState().userLoggedIn == true) {
                              FFAppState().ActiveTabIndex =
                                  _model.tabBarCurrentIndex;
                              safeSetState(() {});
                            } else {
                              context.pushNamed(LoginPageWidget.routeName);
                            }

                            FFAppState().ActiveTabIndex =
                                _model.tabBarCurrentIndex;
                            FFAppState().update(() {});
                          }
                        ][i]();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
