import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuka/app_colors.dart';
import 'package:yuka/app_icons.dart';
import 'package:yuka/res/app_vectorial_images.dart';

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
            headline6: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: AppColors.blue,
            ),
          ),
          backgroundColor: AppColors.white,
          actionsIconTheme: IconThemeData(color: AppColors.blue),
        ),
      ),
      home: EmptyListScreen(),
    );
  }
}

class EmptyListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Mes scans'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Icon(AppIcons.barcode),
              onPressed: () => {},
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppVectorialImages.illEmpty),
            SizedBox(height: screenHeight * 0.1),
            FractionallySizedBox(
                widthFactor: 0.3,
                child: Text(
                  'Vous  n\'avez pas encore scanné de produit',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.blue,
                    height: 1.4,
                    fontSize: 17.0,
                  ),
                )),
            SizedBox(height: screenHeight * 0.1),
            TextButton(
              onPressed: () => {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Commencer'.toUpperCase()),
                  const SizedBox(width: 20.0),
                  Icon(Icons.arrow_right_alt)
                ],
              ),
              style: OutlinedButton.styleFrom(
                primary: AppColors.blue,
                padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 22.0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(22.0))),
                backgroundColor: AppColors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
