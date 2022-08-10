import 'package:elbrit_central/view_model/employee_data_view_model.dart';
import 'package:elbrit_central/views/home.dart';
import 'package:elbrit_central/views/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

var datosusuario;
var datosusuarioPhone;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LogInPage(),
      // home: HomePage(),
    );
  }
}

//keytool -list -v -keystore C:/Users/ASUS/upload-keystore.jks -alias upload
