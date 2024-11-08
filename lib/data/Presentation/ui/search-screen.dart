import 'package:flutter/material.dart';
import 'package:github_tracker_application/data/Business%20Logic/search-provider.dart';
import 'package:provider/provider.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GitHub Issue Tracker App',
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Consumer<SearchProvider>(builder: (context, m, _) {
              return Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.27,
                decoration: BoxDecoration(
                    color: Colors.teal.shade100,
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: m.searchcontroller,
                        decoration: InputDecoration(
                          labelText: 'Enter Repository (owner/repo)',
                          errorText: m.errorText,
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          m.searchRepository(context);
                        },
                        child: Text('Search'),
                      ),
                    ],
                  ),
                ),
              );
            })),
      ),
    );
  }
}
