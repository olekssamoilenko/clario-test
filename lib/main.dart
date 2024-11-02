import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_demo/theme/theme.dart';

import 'common/pages/home_page.dart';
import 'common/widgets/global_bloc_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: const ApplicationTheme().light(),
      home: const GlobalBlocProvider(
        child: HomePage(),
      ),
    );
  }
}
