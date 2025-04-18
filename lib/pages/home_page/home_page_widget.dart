import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
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
          child: Transform.scale(
            scaleX: 4.0,
            scaleY: 4.0,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              child: custom_widgets.AdvancedWebView(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                url:
                    'https://app.powerbi.com/view?r=eyJrIjoiYjgzYjMyMTEtNmE1MC00NWNhLWJkZGQtZjNmNDczN2VhM2QzIiwidCI6IjYxMWZiYjgyLTgxMDQtNDlmMy05YWRhLWRhOTgwMmI4YWZkYSIsImMiOjEwfQ%3D%3D',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
