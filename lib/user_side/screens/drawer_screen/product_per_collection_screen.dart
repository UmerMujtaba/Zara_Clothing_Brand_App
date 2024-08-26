// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/providers.dart';
import '../../components/app_bar.dart';
import '../../components/drawer.dart';
import '../../components/product_grid.dart';


class ProductPerCollectionPage extends ConsumerWidget {
  ProductPerCollectionPage({super.key, required this.collectionName});
  final String collectionName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsyncValue = ref.watch(productsProvider(collectionName));
    bool _isSortedAscending = ref.watch(isSortedAscendingProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppbar,
      drawer: MyTabbedDrawer(),
      body: productsAsyncValue.when(
        data: (products) {
          if (_isSortedAscending) {
            products.sort((a, b) => a.name.compareTo(b.name));
          } else {
            products.sort((a, b) => b.name.compareTo(a.name));
          }

          String productText = products.length == 1
              ? '1 Product'
              : '${products.length} Products';

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              productText,
                              style: TextStyle(fontFamily: 'TenorSans'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              ref.read(isSortedAscendingProvider.notifier).state = !_isSortedAscending;
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                shape: BoxShape.circle,
                              ),
                              width: 40,
                              height: 40,
                              child: const Icon(
                                Icons.sort,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ProductGrid(products: products),
                  ),
                ],
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
