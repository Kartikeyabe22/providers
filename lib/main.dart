import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:providerPackage/home.dart';
import 'package:providerPackage/list_provider.dart';
import 'package:providerPackage/providers.dart';
void main(){
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>NumbersListProvider()),
        ChangeNotifierProvider(create: (context)=>MovieProviders())
      ],
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}
