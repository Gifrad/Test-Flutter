import 'package:education/pages/choice/widget/grid_content.dart';
import 'package:flutter/material.dart';

import '../widget/my_clipper.dart';

class ChoicePage extends StatelessWidget {
  const ChoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: ClipPath(
              clipper: MyClipper(),
              child: Container(
                color: Colors.purple,
              ),
            ),
          ),
          Column(
            children: const [
              SizedBox(
                height: 150,
              ),
              Center(
                child: Text(
                  'Lorem ipsum',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 200),
            child: GridView.count(
              childAspectRatio: (0.05 / 0.035),
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: const [
                GridContent(),
                GridContent(),
                GridContent(),
                GridContent(),
                GridContent(),
                GridContent(),
                GridContent(),
                GridContent(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed,
        // elevation: 0,
        backgroundColor: Colors.white,
        // selectedItemColor: Colors.blue,
        // unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
              color: Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.contact_page,
              color: Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard_customize_outlined,
              color: Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.data_exploration_sharp,
              color: Colors.grey,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
