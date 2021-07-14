import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsbook_app/helpers/category_data.dart';
import 'package:newsbook_app/helpers/fetch_news.dart';
import 'package:newsbook_app/helpers/widgets.dart';
import 'package:newsbook_app/models/category_class.dart';
import 'package:newsbook_app/pages/category_news.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading;
  dynamic newsList;
  List<CategoryModel> categories = [];

  void getNews() async {
    FetchNews news = FetchNews();
    await news.getNews();
    newsList = news.news;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    isLoading = true;
    super.initState();
    categories = getCategories();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "News",
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 22,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            Text(
              "Book",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 22,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return CategoryCard(
                              imageURL: categories[index].imageURL,
                              name: categories[index].name,
                            );
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                        ),
                        child: ListView.builder(
                          itemCount: newsList.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return NewsTile(
                              imgURL: newsList[index].urlToImage ?? "",
                              author: newsList[index].author ?? "",
                              title: newsList[index].title ?? "",
                              description: newsList[index].description ?? "",
                              articleURL: newsList[index].articleURL ?? "",
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String imageURL;
  final String name;

  CategoryCard({
    this.imageURL,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CategoryNews(
                newsCategory: name.toLowerCase(),
              );
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          right: 10,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: imageURL,
                height: 70,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 70,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black26,
              ),
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
