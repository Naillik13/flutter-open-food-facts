import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuka/res/app_images.dart';
import 'package:yuka/widgets/nutriscore_banner_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppImages.pancakes),
        Padding(
          padding: const EdgeInsets.only(top: 260.0),
          child: SingleChildScrollView(child: NutriscoreBannerWidget()),
        ),
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 40.0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Text 1',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  'Text 2',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red),
          Text('41'),
        ],
      ),
    );
  }
}

class ButtonRow extends StatelessWidget {
  const ButtonRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Button(
          icon: Icons.call,
          label: 'Call',
        ),
        Button(
          icon: Icons.navigation,
          label: 'Route',
        ),
        Button(
          icon: Icons.share,
          label: 'Share',
        ),
      ],
    );
  }
}

class Button extends StatelessWidget {
  final IconData icon;
  final String label;

  Button({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: () {
        print('Clic sur $label');
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(height: 10.0),
          Text(label, style: TextStyle(color: Colors.blue))
        ],
      ),
    );
  }
}
