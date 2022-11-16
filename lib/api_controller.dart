import 'package:api_integartion/api_data/UserModel.dart';
import 'package:api_integartion/api_data/authApiProvider.dart';
import 'package:get/get.dart';

import 'utils.dart';

late AuthApiProvider apiProvider;

class ApiController extends GetxController{

  RxList<UserModel?> list=RxList();

  @override
  void onInit() {
    apiProvider = AuthApiProvider();
    getList();
    super.onInit();
  }

  Future getList() async {
    if (await Utils.hasNetwork()) {
      Utils.showLoader();
      var response = await apiProvider.getList();
      await Utils.hideLoader();
      if (response.status == false) {
        Utils.errorSnackBar(response.message);
      } else {
        if (response.body != null) {
          list.value = response.body!;
        }
      }
    }
  }

}