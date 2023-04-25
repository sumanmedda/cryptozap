import 'package:cryptozap/controller/const/const.dart';
import 'package:cryptozap/controller/logics/post_cubits/post_cubit.dart';
import 'package:cryptozap/controller/logics/post_cubits/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/widgets/text_widget.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: colorTransparent,
              centerTitle: true,
              title: TextApp(
                text: 'C R Y P T O Z A P',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                textColor: colorWhite,
              )),
          backgroundColor: colorBlack,
          body: BlocConsumer<PostCubit, PostState>(
            listener: (context, state) {
              if (state is PostErrorState) {
                SnackBar snackBar = SnackBar(
                  content: Text(state.error),
                  backgroundColor: colorDanger,
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
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.posts.length,
                            itemBuilder: (context, index) {
                              var path = state.posts[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: colorWhite,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: ListTile(
                                    leading: SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(path.image!),
                                      ),
                                    ),
                                    title: TextApp(
                                      text: path.name!.toString(),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      textColor: colorBlack,
                                    ),
                                    subtitle: TextApp(
                                      text: path.tradeVolume24hBtc!.toString(),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                      textColor: colorBlack,
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                );
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
