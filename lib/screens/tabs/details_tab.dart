import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yuka/blocs/product_bloc.dart';
import 'package:yuka/res/app_images.dart';
import 'package:yuka/states/result_product_state.dart';
import 'package:yuka/widgets/product_details_widget.dart';

class DetailsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (BuildContext context, ProductState state) {
        if (state is ResultProductState) {
          return Stack(
            children: <Widget>[
              Image.asset(AppImages.pancakes),
              Padding(
                padding: const EdgeInsets.only(top: 260.0),
                child: ProductDetailsWidget(product: state.product),
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
