import 'package:cryptozap/controller/logics/internet_cubits/internet_cubits.dart';
import 'package:cryptozap/controller/logics/post_cubits/post_cubit.dart';
import 'package:cryptozap/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'model/post_model.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('data');
  Hive.registerAdapter(PostModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostCubit>(
          create: (context) => PostCubit(),
        ),
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cryptozap',
        home: Homepage(),
      ),
    );
  }
}
