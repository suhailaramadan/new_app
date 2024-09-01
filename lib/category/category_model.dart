import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final String imageName;
  final String id;
  final Color color;
  const CategoryModel({
    required this.id,
    required this.color,
    required this.imageName,
    required this.name
    });
}
