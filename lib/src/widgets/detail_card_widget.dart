import 'package:flutter/material.dart';
import '../models/redit_data_model.dart';
import '../utils/constants.dart';
import 'details_comment_card_header_widget.dart';

Widget cardWidget(RedditPost redditPost, BuildContext context) {
  return CustomScrollView(slivers: <Widget>[
    //Displaying post details using Sliver Box Adapter
    SliverToBoxAdapter(
      child: Card(
        surfaceTintColor: Colors.white,
        elevation: cardElevation,
        child: Padding(
          padding: const EdgeInsets.all(paddingAll),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const Text(
                "$labelReward ",
                style: TextStyle(fontSize: textSizeSmall, color: Colors.grey),
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
                       Icon(
                        Icons.arrow_upward,
                        color: Theme.of(context).primaryColor,
                        size: textSizeBig,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: paddingAllSmall, right: paddingAllSmall),
                        child: Text(redditPost.post.upvotes.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color:Theme.of(context).primaryColor,)),
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
                              fontWeight: FontWeight.w800, color: Colors.grey)),
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
                              fontWeight: FontWeight.w800, color: Colors.grey)),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ),
    // Displaying comments using SliverList
    SliverList(
        delegate: SliverChildListDelegate([
      Card(
        surfaceTintColor: Colors.white,
        elevation: cardElevation,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(paddingAll),
            child: Column(
              children: [
                // Header for best comments section
                Row(
                  children: [
                    const Text(
                      labelBestComments,
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
                // ListView displaying comments
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: redditPost.post.commentsList?.length ?? 0,
                    itemBuilder: (_, index) {
                      return detailCommentCardHeader(
                          redditPost.post.commentsList![index],context);
                    }),
              ],
            ),
          ),
        ),
      )
    ])),
  ]);
}
