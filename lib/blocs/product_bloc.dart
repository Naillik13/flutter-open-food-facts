import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yuka/singletons/network_manager.dart';
import 'package:yuka/states/result_product_state.dart';

import '../product.dart';
import 'events/fetch_product_event.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  static final Product initialProduct = Product(barcode: '');
  Product product = initialProduct;

  ProductBloc(String barcode)
      : super(ResultProductState(product: initialProduct)) {
    fetchProduct(barcode);
  }

  void fetchProduct(String barcode) {
    add(FetchProductEvent(barcode));
  }

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is FetchProductEvent) {
      NetworkManager networkManager = NetworkManager();
      Product product = await networkManager.fetchProduct(event.barcode);
      yield ResultProductState(product: product);
    }
  }
}
