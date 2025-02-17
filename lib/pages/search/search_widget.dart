import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_model.dart';
export 'search_model.dart';

/// from Main Screen
class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late SearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultIncentive = await IncentiveSearchCall.call();

      if ((_model.apiResultIncentive?.succeeded ?? true)) {
        _model.incentiveValue = getJsonField(
          (_model.apiResultIncentive?.jsonBody ?? ''),
          r'''$..randomQuery''',
        ).toString().toString();
        safeSetState(() {});
      }
    });

    _model.searchFieldTextController ??= TextEditingController();
    _model.searchFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 48.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.search,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.7,
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  child: TextFormField(
                                    controller:
                                        _model.searchFieldTextController,
                                    focusNode: _model.searchFieldFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.searchFieldTextController',
                                      Duration(milliseconds: 750),
                                      () async {
                                        _model.apiResultWineSearch =
                                            await WineSearchCall.call(
                                          term: _model
                                              .searchFieldTextController.text,
                                        );

                                        // checkWines
                                        FFAppState().searchNullCheckWines =
                                            getJsonField(
                                          (_model.apiResultWineSearch
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.data.search.wines.edges[:]''',
                                        ).toString();
                                        safeSetState(() {});
                                        _model.apiResultArticleSearch =
                                            await ArticleSearchCall.call(
                                          term: _model
                                              .searchFieldTextController.text,
                                        );

                                        // checkArticles
                                        FFAppState().searchNullCheckArticles =
                                            getJsonField(
                                          (_model.apiResultArticleSearch
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.data.search.articles.edges[:]''',
                                        ).toString();
                                        safeSetState(() {});
                                        _model.apiResultWinerySearch =
                                            await WinerySearchCall.call(
                                          term: _model
                                              .searchFieldTextController.text,
                                        );

                                        // checkWineries
                                        FFAppState().searchNullCheckWineries =
                                            getJsonField(
                                          (_model.apiResultWinerySearch
                                                  ?.jsonBody ??
                                              ''),
                                          r'''$.data.search.wineries.edges[:]''',
                                        ).toString();
                                        safeSetState(() {});

                                        safeSetState(() {});
                                      },
                                    ),
                                    autofocus: _model.incentiveValue != '',
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily),
                                          ),
                                      hintText: 'Вино',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            color: Color(0xFFAFB0B4),
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily),
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFF5F5FA),
                                      hoverColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      suffixIcon: _model
                                              .searchFieldTextController!
                                              .text
                                              .isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model.searchFieldTextController
                                                    ?.clear();
                                                _model.apiResultWineSearch =
                                                    await WineSearchCall.call(
                                                  term: _model
                                                      .searchFieldTextController
                                                      .text,
                                                );

                                                // checkWines
                                                FFAppState()
                                                        .searchNullCheckWines =
                                                    getJsonField(
                                                  (_model.apiResultWineSearch
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.data.search.wines.edges[:]''',
                                                ).toString();
                                                safeSetState(() {});
                                                _model.apiResultArticleSearch =
                                                    await ArticleSearchCall
                                                        .call(
                                                  term: _model
                                                      .searchFieldTextController
                                                      .text,
                                                );

                                                // checkArticles
                                                FFAppState()
                                                        .searchNullCheckArticles =
                                                    getJsonField(
                                                  (_model.apiResultArticleSearch
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.data.search.articles.edges[:]''',
                                                ).toString();
                                                safeSetState(() {});
                                                _model.apiResultWinerySearch =
                                                    await WinerySearchCall.call(
                                                  term: _model
                                                      .searchFieldTextController
                                                      .text,
                                                );

                                                // checkWineries
                                                FFAppState()
                                                        .searchNullCheckWineries =
                                                    getJsonField(
                                                  (_model.apiResultWinerySearch
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.data.search.wineries.edges[:]''',
                                                ).toString();
                                                safeSetState(() {});

                                                safeSetState(() {});
                                                safeSetState(() {});
                                              },
                                              child: Icon(
                                                Icons.clear,
                                                size: 22,
                                              ),
                                            )
                                          : null,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Onest Cyr',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey('Onest Cyr'),
                                        ),
                                    cursorColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    validator: _model
                                        .searchFieldTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.safePop();
                          },
                          text: 'Отмена',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyLargeFamily,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyLargeFamily),
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if ((FFAppState().searchNullCheckWines != 'null') &&
                          (_model.searchFieldTextController.text != ''))
                        Material(
                          color: Colors.transparent,
                          child: ListTile(
                            title: Text(
                              'Вина',
                              textAlign: TextAlign.start,
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
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      if ((FFAppState().searchNullCheckWines != 'null') &&
                          (_model.searchFieldTextController.text != ''))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final foundWines = getJsonField(
                                (_model.apiResultWineSearch?.jsonBody ?? ''),
                                r'''$.data.search.wines.edges[:].node''',
                              ).toList();

                              return ListView.separated(
                                padding: EdgeInsets.symmetric(vertical: 6.0),
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: foundWines.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 6.0),
                                itemBuilder: (context, foundWinesIndex) {
                                  final foundWinesItem =
                                      foundWines[foundWinesIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'Wine',
                                        queryParameters: {
                                          'slug': serializeParam(
                                            getJsonField(
                                              foundWinesItem,
                                              r'''$.slug''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );

                                      FFAppState().WineGastronomy =
                                          getJsonField(
                                        foundWinesItem,
                                        r'''$.vintages.edges[0].node.gastronomy''',
                                      ).toString();
                                      FFAppState().WinesYear = getJsonField(
                                        foundWinesItem,
                                        r'''$.vintages.edges[*].node.year''',
                                        true,
                                      )!
                                          .toList()
                                          .cast<int>();
                                      FFAppState().WinesRate = getJsonField(
                                        foundWinesItem,
                                        r'''$.vintages.edges[*].node.vintageRatings[*].score''',
                                        true,
                                      )!
                                          .toList()
                                          .cast<double>();
                                      FFAppState().WinesImage = (getJsonField(
                                        foundWinesItem,
                                        r'''$.vintages.edges[*].node.vintageRatings[*].rating.labelThumbnail.low''',
                                        true,
                                      ) as List)
                                          .map<String>((s) => s.toString())
                                          .toList()
                                          .toList()
                                          .cast<String>();
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF5F5FA),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(28.0),
                                          bottomRight: Radius.circular(28.0),
                                          topLeft: Radius.circular(28.0),
                                          topRight: Radius.circular(28.0),
                                        ),
                                      ),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 80.0,
                                              height: 188.0,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color(0xFFFCFCFE),
                                                    Color(0xFFE9EBEE)
                                                  ],
                                                  stops: [0.0, 1.0],
                                                  begin: AlignmentDirectional(
                                                      0.0, -1.0),
                                                  end: AlignmentDirectional(
                                                      0, 1.0),
                                                ),
                                                borderRadius: BorderRadius.only(
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
                                              child: Stack(
                                                children: [
                                                  if (getJsonField(
                                                        foundWinesItem,
                                                        r'''$.vintages.edges[0].node.images[0].image''',
                                                      ) !=
                                                      null)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    6.0,
                                                                    1.0,
                                                                    6.0,
                                                                    1.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              CachedNetworkImage(
                                                            fadeInDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            fadeOutDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        500),
                                                            imageUrl:
                                                                '${FFAppState().graphQLimageURL}${getJsonField(
                                                              foundWinesItem,
                                                              r'''$.vintages.edges[0].node.images[0].imageThumbnail.low''',
                                                            ).toString()}',
                                                            width: 52.0,
                                                            height: 185.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (getJsonField(
                                                        foundWinesItem,
                                                        r'''$.vintages.edges[0].node.images[0].image''',
                                                      ) ==
                                                      null)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    6.0,
                                                                    0.0,
                                                                    6.0,
                                                                    0.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/images/emptyWine.svg',
                                                            width: 52.0,
                                                            height: 135.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                width: 250.0,
                                                height: 66.0,
                                                decoration: BoxDecoration(),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Text(
                                                    getJsonField(
                                                      foundWinesItem,
                                                      r'''$.name''',
                                                    )
                                                        .toString()
                                                        .maybeHandleOverflow(
                                                          maxChars: 42,
                                                          replacement: '…',
                                                        ),
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily:
                                                              'Onest Cyr',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      'Onest Cyr'),
                                                        ),
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
                          ),
                        ),
                      if ((FFAppState().searchNullCheckWineries != 'null') &&
                          (_model.searchFieldTextController.text != ''))
                        Material(
                          color: Colors.transparent,
                          child: ListTile(
                            title: Text(
                              'Винодельни',
                              textAlign: TextAlign.start,
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
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      if ((FFAppState().searchNullCheckWineries != 'null') &&
                          (_model.searchFieldTextController.text != ''))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: ListView(
                            padding: EdgeInsets.symmetric(vertical: 6.0),
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F5FA),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(28.0),
                                    bottomRight: Radius.circular(28.0),
                                    topLeft: Radius.circular(28.0),
                                    topRight: Radius.circular(28.0),
                                  ),
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 100.0,
                                        height: 156.0,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFFFCFCFE),
                                              Color(0xFFE9EBEE)
                                            ],
                                            stops: [0.0, 1.0],
                                            begin:
                                                AlignmentDirectional(0.0, -1.0),
                                            end: AlignmentDirectional(0, 1.0),
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(28.0),
                                            bottomRight: Radius.circular(28.0),
                                            topLeft: Radius.circular(28.0),
                                            topRight: Radius.circular(28.0),
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 13.0, 6.0, 13.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: SvgPicture.asset(
                                                'assets/images/emptyWine.svg',
                                                width: 48.0,
                                                height: 125.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Container(
                                          width: 250.0,
                                          height: 66.0,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                getJsonField(
                                                  (_model.apiResultWinerySearch
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.data.search.wineries.edges [0].node.name''',
                                                )
                                                    .toString()
                                                    .maybeHandleOverflow(
                                                      maxChars: 42,
                                                      replacement: '…',
                                                    ),
                                                maxLines: 2,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleLarge
                                                    .override(
                                                      fontFamily: 'Onest Cyr',
                                                      fontSize: 18.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          GoogleFonts.asMap()
                                                              .containsKey(
                                                                  'Onest Cyr'),
                                                    ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Text(
                                                  '${getJsonField(
                                                    (_model.apiResultWinerySearch
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.data.search.wineries.edges [0].node.wines.edgeCount''',
                                                  ).toString()} вин'
                                                      .maybeHandleOverflow(
                                                    maxChars: 42,
                                                    replacement: '…',
                                                  ),
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Onest Cyr',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            GoogleFonts.asMap()
                                                                .containsKey(
                                                                    'Onest Cyr'),
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 6.0)),
                          ),
                        ),
                      if ((FFAppState().searchNullCheckArticles != 'null') &&
                          (_model.searchFieldTextController.text != ''))
                        Material(
                          color: Colors.transparent,
                          child: ListTile(
                            title: Text(
                              'Статьи',
                              textAlign: TextAlign.start,
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
                            contentPadding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      if ((FFAppState().searchNullCheckArticles != 'null') &&
                          (_model.searchFieldTextController.text != ''))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final articlesItemSearch = getJsonField(
                                (_model.apiResultArticleSearch?.jsonBody ?? ''),
                                r'''$.data.search.articles.edges[:].node''',
                              ).toList();

                              return ListView.separated(
                                padding: EdgeInsets.symmetric(vertical: 3.0),
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: articlesItemSearch.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 3.0),
                                itemBuilder:
                                    (context, articlesItemSearchIndex) {
                                  final articlesItemSearchItem =
                                      articlesItemSearch[
                                          articlesItemSearchIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'Articles',
                                        queryParameters: {
                                          'slug': serializeParam(
                                            getJsonField(
                                              articlesItemSearchItem,
                                              r'''$.slug''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );

                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF5F5FA),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(28.0),
                                          bottomRight: Radius.circular(28.0),
                                          topLeft: Radius.circular(28.0),
                                          topRight: Radius.circular(28.0),
                                        ),
                                      ),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 140.0,
                                              height: 140.0,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color(0xFFFCFCFE),
                                                    Color(0xFFE9EBEE)
                                                  ],
                                                  stops: [0.0, 1.0],
                                                  begin: AlignmentDirectional(
                                                      0.0, -1.0),
                                                  end: AlignmentDirectional(
                                                      0, 1.0),
                                                ),
                                                borderRadius: BorderRadius.only(
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
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          6.0, 13.0, 6.0, 13.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      '${FFAppState().graphQLimageURL}${getJsonField(
                                                        articlesItemSearchItem,
                                                        r'''$.coverThumbnail.low''',
                                                      ).toString()}',
                                                      width: 120.0,
                                                      height: 120.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                width: 210.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(),
                                                child: Text(
                                                  getJsonField(
                                                    articlesItemSearchItem,
                                                    r'''$.title''',
                                                  )
                                                      .toString()
                                                      .maybeHandleOverflow(
                                                        maxChars: 42,
                                                        replacement: '…',
                                                      ),
                                                  maxLines: 5,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Onest Cyr',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            GoogleFonts.asMap()
                                                                .containsKey(
                                                                    'Onest Cyr'),
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
                          ),
                        ),
                    ]
                        .divide(SizedBox(height: 12.0))
                        .addToStart(SizedBox(height: 12.0)),
                  ),
                ),
                if ((_model.searchFieldTextController.text != '') &&
                    (FFAppState().searchNullCheckArticles == 'null') &&
                    (FFAppState().searchNullCheckWineries == 'null') &&
                    (FFAppState().searchNullCheckWines == 'null'))
                  Material(
                    color: Colors.transparent,
                    child: ListTile(
                      title: Text(
                        'К сожалению, по запросу «${_model.searchFieldTextController.text}» ничего не найдено',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Onest Cyr',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts:
                                  GoogleFonts.asMap().containsKey('Onest Cyr'),
                            ),
                      ),
                      tileColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      dense: false,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
