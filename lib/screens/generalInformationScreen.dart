import 'dart:io';

import 'package:app/models/businessLayer/baseRoute.dart';
import 'package:app/models/businessLayer/global.dart' as global;
import 'package:app/models/businessLayer/global.dart';
import 'package:app/models/partnerUserModel.dart';
import 'package:app/screens/signInScreen.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GeneralInformationScreen extends BaseRoute {
  final String email;
  final String password;
  GeneralInformationScreen(this.email, this.password, {a, o})
      : super(a: a, o: o, r: 'GeneralInformationScreen');
  @override
  _GeneralInformationScreenState createState() =>
      new _GeneralInformationScreenState(this.email, this.password);
}

class _GeneralInformationScreenState extends BaseRouteState {
  String email;
  String password;
  CurrentUser user = new CurrentUser();
  TextEditingController _cVenderName = new TextEditingController();
  TextEditingController _cOwnerName = new TextEditingController();
  TextEditingController _cPhoneNumber = new TextEditingController();
  TextEditingController _cAddress = new TextEditingController();
  TextEditingController _cDescription = new TextEditingController();
  File _tImage;
  var _fOwnerName = new FocusNode();
  var _fPhoneNumber = new FocusNode();
  var _fAddress = new FocusNode();
  var countryCode = '966';
  Widget _buildDropdownItem(Country country) => Container(
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            SizedBox(
              width: 8.0,
            ),
            Text("+${country.phoneCode}(${country.isoCode})"),
          ],
        ),
      );

  GlobalKey<ScaffoldState> _scaffoldKey;
  int _saloonType = 2;

  var dropdownval;

  _GeneralInformationScreenState(this.email, this.password) : super();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.of(context).pop();
          return null;
        },
        child: sc(
          Scaffold(
            resizeToAvoidBottomInset: false,
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
                        child: Column(children: [
                          Container(
                              margin: EdgeInsets.only(top: 30, bottom: 10),
                              child: Text(
                                AppLocalizations.of(context)
                                    .lbl_generall_information,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .displaySmall,
                              )),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 15,
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)
                                          .lbl_parlour_name,
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .titleSmall,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: TextFormField(
                                        textCapitalization:
                                            TextCapitalization.words,
                                        onEditingComplete: () {
                                          FocusScope.of(context)
                                              .requestFocus(_fOwnerName);
                                        },
                                        controller: _cVenderName,
                                        decoration: InputDecoration(
                                          hintText: AppLocalizations.of(context)
                                              .hnt_parlour_name,
                                          contentPadding:
                                              EdgeInsets.only(top: 5, left: 10),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      AppLocalizations.of(context)
                                          .lbl_owner_name,
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .titleSmall,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: TextFormField(
                                        textCapitalization:
                                            TextCapitalization.words,
                                        onEditingComplete: () {
                                          FocusScope.of(context)
                                              .requestFocus(_fPhoneNumber);
                                        },
                                        focusNode: _fOwnerName,
                                        controller: _cOwnerName,
                                        decoration: InputDecoration(
                                          hintText: AppLocalizations.of(context)
                                              .hnt_owner_name,
                                          contentPadding:
                                              EdgeInsets.only(top: 5, left: 10),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      AppLocalizations.of(context)
                                          .lbl_phone_number,
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .titleSmall,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Row(children: [
                                        CountryPickerDropdown(
                                          initialValue: 'SA',
                                          itemBuilder: _buildDropdownItem,
                                          priorityList: [
                                            CountryPickerUtils
                                                .getCountryByIsoCode('GB'),
                                            CountryPickerUtils
                                                .getCountryByIsoCode('CN'),
                                          ],
                                          sortComparator: (Country a,
                                                  Country b) =>
                                              a.isoCode.compareTo(b.isoCode),
                                          onValuePicked: (Country country) {
                                            setState(() {
                                              countryCode = country.phoneCode;
                                              print(country.phoneCode);
                                            });
                                            print("${country.name}");
                                          },
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          child: TextFormField(
                                            keyboardType:
                                                TextInputType.numberWithOptions(
                                                    signed: true,
                                                    decimal: true),
                                            onEditingComplete: () {
                                              FocusScope.of(context).unfocus();
                                            },
                                            focusNode: _fPhoneNumber,
                                            controller: _cPhoneNumber,
                                            decoration: InputDecoration(
                                              hintText:
                                                  AppLocalizations.of(context)
                                                      .hnt_phone_number,
                                              contentPadding: EdgeInsets.only(
                                                  top: 5, left: 10),
                                            ),
                                          ),
                                        ),
                                      ]),

                                      // TextFormField(
                                      //   keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                                      //   onEditingComplete: () {
                                      //     FocusScope.of(context).unfocus();
                                      //   },
                                      //   focusNode: _fPhoneNumber,
                                      //   controller: _cPhoneNumber,
                                      //   decoration: InputDecoration(
                                      //     hintText: AppLocalizations.of(context).hnt_phone_number,
                                      //     contentPadding: EdgeInsets.only(top: 5, left: 10),
                                      //   ),

                                      // ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .lbl_address,
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .titleSmall,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: TextFormField(
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        focusNode: _fAddress,
                                        controller: _cAddress,
                                        maxLines: 3,
                                        decoration: InputDecoration(
                                          hintText: AppLocalizations.of(context)
                                              .hnt_address,
                                          contentPadding: EdgeInsets.only(
                                              top: 10, left: 10),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .lbl_saloon_type,
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .titleSmall,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Row(
                                        children: [
                                          Row(
                                            children: [
                                              Radio(
                                                  value: 1,
                                                  groupValue: _saloonType,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      _saloonType = val;
                                                    });
                                                  }),
                                              Text(AppLocalizations.of(context)
                                                  .lbl_male)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Radio(
                                                  value: 2,
                                                  groupValue: _saloonType,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      _saloonType = val;
                                                    });
                                                  }),
                                              Text(AppLocalizations.of(context)
                                                  .lbl_female)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Radio(
                                                  value: 3,
                                                  groupValue: _saloonType,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      _saloonType = val;
                                                    });
                                                  }),
                                              Text(AppLocalizations.of(context)
                                                  .lbl_unisex)
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .lbl_description,
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .titleSmall,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: TextFormField(
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        controller: _cDescription,
                                        maxLines: 3,
                                        decoration: InputDecoration(
                                          hintText: AppLocalizations.of(context)
                                              .hnt_description,
                                          contentPadding: EdgeInsets.only(
                                              top: 10, left: 10),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .lbl_upload_image,
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .titleSmall,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Stack(
                                              alignment: AlignmentDirectional
                                                  .bottomEnd,
                                              children: [
                                                CircleAvatar(
                                                  radius: 50,
                                                  backgroundImage: _tImage !=
                                                          null
                                                      ? FileImage(_tImage)
                                                      : AssetImage(
                                                          'assets/userImage.png'),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    _showCupertinoModalSheet();
                                                  },
                                                  child: CircleAvatar(
                                                    radius: 20,
                                                    child: Icon(Icons.image),
                                                  ),
                                                )
                                              ]),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      margin: EdgeInsets.only(top: 25),
                                      width: MediaQuery.of(context).size.width,
                                      child: TextButton(
                                        onPressed: () {
                                          FocusScope.of(context).unfocus();
                                          signUp();
                                        },
                                        child: Text(
                                          AppLocalizations.of(context)
                                              .btn_create_account,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 25),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)
                                                .txt_already_have_an_account,
                                            style: Theme.of(context)
                                                .primaryTextTheme
                                                .titleSmall,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SignInScreen(
                                                            a: widget.analytics,
                                                            o: widget.observer,
                                                          )));
                                            },
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .btnSignIn,
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .displayLarge,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ]))),
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  signUp() async {
    String deviceId = await getDeviceId();
    print("user.device_id-----${deviceId}");
    try {
      user.vendor_email = email;
      var fullPhoneNumber = "+" + countryCode + _cPhoneNumber.text.trim();
      print(fullPhoneNumber);
      user.vendor_password = password;
      user.vendor_address = _cAddress.text.trim();
      user.vendor_name = _cVenderName.text.trim();
      user.vendor_phone = fullPhoneNumber;
      user.description = _cDescription.text.trim();
      user.owner_name = _cOwnerName.text.trim();

      if (_saloonType != null) {
        if (_saloonType == 1) {
          user.type = _saloonType.toString();
        } else if (_saloonType == 2) {
          user.type = _saloonType.toString();
        } else {
          user.type = _saloonType.toString();
        }
      }

      debugPrint("user.type----${user.type}");
      user.vendor_image = _tImage;

      user.device_id = global.appDeviceId;
      if (_cVenderName.text.isNotEmpty &&
          _cPhoneNumber.text.isNotEmpty &&
          fullPhoneNumber.length < 20 &&
          _cOwnerName.text.isNotEmpty &&
          _cAddress.text.isNotEmpty &&
          _cDescription.text.isNotEmpty &&
          _tImage != null) {
        bool isConnected = await br.checkConnectivity();
        if (isConnected) {
          showOnlyLoaderDialog();

          // var data = await APIHelper().loginApis();
          //
          // if(data != null){
          //   log("API CALL DONE-------${data}");
          // }

          debugPrint("user.type----${user.type}");
          debugPrint("user.vendor_name----${user.vendor_name}");
          debugPrint("user.owner_name----${user.owner_name}");
          debugPrint("user.vendor_email----${user.vendor_email}");
          debugPrint("user.vendor_password----${user.vendor_password}");
          debugPrint("deviceId----${deviceId}");
          debugPrint("user.vendor_phone----${user.vendor_phone}");
          debugPrint("user.vendor_address----${user.vendor_address}");
          debugPrint("user.description----${user.description}");
          debugPrint("_tImage----${_tImage}");

          await apiHelper
              .signUp(
                  type: user.type,
                  vendor_name: user.vendor_name,
                  owner_name: user.owner_name,
                  vendor_email: user.vendor_email,
                  vendor_password: user.vendor_password,
                  device_id: deviceId,
                  vendor_phone: user.vendor_phone,
                  vendor_address: user.vendor_address,
                  description: user.description,
                  vendor_image: _tImage)
              .then((result) {
            if (result.status == "1") {
              user = result.recordList;
              global.user = result.recordList;
              br.saveUser(user);
              hideLoader();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => SignInScreen(
                    a: widget.analytics,
                    o: widget.observer,
                  ),
                ),
              );
            } else {
              hideLoader();
              showSnackBar(
                  key: _scaffoldKey, snackBarMessage: '${result.message}');
            }
          });
        } else {
          showNetworkErrorSnackBar(_scaffoldKey);
        }
      } else if (_cVenderName.text.isEmpty) {
        showSnackBar(
            key: _scaffoldKey,
            snackBarMessage:
                AppLocalizations.of(context).txt_please_enter_parlour_name);
      } else if (_cPhoneNumber.text.isEmpty) {
        showSnackBar(
            key: _scaffoldKey,
            snackBarMessage:
                AppLocalizations.of(context).txt_please_enter_phone_number);
      } else if (_cPhoneNumber.text.length != 10) {
        showSnackBar(
            key: _scaffoldKey,
            snackBarMessage: AppLocalizations.of(context)
                .txt_please_enter_valid_phone_number);
      } else if (_cOwnerName.text.isEmpty) {
        showSnackBar(
            key: _scaffoldKey,
            snackBarMessage:
                AppLocalizations.of(context).txt_please_enter_owner_name);
      } else if (_cAddress.text.isEmpty) {
        showSnackBar(
            key: _scaffoldKey,
            snackBarMessage:
                AppLocalizations.of(context).txt_please_enter_address);
      } else if (_cDescription.text.isEmpty) {
        showSnackBar(
            key: _scaffoldKey,
            snackBarMessage:
                AppLocalizations.of(context).txt_please_enter_description);
      } else if (_tImage == null) {
        showSnackBar(
            key: _scaffoldKey,
            snackBarMessage:
                AppLocalizations.of(context).txt_please_select_image);
      }
    } catch (e) {
      print("Exception - generalInformationScreen.dart - _signUp():" +
          e.toString());
    }
  }

  // signUp() async {
  //   try {
  //     user.vendor_email = email;
  //     var fullPhoneNumber = "+" + countryCode + _cPhoneNumber.text.trim();
  //     print(fullPhoneNumber);
  //     user.vendor_password = password;
  //     user.vendor_address = _cAddress.text.trim();
  //     user.vendor_name = _cVenderName.text.trim();
  //     user.vendor_phone = fullPhoneNumber;
  //     user.description = _cDescription.text.trim();
  //     user.owner_name = _cOwnerName.text.trim();

  //     if (_saloonType != null) {
  //       if (_saloonType == 1) {
  //         user.type = 'Male';
  //       } else if (_saloonType == 2) {
  //         user.type = 'Female';
  //       } else {
  //         user.type = 'Unisex';
  //       }
  //     }
  //     user.vendor_image = _tImage;

  //     user.device_id = global.appDeviceId;
  //     if (_cVenderName.text.isNotEmpty &&
  //         _cPhoneNumber.text.isNotEmpty &&
  //         fullPhoneNumber.length < 20 &&
  //         _cOwnerName.text.isNotEmpty &&
  //         _cAddress.text.isNotEmpty &&
  //         _cDescription.text.isNotEmpty &&
  //         _tImage != null) {
  //       bool isConnected = await br.checkConnectivity();
  //       if (isConnected) {
  //         showOnlyLoaderDialog();
  //         await apiHelper
  //             .signUp(
  //                 user.type,
  //                 user.vendor_name,
  //                 user.owner_name,
  //                 user.vendor_email,
  //                 user.vendor_password,
  //                 user.device_id,
  //                 user.vendor_phone,
  //                 user.vendor_address,
  //                 user.description,
  //                 _tImage)
  //             .then((result) {
  //           if (result.status == "1") {
  //             user = result.recordList;
  //             global.user = result.recordList;
  //             br.saveUser(user);
  //             hideLoader();
  //             Navigator.of(context).push(
  //               MaterialPageRoute(
  //                 builder: (BuildContext context) => BottomNavigationWidget(
  //                   a: widget.analytics,
  //                   o: widget.observer,
  //                 ),
  //               ),
  //             );
  //           } else {
  //             hideLoader();
  //             showSnackBar(
  //                 key: _scaffoldKey, snackBarMessage: '${result.message}');
  //           }
  //         });
  //       } else {
  //         showNetworkErrorSnackBar(_scaffoldKey);
  //       }
  //     } else if (_cVenderName.text.isEmpty) {
  //       showSnackBar(
  //           key: _scaffoldKey,
  //           snackBarMessage:
  //               AppLocalizations.of(context).txt_please_enter_parlour_name);
  //     } else if (_cPhoneNumber.text.isEmpty) {
  //       showSnackBar(
  //           key: _scaffoldKey,
  //           snackBarMessage:
  //               AppLocalizations.of(context).txt_please_enter_phone_number);
  //     } else if (_cPhoneNumber.text.length != 10) {
  //       showSnackBar(
  //           key: _scaffoldKey,
  //           snackBarMessage: AppLocalizations.of(context)
  //               .txt_please_enter_valid_phone_number);
  //     } else if (_cOwnerName.text.isEmpty) {
  //       showSnackBar(
  //           key: _scaffoldKey,
  //           snackBarMessage:
  //               AppLocalizations.of(context).txt_please_enter_owner_name);
  //     } else if (_cAddress.text.isEmpty) {
  //       showSnackBar(
  //           key: _scaffoldKey,
  //           snackBarMessage:
  //               AppLocalizations.of(context).txt_please_enter_address);
  //     } else if (_cDescription.text.isEmpty) {
  //       showSnackBar(
  //           key: _scaffoldKey,
  //           snackBarMessage:
  //               AppLocalizations.of(context).txt_please_enter_description);
  //     } else if (_tImage == null) {
  //       showSnackBar(
  //           key: _scaffoldKey,
  //           snackBarMessage:
  //               AppLocalizations.of(context).txt_please_select_image);
  //     }
  //   } catch (e) {
  //     print("Exception - generalInformationScreen.dart - _signUp():" +
  //         e.toString());
  //   }
  // }

  _showCupertinoModalSheet() {
    try {
      showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
          title: Text(
            AppLocalizations.of(context).lbl_action,
          ),
          actions: [
            CupertinoActionSheetAction(
              child: Text(AppLocalizations.of(context).lbl_take_picture,
                  style: TextStyle(color: Color(0xFF171D2C))),
              onPressed: () async {
                Navigator.pop(context);
                showOnlyLoaderDialog();
                _tImage = await br.openCamera();
                hideLoader();

                setState(() {});
              },
            ),
            CupertinoActionSheetAction(
              child: Text(AppLocalizations.of(context).lbl_choose_from_library,
                  style: TextStyle(color: Color(0xFF171D2C))),
              onPressed: () async {
                Navigator.pop(context);
                showOnlyLoaderDialog();
                _tImage = await br.selectImageFromGallery();
                hideLoader();

                setState(() {});
              },
            )
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text(AppLocalizations.of(context).lbl_cancel,
                style: TextStyle(color: Color(0xFFFA692C))),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      );
    } catch (e) {
      print(
          "Exception - generalInformationScreen.dart - _showCupertinoModalSheet():" +
              e.toString());
    }
  }
}
