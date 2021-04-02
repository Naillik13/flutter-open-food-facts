import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yuka/blocs/product_bloc.dart';
import 'package:yuka/res/app_images.dart';
import 'package:yuka/states/result_product_state.dart';
import 'package:yuka/widgets/product_caracteristics_widget.dart';

class CaracteristicsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (BuildContext context, ProductState state) {
        if (state is ResultProductState) {
          return Stack(
            children: <Widget>[
              ImageWidget(picture: state.product.picture),
              Padding(
                padding: const EdgeInsets.only(top: 260.0),
                child: ProductCaracteristicsWidget(product: state.product),
              ),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String? picture;

  const ImageWidget({required this.picture});

  @override
  Widget build(BuildContext context) {
    if (picture != null) {
      return Image.network(picture!);
    } else {
      return Image.asset(AppImages.pancakes);
    }
  }
}
