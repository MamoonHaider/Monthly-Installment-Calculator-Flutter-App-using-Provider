import 'package:flutter/material.dart';
import 'package:installment_calculator/Providers/installmentScreenProvider.dart';

import 'Screens/installmentCulatorScreen.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InstallmentScreenPovider())
      ],
      child: MaterialApp(
         initialRoute: '/installmentPage',
        routes: {
          '/installmentPage': (context) => const InstallmentCalCulatorScreen(),
        },
      ),
    );
  }
}
