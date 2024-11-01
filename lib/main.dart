import 'package:flutter/material.dart';
import 'package:form_demo/theme/theme.dart';

import 'common/pages/form_page.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final applicationTheme = ApplicationTheme();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: applicationTheme.lightTheme,
      home: const FormPage(),
    );
  }
}
