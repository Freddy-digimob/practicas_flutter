import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/app_bloc.dart';
import 'view/lista_widget.dart';
//import 'view/prueba.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ListaWidget(),
      ),
    );
  }
}
