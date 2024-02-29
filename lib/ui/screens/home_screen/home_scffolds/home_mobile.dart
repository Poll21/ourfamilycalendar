import 'package:flutter/material.dart';

import 'package:our_family_calendar/ui/screens/components_screens/my_drawer.dart';

class HomeMobileScaffold extends StatefulWidget {
  const HomeMobileScaffold({super.key});

  @override
  State<HomeMobileScaffold> createState() => _HomeMobileScaffoldState();
}

class _HomeMobileScaffoldState extends State<HomeMobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Padding(
          padding: EdgeInsets.only(top: 60), child: Drawer(child: MyDrawer())),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 4,left: 4, right: 8,bottom: 4),
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).shadowColor,
                            offset: const Offset(1, 1)),
                      ],
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(12)),

                  width: 70,
                  child: Text('$index'),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).shadowColor,
                        offset: const Offset(1, 1)),
                  ],
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text('Планы на сегодня'),
                    Expanded(
                      child: ListView.builder(

                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Theme.of(context).shadowColor,
                                      offset: const Offset(1, 1)),
                                ],
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(12)),
                            margin: const EdgeInsets.all(4),
                            padding: const EdgeInsets.all(4),
                            height: 70,
                            child: Text('$index'),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
