import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_page_model.dart';
export 'profile_page_model.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({super.key});

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  late ProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 261.0,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: FlutterFlowTheme.of(context).primaryText,
                      offset: const Offset(
                        0.0,
                        2.0,
                      ),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(24.0),
                              child: Image.network(
                                'https://kultovo.ru/images/login/background.png',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: SvgPicture.asset(
                                  'assets/images/Group.svg',
                                  width: 120.0,
                                  height: 120.0,
                                  fit: BoxFit.cover,
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
              Container(
                width: double.infinity,
                height: 48.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 8.0, 0.0),
                      child: Icon(
                        FFIcons.kloupe2,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 22.0,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                            hintText: 'Вино',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  color: const Color(0xFFAFB0B4),
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF5F5FA),
                            hoverColor: FlutterFlowTheme.of(context).alternate,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(1.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Отмена',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyLargeFamily,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
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
              Material(
                color: Colors.transparent,
                child: ListTile(
                  title: Text(
                    getJsonField(
                      mainPageGetAllDataResponse.jsonBody,
                      r'''$.data.tags.edges[1].node.name''',
                    ).toString(),
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Onest Cyr',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Onest Cyr'),
                        ),
                  ),
                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                  dense: false,
                  contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
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
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                      ),
                    );
                  }
                  final winesWeekWinesResponse = snapshot.data!;

                  return Container(
                    width: double.infinity,
                    height: 220.0,
                    decoration: const BoxDecoration(),
                    child: Stack(
                      children: [
                        Builder(
                          builder: (context) {
                            final winesList = WinesCall.nodes(
                                  winesWeekWinesResponse.jsonBody,
                                )?.toList() ??
                                [];

                            return ListView.separated(
                              padding: const EdgeInsets.symmetric(horizontal: 3.0),
                              primary: false,
                              scrollDirection: Axis.horizontal,
                              itemCount: winesList.length,
                              separatorBuilder: (_, __) => const SizedBox(width: 3.0),
                              itemBuilder: (context, winesListIndex) {
                                final winesListItem = winesList[winesListIndex];
                                return SizedBox(
                                  width: 172.0,
                                  height: 200.0,
                                  child: Stack(
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'WineScreen',
                                            queryParameters: {
                                              'slug': serializeParam(
                                                getJsonField(
                                                  winesListItem,
                                                  r'''$..node.slug''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );

                                          FFAppState().WineGastronomy =
                                              getJsonField(
                                            winesListItem,
                                            r'''$.node.vintages.edges[0].node.gastronomy''',
                                          ).toString();
                                          FFAppState().WinesYear = getJsonField(
                                            winesListItem,
                                            r'''$.node.vintages.edges[:].node.year''',
                                            true,
                                          )!
                                              .toList()
                                              .cast<int>();
                                          FFAppState().WinesRate = getJsonField(
                                            winesListItem,
                                            r'''$.node.vintages.edges[0].node.vintageRatings[:].score''',
                                            true,
                                          )!
                                              .toList()
                                              .cast<double>();
                                          FFAppState()
                                              .WinesImage = (getJsonField(
                                            winesListItem,
                                            r'''$.node.vintages.edges[0].node.vintageRatings[:].rating.labelThumbnail.medium''',
                                            true,
                                          ) as List)
                                              .map<String>((s) => s.toString())
                                              .toList()
                                              .toList()
                                              .cast<String>();
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFF5F5FA),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(28.0),
                                              bottomRight:
                                                  Radius.circular(28.0),
                                              topLeft: Radius.circular(28.0),
                                              topRight: Radius.circular(28.0),
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, -1.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Container(
                                                width: 160.0,
                                                height: 156.0,
                                                decoration: const BoxDecoration(
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
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(6.0, 13.0,
                                                                6.0, 13.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        '${FFAppState().graphQLimageURL}${getJsonField(
                                                          winesListItem,
                                                          r'''$.node.vintages.edges[0].node.images[0].image''',
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
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 170.0, 8.0, 0.0),
                                        child: Text(
                                          getJsonField(
                                            winesListItem,
                                            r'''$.node.name''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Onest Cyr',
                                                color: const Color(0xFF070707),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts:
                                                    GoogleFonts.asMap()
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
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Onest Cyr',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Onest Cyr'),
                        ),
                  ),
                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                  dense: false,
                  contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 72.0,
                decoration: const BoxDecoration(),
                child: Stack(
                  children: [
                    Builder(
                      builder: (context) {
                        final ratingsMain = GetAllDataCall.ratings(
                              mainPageGetAllDataResponse.jsonBody,
                            )?.toList() ??
                            [];

                        return ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 3.0),
                          primary: false,
                          scrollDirection: Axis.horizontal,
                          itemCount: ratingsMain.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 3.0),
                          itemBuilder: (context, ratingsMainIndex) {
                            final ratingsMainItem =
                                ratingsMain[ratingsMainIndex];
                            return SizedBox(
                              width: 98.0,
                              height: 72.0,
                              child: Stack(
                                children: [
                                  InkWell(
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
                                              ratingsMainItem,
                                              r'''$..node.slug''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFF5F5FA),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0),
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0),
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  13.0, 13.0, 13.0, 13.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              '${FFAppState().graphQLimageURL}${getJsonField(
                                                ratingsMainItem,
                                                r'''$..medium''',
                                              ).toString()}',
                                              fit: BoxFit.cover,
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
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Onest Cyr',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Onest Cyr'),
                        ),
                  ),
                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                  dense: false,
                  contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 222.0,
                decoration: const BoxDecoration(),
                child: Stack(
                  children: [
                    Builder(
                      builder: (context) {
                        final expertArcticles = GetAllDataCall.expertArticles(
                              mainPageGetAllDataResponse.jsonBody,
                            )?.toList() ??
                            [];

                        return ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 3.0),
                          primary: false,
                          scrollDirection: Axis.horizontal,
                          itemCount: expertArcticles.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 3.0),
                          itemBuilder: (context, expertArcticlesIndex) {
                            final expertArcticlesItem =
                                expertArcticles[expertArcticlesIndex];
                            return SizedBox(
                              width: 318.0,
                              child: Stack(
                                children: [
                                  InkWell(
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
                                              expertArcticlesItem,
                                              r'''$..node.slug''',
                                            ).toString(),
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFF5F5FA),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(28.0),
                                          bottomRight: Radius.circular(28.0),
                                          topLeft: Radius.circular(28.0),
                                          topRight: Radius.circular(28.0),
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, -1.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 0.0),
                                          child: Container(
                                            width: 306.0,
                                            height: 156.0,
                                            decoration: const BoxDecoration(
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
                                                topLeft: Radius.circular(28.0),
                                                topRight: Radius.circular(28.0),
                                              ),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                '${FFAppState().graphQLimageURL}${getJsonField(
                                                  expertArcticlesItem,
                                                  r'''$..medium''',
                                                ).toString()}',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 182.0, 8.0, 0.0),
                                    child: Text(
                                      getJsonField(
                                        expertArcticlesItem,
                                        r'''$..node.title''',
                                      ).toString(),
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Onest Cyr',
                                            color: const Color(0xFF070707),
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Onest Cyr'),
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
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Onest Cyr',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Onest Cyr'),
                        ),
                  ),
                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                  dense: false,
                  contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
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
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                      ),
                    );
                  }
                  final highRatingWinesWHighRatingWineResponse = snapshot.data!;

                  return Container(
                    width: double.infinity,
                    height: 220.0,
                    decoration: const BoxDecoration(),
                    child: Stack(
                      children: [
                        Builder(
                          builder: (context) {
                            final whighRatingWines = WHighRatingWineCall.nodes(
                                  highRatingWinesWHighRatingWineResponse
                                      .jsonBody,
                                )?.toList() ??
                                [];

                            return ListView.separated(
                              padding: const EdgeInsets.symmetric(horizontal: 3.0),
                              primary: false,
                              scrollDirection: Axis.horizontal,
                              itemCount: whighRatingWines.length,
                              separatorBuilder: (_, __) => const SizedBox(width: 3.0),
                              itemBuilder: (context, whighRatingWinesIndex) {
                                final whighRatingWinesItem =
                                    whighRatingWines[whighRatingWinesIndex];
                                return SizedBox(
                                  width: 172.0,
                                  height: 200.0,
                                  child: Stack(
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'WineScreen',
                                            queryParameters: {
                                              'slug': serializeParam(
                                                getJsonField(
                                                  whighRatingWinesItem,
                                                  r'''$.slug''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );

                                          FFAppState().WineGastronomy =
                                              getJsonField(
                                            whighRatingWinesItem,
                                            r'''$.vintages.edges[0].node.gastronomy''',
                                          ).toString();
                                          FFAppState().WinesYear = getJsonField(
                                            whighRatingWinesItem,
                                            r'''$.vintages.edges[:].node.year''',
                                            true,
                                          )!
                                              .toList()
                                              .cast<int>();
                                          FFAppState().WinesRate = getJsonField(
                                            whighRatingWinesItem,
                                            r'''$.vintages.edges[:].node.vintageRatings[0].score''',
                                            true,
                                          )!
                                              .toList()
                                              .cast<double>();
                                          FFAppState()
                                              .WinesImage = (getJsonField(
                                            whighRatingWinesItem,
                                            r'''$.vintages.edges[:].node.vintageRatings[0].rating.label''',
                                            true,
                                          ) as List)
                                              .map<String>((s) => s.toString())
                                              .toList()
                                              .toList()
                                              .cast<String>();
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFF5F5FA),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(28.0),
                                              bottomRight:
                                                  Radius.circular(28.0),
                                              topLeft: Radius.circular(28.0),
                                              topRight: Radius.circular(28.0),
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, -1.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Container(
                                                width: 160.0,
                                                height: 156.0,
                                                decoration: const BoxDecoration(
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
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(6.0, 13.0,
                                                                6.0, 13.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        '${FFAppState().graphQLimageURL}${getJsonField(
                                                          whighRatingWinesItem,
                                                          r'''$.vintages.edges[0].node.images[0].image''',
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
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 1.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 0.0, 16.0),
                                          child: Text(
                                            getJsonField(
                                              whighRatingWinesItem,
                                              r'''$.name''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Onest Cyr',
                                                  color: const Color(0xFF070707),
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
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
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Onest Cyr',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts:
                              GoogleFonts.asMap().containsKey('Onest Cyr'),
                        ),
                  ),
                  tileColor: FlutterFlowTheme.of(context).secondaryBackground,
                  dense: false,
                  contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 131.0,
                decoration: const BoxDecoration(),
                child: Stack(
                  children: [
                    Builder(
                      builder: (context) {
                        final russiaWinemaking =
                            GetAllDataCall.russiaWinemaking(
                                  mainPageGetAllDataResponse.jsonBody,
                                )?.toList() ??
                                [];

                        return ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 3.0),
                          primary: false,
                          scrollDirection: Axis.horizontal,
                          itemCount: russiaWinemaking.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 3.0),
                          itemBuilder: (context, russiaWinemakingIndex) {
                            final russiaWinemakingItem =
                                russiaWinemaking[russiaWinemakingIndex];
                            return SizedBox(
                              width: 242.0,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, -1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 4.0, 0.0, 0.0),
                                      child: InkWell(
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
                                                  russiaWinemakingItem,
                                                  r'''$..node.slug''',
                                                ).toString(),
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        child: Container(
                                          width: 242.0,
                                          height: 131.0,
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFFCFCFE),
                                                Color(0xFFE9EBEE)
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  0.0, -1.0),
                                              end: AlignmentDirectional(0, 1.0),
                                            ),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(28.0),
                                              bottomRight:
                                                  Radius.circular(28.0),
                                              topLeft: Radius.circular(28.0),
                                              topRight: Radius.circular(28.0),
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              '${FFAppState().graphQLimageURL}${getJsonField(
                                                russiaWinemakingItem,
                                                r'''$..medium''',
                                              ).toString()}',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 22.0, 8.0, 0.0),
                                    child: Text(
                                      getJsonField(
                                        russiaWinemakingItem,
                                        r'''$..node.title''',
                                      ).toString(),
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Onest Cyr',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Onest Cyr'),
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
            ].divide(const SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
