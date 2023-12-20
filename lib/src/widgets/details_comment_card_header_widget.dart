import 'package:flutter/material.dart';
import 'package:quavinci/src/models/redit_data_model.dart';

import '../utils/constants.dart';

Widget detailCommentCardHeader(Comment comment,BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: paddingAll, right: paddingAll),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // Display author's image using a CircleAvatar
            CircleAvatar(
              // Display author's image using a CircleAvatar
              backgroundImage: NetworkImage(comment.profilePicture),
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(
              width: gapBig,
            ),
            // Display author, time, and source with specific styles
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: gapBig,
                  ),
                  Text(
                    comment.author,
                    style: const TextStyle(
                        fontSize: textSizeSmall, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: gapBig,
                  ),
                  Text(comment.text)
                ],
              ),
            ),
            // More options button
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(
          width: gapBig,
        ),
        //Sub comment List view
        Padding(
          padding: const EdgeInsets.all(paddingBig),
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: comment.subComments?.length ?? 0,
              itemBuilder: (_, index) {
                return SizedBox(
                  height: containerHeightSmall,
                  child: Row(
                    children: [
                      // Sub comment Divider
                      const VerticalDivider(
                        thickness: borderWith,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: gapBig,
                      ),
                      // Display sub comment author's image using a CircleAvatar
                      CircleAvatar(
                        // Display author's image using a CircleAvatar
                        backgroundImage: NetworkImage(
                            comment.subComments![index].profilePicture),
                        backgroundColor: Colors.transparent,
                      ),
                      const SizedBox(
                        width: gapBig,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: gapBig,
                            ),
                            Text(
                              comment.subComments![index].author,
                              style: const TextStyle(
                                  fontSize: textSizeSmall, color: Colors.grey),
                            ),
                            const SizedBox(
                              height: gapBig,
                            ),
                            Flexible(
                              child: Text(
                                comment.subComments![index].text,
                                overflow: TextOverflow.clip,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
        // Reply Button option
        TextButton(
            onPressed: () {},
            child: Text(
              labelReply,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ))
      ],
    ),
  );
}
