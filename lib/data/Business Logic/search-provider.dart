import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:github_tracker_application/data/Presentation/ui/repo-list.dart';


class SearchProvider extends ChangeNotifier {
  final TextEditingController searchcontroller = TextEditingController();
  String? errorText;

  void searchRepository(BuildContext context) {
    final input = searchcontroller.text.trim();
    final isValid = RegExp(r'^[a-zA-Z0-9_-]+/[a-zA-Z0-9_-]+$').hasMatch(input);

    if (isValid) {
      log('validated:${searchcontroller.text}');

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RepoList(reponame: searchcontroller.text)));
      // searchcontroller.clear();
    } else {
      errorText = 'Invalid format. Use owner/repository';
      notifyListeners();
    }
  }

  @override
  notifyListeners();
}
