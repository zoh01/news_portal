import 'package:news_portal/features/domain/models/category_models.dart';
import 'package:news_portal/utils/constants/image_strings.dart';

List<CategoryModel> getCategories(){
  List<CategoryModel> category = [];

  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryImage = ZohImages.business;
  categoryModel.categoryName = "Business";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryImage = ZohImages.technology;
  categoryModel.categoryName = "Technology";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryImage = ZohImages.entertainment;
  categoryModel.categoryName = "Entertainment";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryImage = ZohImages.science;
  categoryModel.categoryName = "Science";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryImage = ZohImages.sport;
  categoryModel.categoryName = "Sport";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

  return category;
}