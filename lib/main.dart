import 'package:bullet24/Provider/my_provider.dart';
import 'package:bullet24/Provider/query_page_provider.dart';
import 'package:bullet24/Services/FireAuth%20Service/phone_auth.dart';
import 'package:bullet24/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Pages/Splash Page/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => QueryPageProvider())),
        ChangeNotifierProvider(create: ((context) => MyProvider())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const SplashPage(),
        // home: const SplashPage(),
      ),
    );
  }
}
