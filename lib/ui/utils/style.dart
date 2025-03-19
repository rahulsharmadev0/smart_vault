import 'package:flutter/material.dart';

@protected
class $TextTheme {
  final TextTheme _tt;

  @protected
  $TextTheme(this._tt);

  /// HeadlineSmall
  TextStyle? get h3 => _tt.headlineSmall;

  /// HeadlineMedium
  TextStyle? get h2 => _tt.headlineMedium;

  /// HeadlineLarge
  TextStyle? get h1 => _tt.headlineLarge;

  /// BodySmall
  TextStyle? get b3 => _tt.bodySmall;

  /// BodyMedium
  TextStyle? get b2 => _tt.bodyMedium;

  /// BodyLarge
  TextStyle? get b1 => _tt.bodyLarge;

  /// LabelSmall
  TextStyle? get l3 => _tt.labelSmall;

  /// LabelMedium
  TextStyle? get l2 => _tt.labelMedium;

  /// LabelLarge
  TextStyle? get l1 => _tt.labelLarge;

  /// TitleSmall
  TextStyle? get t3 => _tt.titleSmall;

  /// TitleMedium
  TextStyle? get t2 => _tt.titleMedium;

  /// TitleLarge
  TextStyle? get t1 => _tt.titleLarge;
}

@protected
class $TextSelectionThemeData {
  final TextSelectionThemeData _tstd;

  @protected
  $TextSelectionThemeData(this._tstd);

  /// CursorColor
  Color? get cursorColor => _tstd.cursorColor;

  /// SelectionColor
  Color? get color => _tstd.selectionColor;

  /// SelectionHandleColor
  Color? get handleColor => _tstd.selectionHandleColor;
}

class $Theme {
  static init(BuildContext context) {
    final tmp = _theme = Theme.of(context);
    _text = $TextTheme(tmp.textTheme);
    _primaryText = $TextTheme(tmp.primaryTextTheme);
    _textSelection = $TextSelectionThemeData(tmp.textSelectionTheme);
  }

  static ThemeData? _theme;

  /// Theme
  static ThemeData get data {
    assert(_theme != null, 'Theme is not initialized');
    return _theme!;
  }

  static $TextTheme? _text;

  /// Text
  static $TextTheme get text {
    assert(_text != null, 'Text is not initialized');
    return _text!;
  }

  static $TextTheme? _primaryText;

  /// PrimaryText
  static $TextTheme get primaryText {
    assert(_primaryText != null, 'PrimaryText is not initialized');
    return _primaryText!;
  }

  static $TextSelectionThemeData? _textSelection;

  /// TextSelection
  static $TextSelectionThemeData get textSelection {
    assert(_textSelection != null, 'TextSelection is not initialized');
    return _textSelection!;
  }
}

class FlutterSuiteInjecter extends StatefulWidget {
  final Widget child;

  const FlutterSuiteInjecter({super.key, required this.child});

  @override
  State<FlutterSuiteInjecter> createState() => _FlutterSuiteInjecterState();
}

class _FlutterSuiteInjecterState extends State<FlutterSuiteInjecter> {
  @override
  void initState() {
    $Theme.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
