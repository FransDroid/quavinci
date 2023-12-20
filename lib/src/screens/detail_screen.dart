import 'package:flutter/material.dart';

import '../models/redit_data_model.dart';
import '../utils/constants.dart';
import '../widgets/detail_card_widget.dart';

class DetailScreen extends StatefulWidget {
  final RedditPost redditPost;

  const DetailScreen({super.key, required this.redditPost});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              // Display author's image using a CircleAvatar
              CircleAvatar(
                // Display author's image using a CircleAvatar
                backgroundImage: NetworkImage(widget.redditPost.imageUrl),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(
                width: gapSmall,
              ),
              // Display author, time, and source with specific styles
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.redditPost.subreddit,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: textSizeBig)),
                  Text(
                    "$labelBy ${widget.redditPost.post.author} . ${widget.redditPost.post.time} . i.redd.it",
                    style: const TextStyle(
                        fontSize: textSizeSmall, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            // Join button with custom styling
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  side: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: borderWith,
                  ),
                ),
              ),
              child: Text(
                labelJoin.toUpperCase(),
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(
              width: gapBig,
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.all(paddingAll),
        child: Column(
          children: [
            Expanded(
              // Display Reddit post details using cardWidget
              child: cardWidget(widget.redditPost, context),
            ),
            // Comment input section
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(paddingAll),
                child: Row(
                  children: [
                    // Text input for adding comments
                    Expanded(
                        child: SizedBox(
                      height: containerHeightSmall,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: labelAddComments,
                          border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(borderRadius)),
                              borderSide: BorderSide(
                                  width: borderWith,
                                  color: Colors.grey.shade300)),
                        ),
                      ),
                    )),
                    const SizedBox(
                      width: gapBig,
                    ),
                    // Send button with custom styling
                    FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(borderRadiusSmall)),
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
