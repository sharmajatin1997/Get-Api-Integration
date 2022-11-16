import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mime/mime.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class Utils {
  // final controller=Get.put(HomeScreenController());
  static errorSnackBar(String? message) {
    if (message == null) {
      return;
    }
    Get.closeAllSnackbars();
    Get.snackbar(
      "VisMed",
      message,
      duration: Duration(seconds: 2),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.fromLTRB(10, 0, 10,10),
      backgroundColor: Colors.blue ,
      borderRadius: 5,
      snackPosition: SnackPosition.TOP,
      // colorText: AppColor.colorBlack,
      titleText: Text("VisMed",
        textAlign: TextAlign.start,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            height: 1
        ),
      ),
      messageText: Text(
        message,
        textAlign: TextAlign.start,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 18,
            height: 1.6
        ),
      ),

    );
  }

  static showLoader() {
    EasyLoading.show(
      status: "loading...", );
  }

  static Future hideLoader() async {
    return await EasyLoading.dismiss();
  }

  static showError(String? error) {
    CoolAlert.show(
      context:Get.context!,
      // MyApp.navigatorKey.currentContext!,
      type: CoolAlertType.error,
      title: 'Oops...',
      text: _extractText(error),
      confirmBtnColor: Colors.green,
      loopAnimation:false,
      backgroundColor: Colors.green,
    );
  }

  static String _extractText(String? message) {
    if (message == null) {
      return "";
    }
    if (message.length > 200) {
      return message.substring(0, 199);
    } else {
      return message;
    }
  }

  static bool emailValidation(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(email);
  }



  static hideKeyboard(context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }


  static Future<bool> hasNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Utils.showError("Strings.check_your_internet_connectivity");
      return false;
    } else {
      return true;
    }
  }

  static String getFullName(String? firstName, String? lastName) {
    if (firstName != null && lastName != null) {
      return firstName + " " + lastName;
    } else if (firstName != null) {
      return firstName;
    } else {
      return "";
    }
  }

  static String? getFileType(String path) {
    final mimeType = lookupMimeType(path);
    String? result = mimeType?.substring(0, mimeType.indexOf('/'));
    return result;
    // if(mimeType.startsWith("image/")){
    //   return "image";
    // }else if(mimeType.startsWith("video/")){
    //   return "video";
    // }else{
    //   return "application";
    // }
  }

  static String maskCardNumber(String? cardNumber) {
    cardNumber = cardNumber!.replaceAll(" ", "");
    int var1 = 0;
    StringBuffer var2;
    for (var2 = StringBuffer(); var1 < cardNumber.length; ++var1) {
      if (var1 > cardNumber.length - 5) {
        var2.write(cardNumber[var1]);
      } else {
        var2.write("X");
      }
    }

    return var2.toString();
  }

  static String convertMeterToKilometer(double meter) {
    return removeDecimalZeroFormatTwo(meter * 0.001);
  }

  static String removeDecimalZeroFormatTwo(double n) {
    String result =  n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
    if(result.endsWith(".0")){
      result = result.replaceAll(".0", "");
    }
    return result;
  }

  static String removeDecimalZeroFormat(String? number) {
    if (number == null) return "0 Km";
    var n = double.parse(number);
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
  }

  static Color getJobStatusColor(String? status) {
    switch (status) {
      case "1":
        return Color(0xff83f571);
      case "2":
        return Color(0xfff09d59);
      case "3":
        return Color(0xffE9240F);
      case "4":
        return Color(0xff43B31D);
      case "5":
        return Color(0xffE9240F);
      default:
        return Color(0xffE9240F);
    }
  }

  static String getJobStatusText(String? status) {
    switch (status) {
      case "1":
        return "Requested";
      case "2":
        return "Ongoing";    //accepted
      case "3":
        return "Rejected";
      case "4":
        return "Completed";
      case "5":
        return "Cancelled";
      default:
        return 'Hellow';
    }
  }

  // static void openUrl(String url) async {
  //   await canLaunch(url) ? await launch(url) : print('Could not launch $url');
  // }
  //
  // static Future<void> openMap(double latitude, double longitude) async {
  //   String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
  //   if (await canLaunch(googleUrl)) {
  //     await launch(googleUrl);
  //   } else {
  //     throw 'Could not open the map.';
  //   }
  // }
}