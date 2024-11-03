import 'package:flutter/material.dart';

import '../../web/features/fields/screens/web_fields_screen.dart';
import '../consts/color_consts.dart';

class HomePageWeb extends StatelessWidget {
  const HomePageWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: const Text('Clario Form Fields'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: SingleChildScrollView(
            child: WebFieldsScreen(),
          ),
        ),
      ),
    );
  }
}
