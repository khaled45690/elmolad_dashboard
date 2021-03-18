import 'package:flutter/foundation.dart';

class ScreenSize with ChangeNotifier, DiagnosticableTreeMixin {
  double _screenSize;

  double get screenSize => _screenSize;

  set screenSize(double screenSizeParameter) {
    if (screenSizeParameter > 700) {
      _screenSize = 700;
    } else {
      _screenSize = screenSizeParameter;
    }
    notifyListeners();
  }
}
