import 'dart:convert';
import 'package:flutter/services.dart';

class RedditPost {
  final String subreddit;
  final String imageUrl;
  final Post post;

  RedditPost({required this.subreddit, required this.imageUrl, required this.post});

  factory RedditPost.fromJson(Map<String, dynamic> json) {
    return RedditPost(
      subreddit: json['subreddit'],
      imageUrl: json['image_url'],
      post: Post.fromJson(json['post']),
    );
  }
}

class Post {
  final String title;
  final String author;
  final String postImage;
  final String time;
  final String upvotes;
  final String comments;
  final bool share;
  final bool image;
  final List<Comment>? commentsList;

  Post({
    required this.title,
    required this.author,
    required this.time,
    required this.upvotes,
    required this.comments,
    required this.postImage,
    required this.share,
    required this.image,
    this.commentsList,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
      author: json['author'],
      time: json['time'],
      upvotes: json['upvotes'],
      comments: json['comments'],
      postImage: json['post_image'],
      share: json['share'],
      image: json['image'] ?? false,
      commentsList: json['comments_list'] != null
          ? (json['comments_list'] as List)
          .map((comment) => Comment.fromJson(comment))
          .toList()
          : null,
    );
  }
}

class Comment {
  final String author;
  final String profilePicture;
  final String text;
  final List<Comment>? subComments;

  Comment({
    required this.author,
    required this.profilePicture,
    required this.text,
    this.subComments,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      author: json['author'],
      profilePicture: json['profile_picture'],
      text: json['text'],
      subComments: json['sub_comments'] != null
          ? (json['sub_comments'] as List)
          .map((subComment) => Comment.fromJson(subComment))
          .toList()
          : null,
    );
  }
}

