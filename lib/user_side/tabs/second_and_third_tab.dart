// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/providers.dart';
import '../components/footer.dart';
import '../components/item_container.dart';
import '../components/new_arrival_content_after_tabBarView.dart';
import 'first_tab_content_after_grid.dart';

class SecondAndThirdTab extends ConsumerWidget {
  final PageController controller;
  final String collectionName;

  const SecondAndThirdTab(
      {super.key, required this.controller, required this.collectionName});

  // bool _isSortedAscending = true;
  //
  // Future<void> _sortProducts(List<Product> products) async {
  //   setState(() {
  //     products.sort((a, b) => _isSortedAscending
  //         ? a.name.compareTo(b.name)
  //         : b.name.compareTo(a.name));
  //     _isSortedAscending = !_isSortedAscending;
  //   });
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsyncValue = ref.watch(productsProvider(collectionName));

    final _controller = PageController();
    // return StreamBuilder<List<Product>>(
    //     stream: _firebaseService.fetchPerCollection(widget.collectionName),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(child: CircularProgressIndicator());
    //       } else if (snapshot.hasError) {
    //         return Center(child: Text('Error: ${snapshot.error}'));
    //       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
    //         return Center(child: Text('Empty'));
    //       }
    //
    //       final products = snapshot.data!;
    return productsAsyncValue.when(
      data: (products) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            products.isEmpty
                                ? 'None'
                                : products.length == 1
                                    ? '1 Product'
                                    : '${products.length} Products',
                            style: TextStyle(
                              fontFamily: 'TenorSans',
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          // onTap: () => _sortProducts(products),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              shape: BoxShape.circle,
                            ),
                            width: 40,
                            height: 40,
                            child: Icon(
                              Icons.sort,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: double.infinity),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 350,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 16.0,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ItemContainer(item: products[index]);
                    },
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                ),
                First_tab_content_after_Grid(
                    controller: _controller, products: products),
                New_arrival_content_after_tabBarView(),
                SizedBox(height: 500, child: Footer()),
              ],
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }
}
