import 'package:flutter/material.dart';
import 'package:hw_day8/Screen/dataScreen.dart';
import 'package:hw_day8/Screen/login.dart';
import 'package:hw_day8/Screen/signUp.dart';
import 'package:hw_day8/service/Database.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://zipmeoenudqdeuqsztaz.supabase.co", 
    anonKey: "sb_publishable_qblyd6yBy1RNiF8IewBIOg_BeTdV1BH");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen()
    );
  }
}
