import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../model/post_model.dart';
import '../../view/more_details_page.dart';
import '../logics/post_cubits/post_state.dart';
import '../widgets/custom_text_widget.dart';

// Navigate To Next Page
nextpage(context, path) {
  Navigator.push(context, MaterialPageRoute(builder: ((context) => path)));
}

// Navigate To Back Page
backpage(context) {
  Navigator.pop(context);
}

// Colors

var colorBlack = const Color(0xFF050505);
var colorWhite = const Color(0xFFFFFFFF);
var colorDanger = Colors.red;
var colorGreen = Colors.green;
var colorTransparent = Colors.transparent;

// API Keys and Values
const mainHost = "https://api.coingecko.com/api/v3";

// local Storage

var db = Hive.box('data');

//if network is connected
Expanded connectedWithData(PostLoadedState postState, length) {
  return Expanded(
    flex: 9,
    child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: length,
        itemBuilder: (context, index) {
          PostModel path = postState.posts[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: colorWhite, borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                onTap: () {
                  nextpage(
                      context,
                      MoreDetailsPage(
                        coinName: path.name!,
                        index: index,
                      ));
                },
                leading: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircleAvatar(
                    backgroundColor: colorTransparent,
                    backgroundImage: NetworkImage(path.image!),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextApp(
                      text: '${path.priceChangePercentage24h!.toString()}%',
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      textColor:
                          path.priceChangePercentage24h.toString()[0] == "-"
                              ? colorDanger
                              : colorGreen,
                    ),
                    CustomTextApp(
                      text: "\$${path.currentPrice!.toString()}",
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
  );
}

// if Network is not connected
ListView disConnectedData() {
  return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 8,
      itemBuilder: (context, index) {
        List<dynamic> post = db.get('posts');
        var path = post[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: colorWhite, borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              onTap: () {
                nextpage(
                    context,
                    MoreDetailsPage(
                      coinName: path['name'],
                      index: index,
                    ));
              },
              leading: SizedBox(
                height: 30,
                width: 30,
                child: CircleAvatar(
                  backgroundColor: colorTransparent,
                  backgroundImage: NetworkImage(path['image']!),
                ),
              ),
              title: CustomTextApp(
                text: path['name']!.toString(),
                fontWeight: FontWeight.bold,
                fontSize: 15,
                textColor: colorBlack,
              ),
              subtitle: CustomTextApp(
                text: path['symbol']!.toString(),
                fontWeight: FontWeight.normal,
                fontSize: 12,
                textColor: colorBlack,
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextApp(
                    text: '${path['price_change_percentage_24h']!.toString()}%',
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    textColor:
                        path['price_change_percentage_24h'].toString()[0] == "-"
                            ? colorDanger
                            : colorGreen,
                  ),
                  CustomTextApp(
                    text: "\$${path['current_price']!.toString()}",
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    textColor: colorBlack,
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
