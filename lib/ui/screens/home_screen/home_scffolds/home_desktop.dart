import 'package:flutter/material.dart';
import 'package:our_family_calendar/ui/screens/components_screens/my_drawer.dart';

class HomeDesktopScaffold extends StatefulWidget {
  const HomeDesktopScaffold({super.key});

  @override
  State<HomeDesktopScaffold> createState() => _HomeDesktopScaffoldState();
}

class _HomeDesktopScaffoldState extends State<HomeDesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: MyDrawer()),
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.all(4),
              color: Colors.cyanAccent,
              child: Column(
                children: [
                  Text('Планы на сегодня'),
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
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        color: Colors.deepPurple,
                        child: Column(
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