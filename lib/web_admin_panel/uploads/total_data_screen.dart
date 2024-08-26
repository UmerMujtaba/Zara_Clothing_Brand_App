import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TotalDataScreen extends StatefulWidget {
  const TotalDataScreen({super.key});

  @override
  State<TotalDataScreen> createState() => _TotalDataScreenState();
}

class _TotalDataScreenState extends State<TotalDataScreen> {
  Future<Map<String, int>> _fetchCollectionCounts() async {
    List<String> collections = [
      'Leather',
      'Dress',
      'Outer',
      'Glasses',
      'Hat',
      'Tshirts',
      'Fancy'
    ];
    Map<String, int> collectionCounts = {};

    for (String collection in collections) {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection(collection).get();
      collectionCounts[collection] = querySnapshot.size;
    }

    return collectionCounts;
  }

  Color _getColor(int index) {
    List<Color> colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.redAccent,
      Colors.purple,
      Colors.yellowAccent,
      Colors.cyan,
      Colors.pinkAccent
    ];
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'T O T A L  D A T A',
                        style: TextStyle(
                          fontFamily: 'TenorSans',
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                          child: FutureBuilder<Map<String, int>>(
                        future: _fetchCollectionCounts(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return const Center(
                                child: Text('Error fetching data'));
                          } else if (snapshot.hasData) {
                            Map<String, int> collectionCounts = snapshot.data!;
                            int _hoveredIndex = -1;

                            List<PieChartSectionData> pieSections =
                                collectionCounts.entries.map((entry) {
                              int index = collectionCounts.keys
                                  .toList()
                                  .indexOf(entry.key);
                              final isHovered = index == _hoveredIndex;
                              final double radius = 60;
                              final double fontSize = 13;

                              return PieChartSectionData(
                                color: _getColor(index),
                                value: entry.value.toDouble(),
                                title: '${entry.key}\n${entry.value}',
                                radius: radius,
                                titleStyle: TextStyle(
                                  fontFamily: 'TenorSans',
                                  fontSize: fontSize,
                                  color: Colors.black,
                                ),
                              );
                            }).toList();

                            return SingleChildScrollView(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 16),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [

                                        SizedBox(
                                          height: 200,
                                          child: PieChart(
                                            PieChartData(
                                              sections: pieSections,
                                              borderData:
                                                  FlBorderData(show: false),
                                              sectionsSpace: 2,
                                              centerSpaceRadius: 50,
                                              titleSunbeamLayout: true,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 24),
                                  // List of collections with item counts
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: collectionCounts.length,
                                          itemBuilder: (context, index) {
                                            String collectionName =
                                                collectionCounts.keys
                                                    .elementAt(index);
                                            int itemCount = collectionCounts
                                                .values
                                                .elementAt(index);
                                            return Container(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        8.0),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    collectionName,
                                                    style: const TextStyle(
                                                      fontFamily: 'TenorSans',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    '$itemCount items',
                                                    style: const TextStyle(
                                                      fontFamily: 'TenorSans',
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return const Center(
                                child: Text('No data available'));
                          }
                        },
                      ))
                    ]))));
  }
}
