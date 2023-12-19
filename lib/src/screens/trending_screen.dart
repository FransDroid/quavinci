import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:quavinci/src/models/redit_data_model.dart';

import '../utils/constants.dart';
import '../widgets/trending_card_widet.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  // Function to load Reddit posts from JSON
  Future<List<RedditPost>> loadRedditPosts() async {
    List<RedditPost> result = <RedditPost>[];
    // Load JSON string from assets
    String jsonString = await rootBundle.loadString('assets/data.json');
    // Decode JSON string into a map
    Map<String, dynamic> jsonData = json.decode(jsonString);
    // Loop through each entry in the 'trending' key and add to the result list
    for (final c in jsonData['trending']) {
      result.add(RedditPost.fromJson(c));
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
    // Load Reddit posts when the widget is initialized
    loadRedditPosts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Use FutureBuilder to handle the asynchronous loading of Reddit posts
      future: loadRedditPosts(),
      builder: (context, AsyncSnapshot<List<RedditPost>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Display a loading indicator while waiting for data
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Display an error message if there's an error loading the data
          return Text('$labelError: ${snapshot.error}');
        } else {
          // Extract the list of RedditPost objects from the snapshot data
          List<RedditPost> itemList = snapshot.data as List<RedditPost>;

          // Build the main UI using a Scaffold and ListView.builder
          return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  const Text(
                    labelTrending,
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  Container(
                    margin: const EdgeInsets.all(marginAll),
                    padding: const EdgeInsets.all(paddingAllSmall),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: borderWith, color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(borderRadiusSmall),
                    ),
                    child: const Icon(Icons.arrow_forward_ios_sharp,
                        size: iconSize),
                  )
                ],
              ),
            ),
            body: SizedBox(
              child: ListView.builder(
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  // Use the TrendingCardWidget to display each Reddit post
                  return TrendingCardWidget(
                    redditPost: itemList[index],
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
