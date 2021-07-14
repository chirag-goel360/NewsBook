import 'package:flutter/material.dart';
import 'package:newsbook_app/helpers/fetch_news.dart';
import 'package:newsbook_app/helpers/widgets.dart';

class CategoryNews extends StatefulWidget {
  final String newsCategory;

  CategoryNews({
    this.newsCategory,
  });

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  dynamic newsList;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  void getNews() async {
    FetchNewsCategory newsForCategory = FetchNewsCategory();
    await newsForCategory.getNewsCategory(
      widget.newsCategory,
    );
    newsList = newsForCategory.news;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'News',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.blueGrey,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: 'Book',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 22,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                child: Container(
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  child: ListView.builder(
                    itemCount: newsList.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NewsTile(
                        author: newsList[index].author ?? "",
                        imgURL: newsList[index].urlToImage ?? "",
                        title: newsList[index].title ?? "",
                        description: newsList[index].description ?? "",
                        articleURL: newsList[index].articleURL ?? "",
                      );
                    },
                  ),
                ),
              ),
            ),
    );
  }
}
