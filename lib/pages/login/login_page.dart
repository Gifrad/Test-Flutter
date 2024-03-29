import 'package:education/pages/widget/custom_form_field.dart';
import 'package:education/services/auth_services.dart';
import 'package:education/utils/appbar_clipper.dart';
import 'package:education/utils/local_storage.dart';
import 'package:education/utils/second_appbar_clipper%20copy.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LocalStorage localStorage = LocalStorage();
  ValueNotifier userCredential = ValueNotifier('');
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 130,
                  ),
                  const Center(
                    child: Text(
                      'Lorem ipsum',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const CustomFormField(title: 'Name'),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomFormField(title: 'Email'),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomFormField(title: 'Password'),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            activeColor: Colors.purple,
                            value: checkBoxValue,
                            onChanged: (newValue) {
                              setState(() {
                                checkBoxValue = newValue!;
                              });
                            },
                          ),
                          const Text(
                            'Remember',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'Lorem ipsum?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {
                        Navigator.pushNamed(context, '/contact');
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 4,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () async {
                        final account = await AuthService().signInWithGoogle();
                        if (account.user != null) {
                          localStorage.saveToLocalStorage(account.user!.email!);
                        }
                      },
                      child: const Text(
                        'Sign In With Google',
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        'Lorem ipsum dolor elit?',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'New Password',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.purple,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
