import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yuka/blocs/product_history_bloc.dart';
import 'package:yuka/states/result_product_list_state.dart';

class ProductListDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: BlocBuilder<ProductsHistoryBloc, ProductsListState>(
          builder: (BuildContext context, ProductsListState state) {
        return ListView.builder(
          itemCount: state.history.length,
          itemBuilder: (BuildContext context, int position) {
            dynamic item = state.history[position];

            return Container(
              padding: const EdgeInsets.all(42.0),
              child: Text(
                '$position : ${item.barcode}',
              ),
            );
          },
        );
      }),
    );
  }
}
