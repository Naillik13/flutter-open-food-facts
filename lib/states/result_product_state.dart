import '../models/product.dart';

abstract class ProductState {}

class ResultProductState extends ProductState {
  final Product product;

  ResultProductState({required this.product});
}
