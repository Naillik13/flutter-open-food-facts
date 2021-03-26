// Bloc
import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yuka/blocs/events/list_products_event.dart';
import 'package:yuka/models/product_list_item.dart';
import 'package:yuka/states/result_product_list_state.dart';

class ProductsHistoryBloc extends Bloc<ProductsListEvent, ProductsListState> {
  ProductsHistoryBloc() : super(ResultProductsListState.empty()) {
    listHistory();
  }

  void listHistory() {
    add(ListProductsEvent());
  }

  @override
  Stream<ResultProductsListState> mapEventToState(
      ProductsListEvent event) async* {
    if (event is ListProductsEvent) {
      Client client = Client();

      client
          .setEndpoint(
              'https://appwrite.formation-flutter.fr/v1') // Your Appwrite Endpoint
          .setProject('6058693c4d6df') // Your project ID
          .setSelfSigned();

      try {
        await Account(client)
            .createSession(email: 'email@example.com', password: 'password');

        await client.init();

        Database database = Database(client);

        dynamic response = await database.listDocuments(
          collectionId: '605c9fa37267d',
        );

        List<ProductListItem> history =
            (response.data['documents'] as List<dynamic>)
                .map((dynamic el) => ProductListItem.fromAPI(el))
                .toList(growable: false);

        yield ResultProductsListState(history);
      } on AppwriteException catch (err) {
        log('ERROR - ${err.message}', level: 50, error: err);
      }
    }
  }
}
