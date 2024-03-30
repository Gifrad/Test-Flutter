import 'package:education/services/location_service.dart';
import 'package:education/utils/appbar_clipper.dart';
import 'package:education/utils/local_storage.dart';
import 'package:flutter/material.dart';

import '../../utils/second_appbar_clipper copy.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  LocalStorage localStorage = LocalStorage();
  late LocationService locationService;
  @override
  void initState() {
    locationService = LocationService();
    locationService.handlePermission();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: ClipPath(
              clipper: AppBarClipper(),
              child: Container(
                color: Colors.amber[900],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: ClipPath(
              clipper: SecondAppBarClipper(),
              child: Container(
                color: Colors.amber[800],
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 170,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.08,
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.person,
                            size: 48,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Lorem Name',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                '@email.com',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/choice');
                            },
                            child: const Text('Click'),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.purple,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'Lorem ipsum',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Divider(
                        thickness: 2,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'Dolor sit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 2,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'Amet Dolor',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 2,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'Lorem',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 2,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'Ipsum',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 2,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'Dolor',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
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
        items: [
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                localStorage.removeLocalStorage();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              },
              child: const Icon(
                Icons.logout,
                color: Colors.grey,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/map');
              },
              child: const Icon(
                Icons.map,
                color: Colors.grey,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/contact-user');
              },
              child: const Icon(
                Icons.contact_page,
                color: Colors.grey,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/media');
              },
              child: const Icon(
                Icons.dashboard_customize_outlined,
                color: Colors.grey,
              ),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
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
