import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'result_state.dart';

abstract class BaseController extends GetxController with WidgetsBindingObserver {
  final Rx<ResultState<dynamic>> _pageStateController = const ResultState.idle().obs;

  ResultState get pageState => _pageStateController.value;

  ResultState updatePageState(final ResultState state) => _pageStateController(state);

  ResultState showLoading() => updatePageState(const ResultState.loading());

  ResultState resetPageState() => updatePageState(const ResultState.idle());

  ResultState hideLoading() => resetPageState();

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    updatePageState(const ResultState.idle());
    super.onInit();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // onAppLifecycleState

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        onResume();
        break;
      case AppLifecycleState.inactive:
        onInactive();
        break;
      case AppLifecycleState.paused:
        onPause();
        break;
      case AppLifecycleState.detached:
        onDetached();
        break;
      case AppLifecycleState.hidden:
        onHidden();
        break;
    }
  }

  /// Called when the application is in the resume state.
  ///
  /// The resume state is when the application is visible and responsive.
  void onResume() {}

  /// Called when the application is in the pause state.
  ///
  /// The pause state is when the application is not currently visible to the user, not responding to user input, and running in the background.
  void onPause() {}

  /// Called when the application is in the inactive state.
  ///
  /// The inactive state is a transitional state between the pause state and the resume state.
  void onInactive() {}

  /// Called when the application is in the detached state.
  ///
  /// The detached state is when the application will end in a short period of time or is completely detached from the UI.
  void onDetached() {}

  /// Called when the application is in the hidden state.
  ///
  /// The hidden state is when the application is not visible to the user, does not respond to user input, and is running in the background.
  void onHidden() {}
}
