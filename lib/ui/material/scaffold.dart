import 'package:edukit/ui/modules/bucket_screen/widgets/navigation_rail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_suite/flutter_suite.dart';
import 'package:go_router/go_router.dart';
import 'package:repositories/repositories.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final String? titleText;
  final Widget? title;
  final MainAxisAlignment? appBarAlignment;
  final MainAxisAlignment? bottomBarAlignment;
  final List<Widget>? appBarActions;
  final List<Widget>? bottomBarActions;
  final EdgeInsetsGeometry padding;
  const AppScaffold({
    super.key,
    this.titleText,
    this.title,
    required this.body,
    this.bottomBarActions,
    this.appBarActions,
    this.appBarAlignment,
    this.bottomBarAlignment,
    this.padding = const EdgeInsets.all(12.0),
  }) : assert(!(titleText != null && title != null));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: padding,
        child: Column(
          spacing: 12,
          children: [_appBar(context), Expanded(child: body), _bottomBar(context)],
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    if (titleText == null) return SizedBox.shrink();
    if (title != null) return title!;
    return Row(
      mainAxisAlignment: appBarAlignment ?? MainAxisAlignment.spaceBetween,
      spacing: 12,
      children: [
        Text(titleText!, style: Theme.of(context).textTheme.headlineMedium),
        ...?appBarActions,
      ],
    );
  }

  Widget _bottomBar(BuildContext context) {
    if (bottomBarActions?.isEmpty ?? true) return SizedBox.shrink();
    return Row(
      mainAxisAlignment: bottomBarAlignment ?? MainAxisAlignment.end,
      children: bottomBarActions!,
    );
  }
}
