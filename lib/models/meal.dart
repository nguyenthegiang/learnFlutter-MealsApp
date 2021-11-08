/*cái import này không cần thiết nữa do version mới thì
@required trở thành keyword và ko phải thuộc về flutter nữa*/

// import 'package:flutter/foundation.dart';

//Enum để lưu giữ các level độ khó của meal
enum Complexity {
  Simple,
  Challenging,
  Hard,
}

//Enum để lưu giữ các level giá cả của meal
enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final List<String> categories; //1 meal thuộc về nhiều category -> map theo ID
  final String title;
  final String imageUrl; //network images
  final List<String> ingredients; //nguyên liệu của meal
  final List<String> steps; //các bước tạo meal
  final int duration; //thời gian tạo meal
  final Complexity complexity; //độ khó
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.steps,
    required this.duration,
    required this.affordability,
    required this.complexity,
    required this.ingredients,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegetarian,
    required this.isVegan,
  });
}
