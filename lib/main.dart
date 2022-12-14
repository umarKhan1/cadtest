import 'package:cadtest/providers/get_cat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/get_local_cat_provider.dart';
import 'views/home_view/home_imports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GetLocalCatProvider>(
            create: (_) => GetLocalCatProvider()),
        ChangeNotifierProvider<GetResultProvider>(
            create: (_) => GetResultProvider()),
      ],
      child: MaterialApp(
        title: 'Cat Testing',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeView(),
      ),
    );
  }
}
