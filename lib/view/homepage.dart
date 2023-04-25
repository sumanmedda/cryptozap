import 'package:cryptozap/controller/const/const.dart';
import 'package:cryptozap/controller/logics/internet_cubits/internet_cubits.dart';
import 'package:cryptozap/controller/logics/post_cubits/post_cubit.dart';
import 'package:cryptozap/controller/logics/post_cubits/post_state.dart';
import 'package:cryptozap/view/all_list.dart';
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
        body: BlocBuilder<InternetCubit, InternetState>(
            builder: (context, internetState) =>
                BlocConsumer<PostCubit, PostState>(
                  listener: (context, postState) {
                    if (internetState is InternetLostState) {
                      SnackBar snackBar = SnackBar(
                        content: Text(internetState.error),
                        backgroundColor: colorDanger,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  builder: (context, postState) {
                    if (internetState is InternetGainedState) {
                      if (postState is PostLoadedState) {
                        return Column(
                          children: [
                            connectedWithData(postState, 8),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomButton(
                                height: 50,
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
                            ),
                          ],
                        );
                      }
                    }
                    if (internetState is InternetLostState) {
                      return db.get('posts') == null
                          ? Center(
                              child: CustomTextApp(
                                text: 'Internet Not Connected',
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                textColor: colorWhite,
                              ),
                            )
                          : Column(
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height -
                                        150,
                                    width: double.infinity,
                                    child: disConnectedData()),
                                Center(
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
                    return db.get('posts') == null
                        ? const Center(child: CircularProgressIndicator())
                        : disConnectedData();
                  },
                )),
      ),
    );
  }
}
