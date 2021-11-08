import 'package:flutter/material.dart';

import './dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = 'category-meals';

  /*Không dùng cái này nữa vì chuyển sang dùng named route*/
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    //Sửa 1 chút so với Code mẫu do có lỗi:
    //https://stackoverflow.com/questions/67659678/flutter-the-property-settings-cant-be-unconditionally-accessed-because-the
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    //danh sách các meal của category này
    final categoryMeals = DUMMY_MEALS.where((meal) {
      //Lấy về những meal mà trong list categories của nó có cái categoryId trên kia
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        //phải convert kiểu
        title: Text(categoryTitle as String),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
