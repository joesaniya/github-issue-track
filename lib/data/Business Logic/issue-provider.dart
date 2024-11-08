import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class IssueProvider extends ChangeNotifier {
  int page = 1;
  bool isLoading = false;
  bool hasMore = true;
  List<Map<String, dynamic>> issues = [];
  String? errorMessage;

  String sort = 'created';
  List<String> labels = [];

  final String token = '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';

  Future<void> fetchIssues(String repoName, String state) async {
    log('Fetching issues for repo: $repoName ===> State: $state');

    if (isLoading || !hasMore) return;

    if (issues.isEmpty || page == 1) {
      hasMore = true;
    }

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final dio = Dio();
      dio.options.headers['Authorization'] =
          'token $token'; // Add the token to the headers

      final response = await dio.get(
        'https://api.github.com/repos/$repoName/issues',
        queryParameters: {
          'state': state,
          'page': page,
          'per_page': 10,
          'sort': sort,
          'labels': labels.join(','),
        },
      );

      log('Fetched data from: ${response.requestOptions.uri}');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        if (data.isEmpty) {
          hasMore = false; // No more issues to load
        } else {
          issues.addAll(
            data.map((issue) => issue as Map<String, dynamic>).toList(),
          );
          page++;
          log('Issues fetched: $issues');
        }
      } else {
        hasMore = false;
        errorMessage = 'Failed to fetch issues: ${response.statusCode}';
      }
    } catch (e) {
      log('Failed to fetch issues: $e');
      errorMessage = 'Error fetching issues. Please try again later.';
      hasMore = false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void setSort(String newSort) {
    sort = newSort;
    notifyListeners();
  }

  void setLabels(List<String> newLabels) {
    labels = newLabels;
    notifyListeners();
  }
}
