import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuka/app_colors.dart';
import 'package:yuka/screens/empty_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.blue,
        accentColor: AppColors.blueLight,
        primaryColorDark: AppColors.blueDark,
        appBarTheme: AppBarTheme(
          centerTitle: false,
          elevation: 0,
          textTheme: TextTheme(
              headline6: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: AppColors.blue)),
          backgroundColor: AppColors.white,
          actionsIconTheme: IconThemeData(color: AppColors.blue),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.blue,
          unselectedItemColor: AppColors.gray2,
        ),
      ),
      home: EmptyListScreen(),
    );
  }
}
