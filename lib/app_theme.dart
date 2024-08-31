import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppTheme{
  static const Color primary=Color(0xFF39A552);
  static const Color white=Color(0xFFFFFFFF);
  static const Color black=Color(0xFF303030);
  static const Color navy=Color(0xFF42505C);
  static const Color red=Color(0xFFC91C22);
  static const Color blue=Color(0xFF003E90);
  static const Color pink=Color(0xFFED1E79);
  static const Color brown=Color(0xFFCF7E48);
  static const Color cly=Color(0xFF4882CF);
  static const Color yollow=Color(0xFFF2D352);
  static ThemeData lightTheme=ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme:const AppBarTheme(
      backgroundColor: AppTheme.primary,
      foregroundColor: AppTheme.white,
      toolbarHeight: 80,
      shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32))),
      titleTextStyle: TextStyle(
        color: AppTheme.white,
        fontSize: 22,
        fontWeight: FontWeight.w400
      ),
      centerTitle: true
    ),
    textTheme:const TextTheme(
      titleLarge:TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: AppTheme.white)
    )
  ) ;

}