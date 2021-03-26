import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yuka/blocs/product_history_bloc.dart';
import 'package:yuka/states/result_product_list_state.dart';
import 'package:yuka/widgets/product_list_item_widget.dart';

class ProductListDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: BlocBuilder<ProductsHistoryBloc, ProductsListState>(
          builder: (BuildContext context, ProductsListState state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 42.0, vertical: 42.0),
          child: ListView.builder(
            itemCount: state.history.length,
            itemBuilder: (BuildContext context, int position) {
              dynamic item = state.history[position];

              return ProductListItemWidget(item: item);
            },
          ),
        );
      }),
    );
  }
}
