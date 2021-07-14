import 'package:newsbook_app/models/category_class.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> allCategories = [];
  CategoryModel category;
  category = CategoryModel();
  category.name = "Business";
  category.imageURL =
      "https://www.edumilestones.com/career-library/images/business-mgt.png";
  allCategories.add(
    category,
  );
  category = CategoryModel();
  category.name = "Entertainment";
  category.imageURL =
      "https://alldatmatterz.com/uploads/2018/03/entertainment.jpg";
  allCategories.add(
    category,
  );
  category = CategoryModel();
  category.name = "Health";
  category.imageURL =
      "https://www.iit.edu/sites/default/files/2020-10/shwc-header-2400x1200.jpg";
  allCategories.add(
    category,
  );
  category = CategoryModel();
  category.name = "Science";
  category.imageURL =
      "https://s3-ap-south-1.amazonaws.com/blogmindler/bloglive/wp-content/uploads/2018/12/12163355/Pure-Science-Courses-After-Class-12th.png";
  allCategories.add(
    category,
  );
  category = CategoryModel();
  category.name = "Sports";
  category.imageURL =
      "https://www.bls.gov/spotlight/2017/sports-and-exercise/images/cover_image.jpg";
  allCategories.add(
    category,
  );
  category = CategoryModel();
  category.name = "Technology";
  category.imageURL =
      "https://d1v1e13ebw3o15.cloudfront.net/data/51518/pool_and_spa_master/..jpg";
  allCategories.add(
    category,
  );
  return allCategories;
}
