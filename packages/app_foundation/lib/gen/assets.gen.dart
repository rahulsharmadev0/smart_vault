/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/ai_chat.svg
  SvgGenImage get aiChat =>
      const SvgGenImage('assets/icon/ai_chat.svg', size: Size(24.0, 24.0));

  /// File path: assets/icon/delete.svg
  SvgGenImage get delete =>
      const SvgGenImage('assets/icon/delete.svg', size: Size(24.0, 24.0));

  /// File path: assets/icon/download.svg
  SvgGenImage get download =>
      const SvgGenImage('assets/icon/download.svg', size: Size(24.0, 24.0));

  /// File path: assets/icon/share.svg
  SvgGenImage get share =>
      const SvgGenImage('assets/icon/share.svg', size: Size(24.0, 24.0));

  /// List of all assets
  List<SvgGenImage> get values => [aiChat, delete, download, share];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/bg01.svg
  SvgGenImage get bg01 =>
      const SvgGenImage('assets/svg/bg01.svg', size: Size(700.0, 600.0));

  /// File path: assets/svg/doc.svg
  SvgGenImage get doc =>
      const SvgGenImage('assets/svg/doc.svg', size: Size(40.0, 40.0));

  /// File path: assets/svg/md.svg
  SvgGenImage get md =>
      const SvgGenImage('assets/svg/md.svg', size: Size(40.0, 40.0));

  /// File path: assets/svg/pdf.svg
  SvgGenImage get pdf =>
      const SvgGenImage('assets/svg/pdf.svg', size: Size(40.0, 40.0));

  /// File path: assets/svg/txt.svg
  SvgGenImage get txt =>
      const SvgGenImage('assets/svg/txt.svg', size: Size(40.0, 40.0));

  /// List of all assets
  List<SvgGenImage> get values => [bg01, doc, md, pdf, txt];
}

class Assets {
  const Assets._();

  static const String package = 'app_foundation';

  static const $AssetsIconGen icon = $AssetsIconGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  static const String package = 'app_foundation';

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    @Deprecated('Do not specify package for a generated library asset')
    String? package = package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/app_foundation/$_assetName';
}
