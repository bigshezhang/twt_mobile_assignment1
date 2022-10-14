import 'package:flutter/material.dart';
import 'package:twt_mobile_assignment1/you_can_edit_here/post.dart';

class PostCard extends StatefulWidget {
  final Post post;

  const PostCard(this.post, {Key? key}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child:Row(
              children: [
                Expanded(child:
                Row(
                  children: [
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.network("https://qnhdpic.twt.edu.cn/download/origin/" + widget.post.avatar),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.post.nickname,
                            style: TextStyle(
                              fontSize: 18
                            ),
                          ),
                          Text(widget.post.created_at.substring(0, 16)),
                        ],
                      ),
                    )
                  ],
                ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "#" + widget.post.id.toString(),
                  ),
                )
              ],
            ),
          ),
          Text(
              widget.post.title,
            textAlign: TextAlign.left,
          ),
          Text(
            widget.post.content,
            maxLines: 3,
          ),
          Offstage(
              offstage: widget.post.image_urls.isEmpty,
              child:
              SizedBox(
                height: 100,
                width: 200,
                child:
                Image.network(widget.post.image_urls.isNotEmpty  ? "https://qnhdpic.twt.edu.cn/download/origin/" + widget.post.image_urls.first : ""),
              )
          ),
          Column(
            children: [

            ],
          ),
          Divider(
            height: 10,
          )
        ],
      ),
    );
  }
}
