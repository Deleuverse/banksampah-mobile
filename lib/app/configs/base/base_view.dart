import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/widgets/loading.dart';
import '../resources/color.dart';
import 'base_controller.dart';

abstract class BaseView<Controller extends BaseController>
    extends GetView<Controller> {
  const BaseView({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Obx(
      () => controller.pageState.when(
        idle: () => _annotatedRegion(context),
        loading: _loading,
        data: (data) => _annotatedRegion(context),
        lostConnection: () => _annotatedRegion(context),
      ),
    );
  }

  Widget _annotatedRegion(context) => AnnotatedRegion(
        value: systemUiOverlayStyle() ?? SystemUiOverlayStyle.light,
        child: Material(
          color: materialColor() ?? Colors.white,
          child: _pageContent(context),
        ),
      );

  Widget _pageContent(context) => safeArea()
      ? SafeArea(
          bottom: bottomFalse() ?? true,
          child: _pageScaffold(context),
        )
      : _pageScaffold(context);

  Widget _pageScaffold(context) => Scaffold(
        extendBody: extendBody() ?? false,
        extendBodyBehindAppBar: extendBodyBehindAppBar() ?? false,
        key: scaffoldKey(),
        appBar: appBar(context),
        floatingActionButton: floatingActionButton(context),
        backgroundColor: backgroundColor(context) ?? ColorConfig.white,
        floatingActionButtonLocation: floatingActionButtonLocation(),
        bottomSheet: bottomSheet(),
        body: Stack(children: [
          Positioned.fill(
            child: backgroundImage() ?? const SizedBox(),
          ),
          hideKeyboardOnScroll()
              ? GestureDetector(
                  onPanDown: (_) {
                    // FocusScope.of(context).unfocus();
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.focusedChild?.unfocus();
                    }
                  },
                  child: body(context),
                )
              : body(context),
        ]),
        onDrawerChanged: onDrawerChanged,
        persistentFooterButtons: persistentFooterButtons(),
        bottomNavigationBar: bottomNavigationBar(context),
        drawer: drawer(),
        endDrawer: endDrawer(),
        resizeToAvoidBottomInset: resizeToAvoidBottomInset(),
      );

  // scaffold key
  GlobalKey<ScaffoldState>? scaffoldKey() => null;

  List<Widget>? persistentFooterButtons() => null;

  void onDrawerChanged(bool opened) {}

  SystemUiOverlayStyle? systemUiOverlayStyle() => const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark);

  Color? backgroundColor(context) => null;

  bool hideKeyboardOnScroll() => true;

  bool safeArea() => true;

  bool? extendBody() => null;

  bool? extendBodyBehindAppBar() => null;

  bool? bottomFalse() => null;

  bool resizeToAvoidBottomInset() => true;

  PreferredSizeWidget? appBar(context) => null;

  Widget body(BuildContext context);

  Color? materialColor() => null;

  Widget? drawer() => null;

  Widget? backgroundImage() => null;

  Widget? bottomSheet() => null;

  Widget? endDrawer() => null;

  Widget? bottomNavigationBar(context) => null;

  Widget? floatingActionButton(context) => null;

  FloatingActionButtonLocation? floatingActionButtonLocation() =>
      FloatingActionButtonLocation.endFloat;

  Widget _loading() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: LoadingWidget().fadingCube(),
      ),
    );
  }
}
