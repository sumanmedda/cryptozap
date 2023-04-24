import 'package:cryptozap/controller/const/const.dart';
import 'package:cryptozap/controller/logics/post_cubits/post_cubit.dart';
import 'package:cryptozap/controller/logics/post_cubits/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: appBlack,
          body: BlocConsumer<PostCubit, PostState>(
            listener: (context, state) {
              if (state is PostErrorState) {
                SnackBar snackBar = SnackBar(
                  content: Text(state.error),
                  backgroundColor: appDanger,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            builder: (context, state) {
              // Loading State
              if (state is PostLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              // Loaded State
              if (state is PostLoadedState) {
                return ListView.builder(
                    itemCount: state.posts.length,
                    itemBuilder: (context, index) {
                      var path = state.posts[index];
                      return ListTile(
                        title: Text(path.symbol!.toString(),
                            style: TextStyle(color: Colors.white)),
                      );
                    });
              }

              // Error State
              return const Center(
                child: Text("An Error Occured"),
              );
            },
          )),
    );
  }
}
