import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'wine_screen_model.dart';
export 'wine_screen_model.dart';

class WineScreenWidget extends StatefulWidget {
  const WineScreenWidget({
    super.key,
    String? slug,
  }) : slug = slug ?? 'kokur-saryi-pandas';

  final String slug;

  @override
  State<WineScreenWidget> createState() => _WineScreenWidgetState();
}

class _WineScreenWidgetState extends State<WineScreenWidget> {
  late WineScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WineScreenModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: GetWineDetailsVariableCall.call(
        slug: widget.slug,
      ),
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
        final wineScreenGetWineDetailsVariableResponse = snapshot.data!;

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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 360.0,
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF2F2F2),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(28.0),
                                bottomRight: Radius.circular(28.0),
                                topLeft: Radius.circular(28.0),
                                topRight: Radius.circular(28.0),
                              ),
                            ),
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  '${FFAppState().graphQLimageURL}${getJsonField(
                                    wineScreenGetWineDetailsVariableResponse
                                        .jsonBody,
                                    r'''$.data.wines.edges[0].node.vintages.edges[0].node.images[0].image''',
                                  ).toString()}',
                                  width: 120.0,
                                  height: 313.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(1.0, -1.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.safePop();
                                FFAppState().WinesYear = [];
                                FFAppState().WinesImage = [];
                                FFAppState().WinesRate = [];
                                FFAppState().SelectedYear = 0;
                              },
                              child: Container(
                                width: 80.0,
                                height: 80.0,
                                decoration: const BoxDecoration(),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: 32.0,
                                        height: 32.0,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFECECEC),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(24.0),
                                            bottomRight: Radius.circular(24.0),
                                            topLeft: Radius.circular(24.0),
                                            topRight: Radius.circular(24.0),
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.close_rounded,
                                          color: Color(0xFF706F6F),
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 28.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: 62.0,
                              height: 5.0,
                              decoration: const BoxDecoration(
                                color: Color(0xFFECECEC),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(24.0),
                                  bottomRight: Radius.circular(24.0),
                                  topLeft: Radius.circular(24.0),
                                  topRight: Radius.circular(24.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.7,
                                height: 45.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.7,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                getJsonField(
                                                  wineScreenGetWineDetailsVariableResponse
                                                      .jsonBody,
                                                  r'''$.data.wines.edges[0].node.name''',
                                                ).toString(),
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w800,
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
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 45.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Opacity(
                                        opacity: _model.favIcolor ==
                                                const Color(0xFFD5386C)
                                            ? 1.0
                                            : 0.4,
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.favIcolor =
                                                _model.favIcolor ==
                                                        const Color(0xFF28303F)
                                                    ? const Color(0xFFD5386C)
                                                    : (_model.favIcolor ==
                                                            const Color(0xFFD5386C)
                                                        ? const Color(0xFF28303F)
                                                        : const Color(0x00000000));
                                            safeSetState(() {});
                                          },
                                          child: Icon(
                                            Icons.favorite_rounded,
                                            color: _model.favIcolor,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await Share.share(
                                            'https://kultovo.ru/wine/${widget.slug}',
                                            sharePositionOrigin:
                                                getWidgetBoundingBox(context),
                                          );
                                        },
                                        child: Container(
                                          width: 40.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Opacity(
                                            opacity: 0.4,
                                            child: Icon(
                                              Icons.share_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
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
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: ListTile(
                        subtitle: Text(
                          FFAppState().WineGastronomy,
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .labelMediumFamily),
                              ),
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        dense: false,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 24.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                    ),
                    if (FFAppState().WinesRate.isNotEmpty)
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 12.0),
                        child: Container(
                          width: double.infinity,
                          height: 72.0,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Builder(
                            builder: (context) {
                              final years = FFAppState().WinesRate.toList();

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                itemCount: years.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(width: 4.0),
                                itemBuilder: (context, yearsIndex) {
                                  final yearsItem = years[yearsIndex];
                                  return Container(
                                    width: 104.0,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFF2F2F2),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(22.0),
                                        bottomRight: Radius.circular(22.0),
                                        topLeft: Radius.circular(22.0),
                                        topRight: Radius.circular(22.0),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 80.0,
                                          height: 30.0,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFF5F5FA),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              const Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 2.0, 0.0),
                                                  child: Icon(
                                                    Icons.star_rounded,
                                                    color: Color(0xFFEEB850),
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    FFAppState()
                                                        .WinesRate
                                                        .elementAtOrNull(
                                                            yearsIndex)
                                                        ?.toString(),
                                                    '0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily),
                                                      ),
                                                ),
                                              ),
                                            ].divide(const SizedBox(width: 2.0)),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              '${FFAppState().graphQLimageURL}${valueOrDefault<String>(
                                                FFAppState()
                                                    .WinesImage
                                                    .elementAtOrNull(
                                                        yearsIndex),
                                                '0',
                                              )}',
                                              width: 77.0,
                                              height: 34.0,
                                              fit: BoxFit.contain,
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
                        ),
                      ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Builder(
                          builder: (context) {
                            final yearsButtons =
                                FFAppState().WinesYear.toList();

                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemCount: yearsButtons.length,
                              separatorBuilder: (_, __) => const SizedBox(width: 4.0),
                              itemBuilder: (context, yearsButtonsIndex) {
                                final yearsButtonsItem =
                                    yearsButtons[yearsButtonsIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (yearsButtonsIndex == 0) {
                                      FFAppState().WinesRate = getJsonField(
                                        wineScreenGetWineDetailsVariableResponse
                                            .jsonBody,
                                        r'''$.data.wines.edges[0].node.vintages.edges[0].node.vintageRatings[:].score''',
                                        true,
                                      )!
                                          .toList()
                                          .cast<double>();
                                      FFAppState().WinesImage = (getJsonField(
                                        wineScreenGetWineDetailsVariableResponse
                                            .jsonBody,
                                        r'''$.data.wines.edges[0].node.vintages.edges[0].node.vintageRatings[:].rating.label''',
                                        true,
                                      ) as List)
                                          .map<String>((s) => s.toString())
                                          .toList()
                                          .toList()
                                          .cast<String>();
                                      FFAppState().SelectedYear =
                                          yearsButtonsIndex;
                                      safeSetState(() {});
                                    } else if (yearsButtonsIndex == 1) {
                                      FFAppState().WinesRate = [];
                                      FFAppState().WinesImage = [];
                                      FFAppState().SelectedYear =
                                          yearsButtonsIndex;
                                      FFAppState().update(() {});
                                      FFAppState().WinesRate = getJsonField(
                                        wineScreenGetWineDetailsVariableResponse
                                            .jsonBody,
                                        r'''$.data.wines.edges[0].node.vintages.edges[1].node.vintageRatings[:].score''',
                                        true,
                                      )!
                                          .toList()
                                          .cast<double>();
                                      FFAppState().WinesImage = (getJsonField(
                                        wineScreenGetWineDetailsVariableResponse
                                            .jsonBody,
                                        r'''$.data.wines.edges[0].node.vintages.edges[1].node.vintageRatings[:].rating.label''',
                                        true,
                                      ) as List)
                                          .map<String>((s) => s.toString())
                                          .toList()
                                          .toList()
                                          .cast<String>();
                                      FFAppState().SelectedYear =
                                          yearsButtonsIndex;
                                      FFAppState().update(() {});
                                    }
                                  },
                                  child: Container(
                                    width: 104.0,
                                    height: 44.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF2F2F2),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(14.0),
                                        bottomRight: Radius.circular(14.0),
                                        topLeft: Radius.circular(14.0),
                                        topRight: Radius.circular(14.0),
                                      ),
                                      border: Border.all(
                                        color: yearsButtonsIndex ==
                                                FFAppState().SelectedYear
                                            ? const Color(0xFF154E78)
                                            : const Color(0x00000000),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          FFAppState()
                                              .WinesYear
                                              .elementAtOrNull(
                                                  yearsButtonsIndex)
                                              ?.toString(),
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
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
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: ListTile(
                        title: Text(
                          'О вине',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Onest Cyr',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w800,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Onest Cyr'),
                                  ),
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        dense: false,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 10.0, 0.0, 0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 12.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              getJsonField(
                                wineScreenGetWineDetailsVariableResponse
                                    .jsonBody,
                                r'''$.data.wines.edges[0].node.vintages.edges[0].node.description''',
                              ).toString(),
                              textAlign: TextAlign.start,
                              maxLines: 6,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 62.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: ListView(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  if (getJsonField(
                                        wineScreenGetWineDetailsVariableResponse
                                            .jsonBody,
                                        r'''$.data.wines.edges[0].node.wineType.name''',
                                      ) !=
                                      null)
                                    Container(
                                      width: 80.0,
                                      height: 31.0,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFF2F2F2),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(14.0),
                                          bottomRight: Radius.circular(14.0),
                                          topLeft: Radius.circular(14.0),
                                          topRight: Radius.circular(14.0),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 0.0, 4.0),
                                              child: Text(
                                                'Тип',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 12.0,
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
                                          if (getJsonField(
                                                wineScreenGetWineDetailsVariableResponse
                                                    .jsonBody,
                                                r'''$.data.wines.edges[0].node.wineType.name''',
                                              ) !=
                                              null)
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: Text(
                                                  getJsonField(
                                                    wineScreenGetWineDetailsVariableResponse
                                                        .jsonBody,
                                                    r'''$.data.wines.edges[0].node.wineType.name''',
                                                  ).toString(),
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
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
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  if (getJsonField(
                                        wineScreenGetWineDetailsVariableResponse
                                            .jsonBody,
                                        r'''$.data.wines.edges[:].node.wineGrapes[0].grape.variety''',
                                      ) !=
                                      null)
                                    Container(
                                      height: 31.0,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFF2F2F2),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(14.0),
                                          bottomRight: Radius.circular(14.0),
                                          topLeft: Radius.circular(14.0),
                                          topRight: Radius.circular(14.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: SingleChildScrollView(
                                          primary: false,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 4.0),
                                                child: Text(
                                                  'Сорта винограда',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 12.0,
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
                                              Container(
                                                height: 20.0,
                                                decoration: const BoxDecoration(
                                                  color: Color(0xFFF5F5FA),
                                                ),
                                                child: Builder(
                                                  builder: (context) {
                                                    final grapes =
                                                        GetWineDetailsVariableCall
                                                                .allData(
                                                              wineScreenGetWineDetailsVariableResponse
                                                                  .jsonBody,
                                                            )?.toList() ??
                                                            [];

                                                    return ListView.separated(
                                                      padding:
                                                          const EdgeInsets.fromLTRB(
                                                        2.0,
                                                        0,
                                                        2.0,
                                                        0,
                                                      ),
                                                      primary: false,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount: grapes.length,
                                                      separatorBuilder: (_,
                                                              __) =>
                                                          const SizedBox(width: 4.0),
                                                      itemBuilder: (context,
                                                          grapesIndex) {
                                                        final grapesItem =
                                                            grapes[grapesIndex];
                                                        return SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.removeBrackets(
                                                                      (getJsonField(
                                                                    grapesItem,
                                                                    r'''$.data.wines.edges[*].node.wineGrapes[*].grape.variety''',
                                                                    true,
                                                                  ) as List)
                                                                          .map<String>((s) =>
                                                                              s.toString())
                                                                          .toList()),
                                                                  'n/a',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Onest Cyr',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              'Onest Cyr'),
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  Container(
                                    width: 101.0,
                                    height: 31.0,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFF2F2F2),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(14.0),
                                        bottomRight: Radius.circular(14.0),
                                        topLeft: Radius.circular(14.0),
                                        topRight: Radius.circular(14.0),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 0.0, 4.0),
                                            child: Text(
                                              'Винодельня',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 12.0,
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
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Text(
                                              getJsonField(
                                                wineScreenGetWineDetailsVariableResponse
                                                    .jsonBody,
                                                r'''$.data.wines.edges[0].node.winery.name''',
                                              ).toString(),
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                      ],
                                    ),
                                  ),
                                  if (getJsonField(
                                        wineScreenGetWineDetailsVariableResponse
                                            .jsonBody,
                                        r'''$.data.wines.edges[0].node.brand.name''',
                                      ) !=
                                      null)
                                    Container(
                                      width: 109.0,
                                      height: 31.0,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFF2F2F2),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(14.0),
                                          bottomRight: Radius.circular(14.0),
                                          topLeft: Radius.circular(14.0),
                                          topRight: Radius.circular(14.0),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 0.0, 4.0),
                                              child: Text(
                                                'Производитель',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 12.0,
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
                                          if (getJsonField(
                                                wineScreenGetWineDetailsVariableResponse
                                                    .jsonBody,
                                                r'''$.data.wines.edges[0].node.brand.name''',
                                              ) !=
                                              null)
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: Text(
                                                  getJsonField(
                                                    wineScreenGetWineDetailsVariableResponse
                                                        .jsonBody,
                                                    r'''$.data.wines.edges[0].node.brand.name''',
                                                  ).toString(),
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                        ],
                                      ),
                                    ),
                                  Container(
                                    width: 109.0,
                                    height: 31.0,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFF2F2F2),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(14.0),
                                        bottomRight: Radius.circular(14.0),
                                        topLeft: Radius.circular(14.0),
                                        topRight: Radius.circular(14.0),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 0.0, 4.0),
                                            child: Text(
                                              'Страна, Регион',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 12.0,
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
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Text(
                                              getJsonField(
                                                wineScreenGetWineDetailsVariableResponse
                                                    .jsonBody,
                                                r'''$.data.wines.edges[0].node.country.name''',
                                              ).toString(),
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
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
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 145.0,
                                    height: 31.0,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFF2F2F2),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(14.0),
                                        bottomRight: Radius.circular(14.0),
                                        topLeft: Radius.circular(14.0),
                                        topRight: Radius.circular(14.0),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 0.0, 4.0),
                                            child: Text(
                                              'Аппеласьен',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 12.0,
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
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Text(
                                              getJsonField(
                                                wineScreenGetWineDetailsVariableResponse
                                                    .jsonBody,
                                                r'''$.data.wines.edges[0].node.appellation.name''',
                                              ).toString(),
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 91.0,
                                    height: 31.0,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFF2F2F2),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(14.0),
                                        bottomRight: Radius.circular(14.0),
                                        topLeft: Radius.circular(14.0),
                                        topRight: Radius.circular(14.0),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 0.0, 4.0),
                                            child: Text(
                                              'Крепость',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 12.0,
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
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Text(
                                              getJsonField(
                                                wineScreenGetWineDetailsVariableResponse
                                                    .jsonBody,
                                                r'''$.data.wines.edges[*].node.vintages.edges[0].node.abvMax''',
                                              ).toString(),
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                      ],
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 10.0)),
                              ),
                            ),
                          ].divide(const SizedBox(height: 20.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
