import 'package:dashbord/Controller/myProvider.dart';
import 'package:dashbord/view/Login/loginScreen.dart';
import 'package:dashbord/view/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Dashbord());
}

class Dashbord extends StatelessWidget {
  const Dashbord({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => myProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          Home.id: (context) => const Home(),
          LoginScreen.id: (context) => const LoginScreen(),
        },
        home: const LoginScreen(),
      ),
    );
  }
}
