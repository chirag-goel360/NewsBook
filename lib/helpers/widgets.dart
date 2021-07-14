import 'package:flutter/material.dart';
import 'package:newsbook_app/pages/homepage_news.dart';

class NewsTile extends StatelessWidget {
  final String imgURL;
  final String title;
  final String author;
  final String description;
  final String articleURL;

  NewsTile({
    this.imgURL,
    this.description,
    this.title,
    this.articleURL,
    this.author,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return BriefInformation(
                postUrl: articleURL,
              );
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        width: size.width,
        child: Container(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
            ),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    imgURL,
                    height: 200,
                    width: size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      author == "" ? "" : "Author: " + author,
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
