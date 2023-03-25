import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:newsity/utils/utils.dart';
import 'package:newsity/views/home_page.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _agreeToTerms = false;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _selectedCountryCode = '+91';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: DropdownButton<String>(
                            value: _selectedCountryCode,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedCountryCode = newValue.toString();
                              });
                            },
                            items: <String>[
                              '+91',
                              '+1',
                              '+44',
                              '+81',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: _phoneController,
                            decoration: const InputDecoration(
                              labelText: 'Phone Number',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: _agreeToTerms,
                          onChanged: (value) {
                            setState(() {
                              _agreeToTerms = value!;
                            });
                          },
                        ),
                        const Text('Agree to terms and conditions'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('Sign Up'),
              onPressed: () async {
                await Hive.openBox("auth");

                if (_emailController.value.text.isEmail) {
                  if (_passwordController.value.text.length > 6) {
                    if (_agreeToTerms == true) {
                      if (_phoneController.value.text.isPhoneNumber) {
                        if (_nameController.value.text.length > 2) {
                          box.putAll({
                            'name': _nameController.value.text,
                            'email': _emailController.value.text,
                            'country_code': _selectedCountryCode,
                            'phone_number': _phoneController.value.text,
                            'password': _passwordController.value.text
                          });
                          Get.snackbar('Sign up successful!',
                              'You can sign in now with the same credentials');
                        } else {
                          Get.snackbar('Alert',
                              'Name should be greater than 2 characters');
                        }
                      } else {
                        Get.snackbar('Alert', 'Enter a valid phone number');
                      }
                    } else {
                      Get.snackbar('Alert', 'Agree to terms and conditions');
                    }
                  } else {
                    Get.snackbar('Alert', 'Password should be strong');
                  }
                } else {
                  Get.snackbar('Alert', 'Check email and password fields');
                }
              },
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: const Text('Sign in with Google'),
                  onPressed: () {
                    Get.snackbar(
                      'Function not avaiable',
                      'This functionality hasn\'t been implemented yet',
                    );
                  },
                ),
                const SizedBox(width: 16.0),
                TextButton(
                  child: const Text('Sign in with Facebook'),
                  onPressed: () {
                    Get.snackbar(
                      'Function not avaiable',
                      'This functionality hasn\'t been implemented yet',
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 80.0,
            ),
          ],
        ),
      ),
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _agreeToTerms = false;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: _agreeToTerms,
                          onChanged: (value) {
                            setState(() {
                              _agreeToTerms = value!;
                            });
                          },
                        ),
                        const Text('Agree to terms and conditions'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('Sign In'),
              onPressed: () async {
                await Hive.openBox("auth");

                if (_emailController.value.text.isEmail) {
                  if (_passwordController.value.text.length > 6) {
                    if (_agreeToTerms == true) {
                      String email = box.get('email');
                      String password = box.get('password');
                      if (_emailController.value.text == email &&
                          _passwordController.value.text == password) {
                        Get.to(HomePage());
                      } else {
                        Get.snackbar('Error!', 'Incorrect user credentials');
                      }
                    } else {
                      Get.snackbar('Alert', 'Agree to terms and conditions');
                    }
                  } else {
                    Get.snackbar('Alert', 'Password should be strong');
                  }
                } else {
                  Get.snackbar('Alert', 'Check email and password fields');
                }
              },
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: const Text('Sign in with Google'),
                  onPressed: () {
                    Get.snackbar(
                      'Function not avaiable',
                      'This functionality hasn\'t been implemented yet',
                    );
                  },
                ),
                const SizedBox(width: 16.0),
                TextButton(
                  child: const Text('Sign in with Facebook'),
                  onPressed: () {
                    Get.snackbar(
                      'Function not avaiable',
                      'This functionality hasn\'t been implemented yet',
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 80.0,
            ),
          ],
        ),
      ),
    );
  }
}

class SignInSignUpScreen extends StatefulWidget {
  @override
  _SignInSignUpScreenState createState() => _SignInSignUpScreenState();
}

class _SignInSignUpScreenState extends State<SignInSignUpScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In/Sign Up'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(text: 'Sign Up'),
            Tab(text: 'Sign In'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          SignUpScreen(),
          SignInScreen(),
        ],
      ),
    );
  }
}
