import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoppingapp/presentation/screens/log_in.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool hiddenPassword = true;
  bool hiddenConfirmPassword = true;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _registerUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        if (userCredential.user != null) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Success'.tr()),
              content: Text('Account Created Successfully'.tr()),
              actions: [
                TextButton(
                  child: Text('OK'.tr()),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            LoginPage(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: LoginPage(),
                          );
                        },
                        transitionDuration: const Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }
      } on FirebaseAuthException catch (e) {
        _showSnackBar(e.message ?? 'An error occurred'.tr());
      }
    } else {
      _showSnackBar('Please correct the errors in the form'.tr());
    }
  }

  void changeLang() {
    if (context.locale == Locale('en', 'US')) {
      context.setLocale(Locale('ar', 'EG'));
    } else {
      context.setLocale(Locale('en', 'US'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.language,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      changeLang();
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/images/signup.png",
                  width: 200,
                  height: 200,
                ),
              ),
              Text('Welcome'.tr(),
                  style: TextStyle(fontSize: 36, fontFamily: 'Pacifico')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name cannot be empty'.tr();
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Name'.tr(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty'.tr();
                    }
                    if (!value.contains('@')) {
                      return 'Email must contain @'.tr();
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email'.tr(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password cannot be empty'.tr();
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters'.tr();
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Password'.tr(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(hiddenPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          hiddenPassword = !hiddenPassword;
                        });
                      },
                    ),
                  ),
                  obscureText: hiddenPassword,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password'.tr();
                    }
                    if (value != passwordController.text) {
                      return 'Passwords do not match'.tr();
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Confirm Password'.tr(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        hiddenConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          hiddenConfirmPassword = !hiddenConfirmPassword;
                        });
                      },
                    ),
                  ),
                  obscureText: hiddenConfirmPassword,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: MaterialButton(
                  height: 70,
                  color: Color(0xFFd6ccc2),
                  onPressed: _registerUser,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Color(0xFFd6ccc2), width: 1.0),
                  ),
                  child: Text(
                    'Sign Up'.tr(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: 'Pacifico'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            LoginPage(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: LoginPage(),
                          );
                        },
                        transitionDuration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Text(
                    'Already have an account? Log in'.tr(),
                    style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
