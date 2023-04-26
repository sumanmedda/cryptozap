import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/const/const.dart';
import '../controller/logics/internet_cubits/internet_cubits.dart';
import '../controller/logics/internet_cubits/internet_state.dart';
import '../controller/logics/post_cubits/post_cubit.dart';
import '../controller/logics/post_cubits/post_state.dart';
import '../controller/widgets/custom_app_bar.dart';
import '../controller/widgets/custom_coin_details.dart';
import '../controller/widgets/custom_text_widget.dart';

class MoreDetailsPage extends StatelessWidget {
  final int index;
  final String coinName;
  const MoreDetailsPage({
    super.key,
    required this.index,
    required this.coinName,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          appBarText: coinName,
        ),
        backgroundColor: colorBlack,
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
                        var path = postState.posts[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              // Reuseable widget for showing more information
                              CoinMoreData(
                                  title: "Price",
                                  value: '\$${path.currentPrice.toString()}'),
                              CoinMoreData(
                                  title: "Market Cap",
                                  value: path.marketCap.toString()),
                              CoinMoreData(
                                  title: "24hr Volume",
                                  value:
                                      path.priceChangePercentage24h.toString()),
                            ],
                          ),
                        );
                      }
                    }
                    if (internetState is InternetLostState) {
                      List<dynamic> post = db.get('posts');
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
                                  height:
                                      MediaQuery.of(context).size.height - 150,
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      CoinMoreData(
                                          title: "Price",
                                          value:
                                              '\$${post[index]['current_price'].toString()}'),
                                      CoinMoreData(
                                          title: "Market Cap",
                                          value: post[index]['market_cap']
                                              .toString()),
                                      CoinMoreData(
                                          title: "24hr Volume",
                                          value: post[index][
                                                  'price_change_percentage_24h']
                                              .toString()),
                                    ],
                                  ),
                                ),
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
