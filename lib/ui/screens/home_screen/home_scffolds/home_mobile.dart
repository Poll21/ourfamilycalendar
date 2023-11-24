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
          padding: EdgeInsets.only(top: 60),
          child: Drawer(child: MyDrawer())),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.all(4),
            
              color: Colors.cyanAccent,
              child: Column(
                children: [
                  const Text('Планы на сегодня'),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                     return Container(
                       color: Colors.cyan,
                       margin: const EdgeInsets.all(4),
                       padding:const EdgeInsets.all(4),
                       height: 70,
                       child:  Text('$index'),
                     );
                    },),
                  )

                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: double.infinity,
              child: GridView.builder(
                  padding: const EdgeInsets.all(4),
                itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        color: Colors.deepPurple,
                       child: const Column(
                         children: [
                           Text('Севодня'),


                         ],
                       ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
