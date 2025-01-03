
import 'package:flutter/material.dart';

import 'home_form_old.dart';

class HomePageOld extends StatelessWidget {
  const HomePageOld({super.key});

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePageOld());
  }

  @override
  Widget build(BuildContext context) {
    return const HomeForm();
  }
}
