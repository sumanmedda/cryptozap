import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/const/const.dart';
import '../controller/logics/post_cubits/post_cubit.dart';
import '../controller/logics/post_cubits/post_state.dart';
import '../controller/widgets/custom_app_bar.dart';
import '../controller/widgets/custom_coin_details.dart';
import '../model/post_model.dart';

class MoreDetailsPage extends StatelessWidget {
  final PostModel data;
  const MoreDetailsPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: CustomAppBar(
            appBarText: data.name!,
          ),
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
                      CoinMoreData(
                        title: 'Price',
                        value: "\$${data.currentPrice.toString()}",
                      ),
                      CoinMoreData(
                        title: 'Market Cap',
                        value: data.marketCap.toString(),
                      ),
                      CoinMoreData(
                        title: '24hr Volume',
                        value: data.totalVolume.toString(),
                      ),
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
