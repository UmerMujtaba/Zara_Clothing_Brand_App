// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/providers.dart';
import '../components/footer.dart';
import '../components/item_container.dart';
import '../components/new_arrival_content_after_tabBarView.dart';
import 'first_tab_content_after_grid.dart';

class FirstAndForthTab extends ConsumerWidget {
  final PageController controller;
  final List<String> collectionNames;

  const FirstAndForthTab({
    super.key,
    required this.controller,
    required this.collectionNames,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsyncValue =
        ref.watch(productsCombinedProvider(collectionNames));
    final isDarkBackground =
        Theme.of(context).colorScheme.surface.computeLuminance() < 0.5;
    // bool _isSortedAscending = true; // To toggle sorting
    //
    // Future<void> _sortProducts(List<Product> products) async {
    //   setState(() {
    //     products.sort((a, b) => _isSortedAscending
    //         ? a.name.compareTo(b.name)
    //         : b.name.compareTo(a.name));
    //     _isSortedAscending = !_isSortedAscending;
    //   });
    // }

    final _controller = PageController();

    return productsAsyncValue.when(
      data: (products) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          products.isEmpty
                              ? 'None'
                              : products.length == 1
                                  ? '1 Product'
                                  : '${products.length} Products',
                          style: TextStyle(
                            fontFamily: 'TenorSans',
                            color: Theme.of(context).colorScheme.inversePrimary,
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
                const SizedBox(height: 10),
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
                SizedBox(height: 10),
                First_tab_content_after_Grid(
                    controller: _controller, products: products),
                New_arrival_content_after_tabBarView(),
                SizedBox(height: 500, child: Footer()),
              ],
            ),
          ),
        );
      },
      loading: () {
        // Use a different color based on background
        final loaderColor = isDarkBackground ? Colors.white : Colors.black;

        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(loaderColor),
          ),
        );
      },
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }
}

extension on Color {
  bool get isDark {
    // Compute if the color is dark
    final brightness = this.computeLuminance();
    return brightness < 0.5;
  }
}
