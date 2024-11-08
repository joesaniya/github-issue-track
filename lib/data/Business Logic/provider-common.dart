import 'package:github_tracker_application/data/Business%20Logic/issue-provider.dart';
import 'package:github_tracker_application/data/Business%20Logic/search-provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


class ProviderHelperClass {
  static ProviderHelperClass? _instance;

  static ProviderHelperClass get instance {
    _instance ??= ProviderHelperClass();
    return _instance!;
  }

  List<SingleChildWidget> providerLists = [
   ChangeNotifierProvider(create: (context) => SearchProvider()),
    ChangeNotifierProvider(create: (context) => IssueProvider()),
  ];
}
