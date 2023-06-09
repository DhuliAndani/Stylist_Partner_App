import 'dart:io';

import 'package:app/models/businessLayer/baseRoute.dart';
import 'package:app/models/businessLayer/global.dart' as global;
import 'package:app/models/expertModel.dart';
import 'package:app/models/shareSendPendingModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class WalletDetailScreen extends BaseRoute {
  final String name;
  final List<ShareSentPending> shareList;

  WalletDetailScreen(this.name, this.shareList, {a, o})
      : super(a: a, o: o, r: 'WalletDetailScreen');
  @override
  _WalletDetailScreenState createState() =>
      new _WalletDetailScreenState(this.shareList, this.name);
}

class _WalletDetailScreenState extends BaseRouteState {
  String name;
  List<ShareSentPending> shareList = [];
  GlobalKey<ScaffoldState> _scaffoldKey;

  Expert experts = new Expert();
  _WalletDetailScreenState(this.shareList, this.name) : super();

  @override
  Widget build(BuildContext context) {
    return sc(
      WillPopScope(
        onWillPop: () {
          Navigator.of(context).pop();
          return null;
        },
        child: Scaffold(
          bottomNavigationBar: (name ==
                      'Total Admin Share pending at Vendor') &&
                  (shareList.length > 0)
              ? Container(
                  margin:
                      EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      _paidToAdminConfirmationDialog(global.user.id);
                    },
                    child: Text(
                      AppLocalizations.of(context).btn_mask_as_paid,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                )
              : SizedBox(),
          body: Stack(
            children: [
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).primaryColor,
                          BlendMode.screen,
                        ),
                        child: Image.asset(
                          'assets/banner.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: Platform.isAndroid
                          ? EdgeInsets.only(bottom: 15, left: 10, top: 10)
                          : EdgeInsets.only(bottom: 15, left: 10, top: 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.keyboard_arrow_left_outlined,
                              color: Colors.black,
                            ),
                            Text(
                              AppLocalizations.of(context).lbl_back,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 17.5),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  margin: EdgeInsets.only(top: 80),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 30, bottom: 10),
                            child: Text(
                              '$name',
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .displaySmall,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            )),
                        shareList.length > 0
                            ? Expanded(
                                child: ListView.builder(
                                    itemCount: shareList.length,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Card(
                                          margin: EdgeInsets.only(top: 8),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: Get.width * 0.02,
                                                vertical: Get.height * 0.011),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${shareList[index].cart_id}',
                                                        style: Theme.of(context)
                                                            .primaryTextTheme
                                                            .titleSmall,
                                                      ),
                                                      Text(
                                                        '${shareList[index].mobile}',
                                                        style: Theme.of(context)
                                                            .primaryTextTheme
                                                            .titleMedium,
                                                      ),
                                                      Text(
                                                        '${shareList[index].service_date}',
                                                        style: Theme.of(context)
                                                            .primaryTextTheme
                                                            .titleMedium,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {},
                                                        child: Container(
                                                          height: Get.height *
                                                              0.035,
                                                          width:
                                                              Get.width * 0.32,
                                                          decoration: BoxDecoration(
                                                              color: shareList[index].statustext == "Pending"
                                                                  ? Colors.amber
                                                                  : shareList[index].statustext == "Completed"
                                                                      ? Colors.green[600]
                                                                      : shareList[index].statustext == "Cancelled"
                                                                          ? Colors.grey
                                                                          : shareList[index].statustext == "Payment Failed"
                                                                              ? Colors.red
                                                                              : shareList[index].statustext == "Confirmed"
                                                                                  ? Colors.blue[600]
                                                                                  : Colors.red,
                                                              borderRadius: BorderRadius.all(Radius.circular(5))),
                                                          child: Center(
                                                            child: Text(
                                                              '${shareList[index].statustext}',
                                                              style: Theme.of(
                                                                      context)
                                                                  .primaryTextTheme
                                                                  .headlineSmall
                                                                  .copyWith(
                                                                    color: Theme.of(
                                                                            context)
                                                                        .primaryTextTheme
                                                                        .headlineSmall
                                                                        .color
                                                                        .withOpacity(
                                                                            0.8),
                                                                  ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          top: 5,
                                                          bottom: 2,
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            SizedBox(
                                                              child: Container(
                                                                height:
                                                                    Get.height *
                                                                        0.035,
                                                                width:
                                                                    Get.width *
                                                                        0.151,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius: global
                                                                          .isRTL
                                                                      ? BorderRadius
                                                                          .only(
                                                                          topRight:
                                                                              new Radius.circular(5.0),
                                                                          bottomRight:
                                                                              new Radius.circular(5.0),
                                                                        )
                                                                      : BorderRadius
                                                                          .only(
                                                                          topLeft:
                                                                              new Radius.circular(5.0),
                                                                          bottomLeft:
                                                                              new Radius.circular(5.0),
                                                                        ),
                                                                  color: Colors
                                                                          .grey[
                                                                      350],
                                                                  border:
                                                                      new Border
                                                                          .all(
                                                                    color: Colors
                                                                            .grey[
                                                                        350],
                                                                  ),
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    '${shareList[index].paymentStatus}',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontSize:
                                                                            Get.height *
                                                                                0.016),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              height:
                                                                  Get.height *
                                                                      0.035,
                                                              width: Get.width *
                                                                  0.151,
                                                              child: Center(
                                                                child: Text(
                                                                  "${global.currency.currency_sign}${shareList[index].total_price}",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          Get.height *
                                                                              0.016),
                                                                ),
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius: global
                                                                        .isRTL
                                                                    ? BorderRadius
                                                                        .only(
                                                                        topLeft:
                                                                            new Radius.circular(5.0),
                                                                        bottomLeft:
                                                                            new Radius.circular(5.0),
                                                                      )
                                                                    : BorderRadius
                                                                        .only(
                                                                        topRight:
                                                                            new Radius.circular(5.0),
                                                                        bottomRight:
                                                                            new Radius.circular(5.0),
                                                                      ),
                                                                border:
                                                                    new Border
                                                                        .all(
                                                                  color: Colors
                                                                          .grey[
                                                                      350],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ));
                                    }),
                              )
                            : Container(
                                padding: EdgeInsets.only(
                                    top:
                                        MediaQuery.of(context).size.height / 3),
                                child: Text(
                                  AppLocalizations.of(context)
                                      .txt_nothing_yet_to_see_here,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .titleSmall,
                                ),
                              )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  _paidToAdmin(int vendorId) async {
    bool isConnected = await br.checkConnectivity();
    if (isConnected) {
      showOnlyLoaderDialog();
      await apiHelper.paidToAdmin(vendorId).then((result) {
        if (result.status == "1") {
          Navigator.of(context).pop();
          showSnackBar(key: _scaffoldKey, snackBarMessage: "${result.message}");
        } else {
          Navigator.of(context).pop();

          showSnackBar(key: _scaffoldKey, snackBarMessage: "${result.message}");
        }
      });
    } else {
      showNetworkErrorSnackBar(_scaffoldKey);
    }
  }

  Future _paidToAdminConfirmationDialog(vendorId) async {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(
              AppLocalizations.of(context).lbl_confirm_dialog,
            ),
            content: Text(AppLocalizations.of(context)
                .txt_confirmation_message_for_paid_to_admin),
            actions: [
              TextButton(
                child: Text(AppLocalizations.of(context).lbl_no),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text(AppLocalizations.of(context).lbl_yes),
                onPressed: () async {
                  Navigator.of(context).pop();
                  await _paidToAdmin(vendorId);
                },
              )
            ],
          );
        });
  }
}
