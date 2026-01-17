import 'package:ecommerce/app.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:ecommerce/src/bloc/blocs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = BlocEcommerceObserver();
  runApp(const BlocEcommerceApp());
}
