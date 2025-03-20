import 'package:flutter/material.dart';
import 'package:flutter_suite/flutter_suite.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound(this.url, {super.key});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.secondary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Page not found: $url', style: context.TxT.h1)],
        ),
      ),
    );
  }
}
