import 'package:five_day_flutter/Pages/signup.dart';
import 'package:five_day_flutter/Pages/second.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.blue,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const MyHomePage(),
        '/signUp': (context) => const SignUp(),
        '/second': (context) => const SecondPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _signKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RegExp emailValid = RegExp(
      r"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _signKey,
        child: Column(
          //Simple Routes.
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     TextButton(
          //         onPressed: () {
          //           Navigator.of(context).push(MaterialPageRoute(
          //               builder: (context) => const FirstPage(name: "Varun")));
          //         },
          //         child: const Text("First Page")),
          //     TextButton(
          //         onPressed: () {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => const SecondPage()));
          //         },
          //         child: const Text("Second Page"))
          //   ],
          // ),

          //Named Routes.
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     TextButton(
          //         onPressed: () {
          //           Navigator.pushNamed(context, "/first");
          //         },
          //         child: const Text("First Page")),
          //     TextButton(
          //         onPressed: () async {
          //           final response = await Navigator.pushNamed(context, "/second",
          //               arguments: "Aspire");
          //           data = response.toString();
          //         },
          //         child: const Text("Second Page")),
          //     Text(data),
          //   ],
          // ),
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // const Image(
            //   image: AssetImage('assets/twitter.png'),
            //   width: 100,
            //   height: 100,
            // ),
            const FaIcon(
              FontAwesomeIcons.twitter,
              color: Colors.blue,
              size: 80,
              shadows: [Shadow(color: Colors.black)],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Login to Twitter",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30)),
              child: TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: "Enter your Email",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    border: InputBorder.none),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter your Email";
                  } else if (!emailValid.hasMatch(value)) {
                    //regular expression.
                    return "Please Enter a Valid Email";
                  }
                  return null;
                },
              ),
            ), //email

            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30)),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: "Enter Password",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    border: InputBorder.none),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter your Password";
                  } else if (value.length < 8) {
                    return "Password must be atleast 8 characters";
                  }
                  return null;
                },
              ),
            ), //password

            Container(
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(30)),
              child: TextButton(
                  onPressed: () {
                    if (_signKey.currentState!.validate()) {
                      debugPrint("Email: ${_emailController.text}");
                      debugPrint("Password: ${_passwordController.text}");
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
            ),

            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SignUp()));
              },
              child: const Text("Didn't have a account? Sign up here"),
            ),
          ],
        ),
      ),
    );
  }
}
