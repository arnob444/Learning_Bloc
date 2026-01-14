import 'package:ecommerce/app.dart';
import 'package:ecommerce/src/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = BlocEcommerceObserver();
  runApp(const BlocEcommerceApp());
}
