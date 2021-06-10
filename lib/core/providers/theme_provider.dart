import 'package:fetch_todos/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _customLightTheme;
  ThemeData _customDarkTheme;

  ThemeData _theme;
  ThemeData get theme => _theme;

  ThemeProvider() {
    setupCustomLightTheme();
    setupCustomDarkTheme();
    if (SchedulerBinding.instance.window.platformBrightness ==
        Brightness.dark) {
      _theme = _customDarkTheme;
      notifyListeners();
    }
  }

  onChangeApparience({@required Brightness brightness}) {
    if (brightness == Brightness.dark && _theme != _customDarkTheme) {
      _theme = _customDarkTheme;
      notifyListeners();
    } else if (brightness == Brightness.light && _theme != _customLightTheme) {
      _theme = _customLightTheme;
      notifyListeners();
    }
  }

  setupCustomLightTheme() {
    this._customLightTheme = ThemeData.light().copyWith(
      textTheme: ThemeData.light().textTheme.apply(
            fontFamily: 'CascadiaCode',
          ),
      primaryTextTheme: ThemeData.light().textTheme.apply(
            fontFamily: 'CascadiaCode',
          ),
      accentTextTheme: ThemeData.light().textTheme.apply(
            fontFamily: 'CascadiaCode',
          ),
      primaryColor: AppColors.primary,
      floatingActionButtonTheme: FloatingActionButtonThemeData().copyWith(
        backgroundColor: AppColors.acent,
      ),
    );
    _theme = _customLightTheme;
  }

  setupCustomDarkTheme() {
    this._customDarkTheme = ThemeData.dark().copyWith(
      primaryColor: Colors.purple[900],
    );
  }
}
