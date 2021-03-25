import 'package:appwrite/appwrite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yuka/singletons/network_manager.dart';
import 'package:yuka/states/result_product_state.dart';

import '../models/product.dart';
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
      Client client = Client();

      client
          .setEndpoint(
              'https://appwrite.formation-flutter.fr/v1') // Your Appwrite Endpoint
          .setProject('6058693c4d6df') // Your project ID
          .setSelfSigned();

      try {
        dynamic createSession = await Account(client)
            .createSession(email: 'email@example.com', password: 'password');

        await client.init();

        Database database = Database(client);

        await database.createDocument(
          collectionId: '605c9fa37267d',
          data: <String, String>{
            'Barcode': product.barcode,
            'Name': product.name ?? '',
            'Brand': product.brands![0],
            'Thumbnail': product.picture ?? '',
            'Nutriscore': product.nutriScore.toString(),
          },
          read: <String>['*'],
          write: <String>['*'],
        );
      } catch (err) {
        // print(err);
      }

      yield ResultProductState(product: product);
    }
  }
}
