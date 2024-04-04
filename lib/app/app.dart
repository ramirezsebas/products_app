import 'package:flutter/material.dart';
import 'package:product_manager/app/core/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Material App',
      routerConfig: router,
    );
  }
}
