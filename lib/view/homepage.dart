import 'dart:developer';

import 'package:cryptozap/controller/const/const.dart';
import 'package:cryptozap/controller/logics/internet_cubits/internet_cubits.dart';
import 'package:cryptozap/controller/logics/post_cubits/post_cubit.dart';
import 'package:cryptozap/controller/logics/post_cubits/post_state.dart';
import 'package:cryptozap/model/post_model.dart';
import 'package:cryptozap/view/all_list.dart';
import 'package:cryptozap/view/more_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/logics/internet_cubits/internet_state.dart';
import '../controller/widgets/custom_app_bar.dart';
import '../controller/widgets/custom_button.dart';
import '../controller/widgets/custom_text_widget.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorBlack,
        appBar: const CustomAppBar(
          appBarText: 'C R Y P T O Z A P',
        ),
        body: BlocBuilder<PostCubit, PostState>(
            builder: (context, postState) =>
                BlocConsumer<InternetCubit, InternetState>(
                  listener: (context, internetState) {
                    if (postState is PostErrorState) {
                      SnackBar snackBar = SnackBar(
                        content: Text(postState.error),
                        backgroundColor: colorDanger,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  builder: (context, internetState) {
                    // Loading State
                    if (internetState is InternetGainedState) {
                      if (postState is PostLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      // Loaded State
                      if (postState is PostLoadedState) {
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              connectedWithData(postState, 8),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomButton(
                                  width: 200,
                                  text: 'Show More',
                                  buttonColor: colorWhite,
                                  buttonTextColor: colorBlack,
                                  textIsBold: true,
                                  fontSize: 16,
                                  onTap: () {
                                    nextpage(context, const AllList());
                                  },
                                ),
                              )),
                            ],
                          ),
                        );
                      }
                    } else if (internetState is InternetLostState) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: db.get('posts') == null
                                ? Center(
                                    child: CustomTextApp(
                                      text: 'No Data Found',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      textColor: colorWhite,
                                    ),
                                  )
                                : ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: 8,
                                    itemBuilder: (context, index) {
                                      // PostModel path = postState.posts[index];
                                      log('message as ');
                                      List<PostModel> post = db.get('posts');

                                      var path = post[index];
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: colorWhite,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: ListTile(
                                            onTap: () {
                                              nextpage(context,
                                                  MoreDetailsPage(data: path));
                                            },
                                            leading: SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    colorTransparent,
                                                backgroundImage:
                                                    NetworkImage(path.image!),
                                              ),
                                            ),
                                            title: CustomTextApp(
                                              text: path.name!.toString(),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              textColor: colorBlack,
                                            ),
                                            subtitle: CustomTextApp(
                                              text: path.symbol!.toString(),
                                              fontWeight: FontWeight.normal,
                                              fontSize: 12,
                                              textColor: colorBlack,
                                            ),
                                            trailing: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CustomTextApp(
                                                  text:
                                                      '${path.priceChangePercentage24h!.toString()}%',
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12,
                                                  textColor:
                                                      path.priceChangePercentage24h
                                                                      .toString()[
                                                                  0] ==
                                                              "-"
                                                          ? colorDanger
                                                          : colorGreen,
                                                ),
                                                CustomTextApp(
                                                  text:
                                                      "\$${path.currentPrice!.toString()}",
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 15,
                                                  textColor: colorBlack,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: CustomTextApp(
                              text: 'Internet Not Connected',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              textColor: colorWhite,
                            ),
                          ),
                        ],
                      );
                    }

                    // Error State
                    return const Center(
                      child: Text("An Error Occured"),
                    );
                  },
                )),
      ),
    );
  }
}
