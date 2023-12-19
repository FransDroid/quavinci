import 'package:flutter/material.dart';
import 'package:quavinci/src/screens/detail_screen.dart';
import '../models/redit_data_model.dart';
import '../utils/constants.dart';

class TrendingCardWidget extends StatelessWidget {
  // RedditPost instance representing the data for this card
  final RedditPost redditPost;

  // Constructor for the widget, receiving a RedditPost as a parameter
  const TrendingCardWidget({super.key, required this.redditPost});

  // Build method to create the widget UI
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(paddingAll),
      child: GestureDetector(
        // On Tap Event to push to Detail Screen
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailScreen(
                    redditPost: redditPost,
                  )),
        ),
        child: Card(
          surfaceTintColor: Colors.white,
          elevation: cardElevation,
          child: Padding(
            padding: const EdgeInsets.all(paddingAll),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row displaying subreddit information and author
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Subreddit and author details
                    Row(
                      children: [
                        CircleAvatar(
                          // Display author's image using a CircleAvatar
                          backgroundImage: NetworkImage(redditPost.imageUrl),
                          backgroundColor: Colors.transparent,
                        ),
                        const SizedBox(
                          width: gapBig,
                        ),
                        Text(redditPost.subreddit,
                            style:
                                const TextStyle(fontWeight: FontWeight.w700)),
                      ],
                    ),
                    // More options button
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.more_vert))
                  ],
                ),
                // Display post title
                Text(redditPost.post.title,
                    style: const TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: gapSmall,
                ),
                // Display post image if available
                Visibility(
                  visible: redditPost.post.postImage.isEmpty ? false : true,
                  child: Container(
                    height: containerHeightBig,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(borderRadius),
                        image: DecorationImage(
                            image: NetworkImage(redditPost.post.postImage),
                            fit: BoxFit.cover)),
                  ),
                ),
                const SizedBox(
                  height: gapSmall,
                ),
                // Display post author and time
                Text(
                  "$labelBy ${redditPost.post.author} . ${redditPost.post.time}",
                  style: const TextStyle(fontSize: textSizeSmall, color: Colors.grey),
                ),
                const SizedBox(
                  height: gapSmall,
                ),
                // Display voting and sharing options
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Voting options (upvote and downvote)
                    Row(
                      children: [
                        const Icon(
                          Icons.arrow_upward,
                          color: Colors.grey,
                          size: iconSize,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: paddingAllSmall, right: paddingAllSmall),
                          child: Text(redditPost.post.upvotes.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.grey)),
                        ),
                        const Icon(
                          Icons.arrow_downward,
                          color: Colors.grey,
                          size: iconSize,
                        ),
                      ],
                    ),
                    // Comment count
                    Row(
                      children: [
                        const Icon(
                          Icons.chat_bubble_outline,
                          color: Colors.grey,
                          size: iconSize,
                        ),
                        const SizedBox(
                          width: gapSmall,
                        ),
                        Text(redditPost.post.upvotes.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.grey)),
                      ],
                    ),
                    // Share option
                    const Row(
                      children: [
                        Icon(
                          Icons.share,
                          color: Colors.grey,
                          size: iconSize,
                        ),
                        SizedBox(
                          width: gapSmall,
                        ),
                        Text(labelShare,
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.grey)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
