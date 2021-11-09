import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  late List<Meal> displayMeals;
  /*Mình cũng không cần cái loadInitData này vì khi dùng didChangeDependencies()
  thì mình không bị lỗi như code mẫu, nhưng cứ thêm vào thôi*/
  var _loadInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadInitData) {
      //Sửa 1 chút so với Code mẫu do có lỗi:
      //https://stackoverflow.com/questions/67659678/flutter-the-property-settings-cant-be-unconditionally-accessed-because-the
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];

      //danh sách các meal của category này
      displayMeals = widget.availableMeals.where((meal) {
        //Lấy về những meal mà trong list categories của nó có cái categoryId trên kia
        return meal.categories.contains(categoryId);
      }).toList();
    }

    _loadInitData = true;

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //phải convert kiểu
        title: Text(categoryTitle as String),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayMeals[index].id,
            title: displayMeals[index].title,
            imageUrl: displayMeals[index].imageUrl,
            affordability: displayMeals[index].affordability,
            complexity: displayMeals[index].complexity,
            duration: displayMeals[index].duration,
          );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}
