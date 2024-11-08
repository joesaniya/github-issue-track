import 'package:flutter/material.dart';
import 'package:github_tracker_application/data/Business%20Logic/provider-common.dart';
import 'package:github_tracker_application/data/Presentation/ui/search-screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderHelperClass.instance.providerLists,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: const SearchScreen(),
      ),
    );
  }
}
