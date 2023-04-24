import 'package:cryptozap/controller/logics/post_cubits/post_cubit.dart';
import 'package:cryptozap/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cryptozap',
        home: Homepage(),
      ),
    );
  }
}
