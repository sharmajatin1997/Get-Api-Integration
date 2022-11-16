import 'package:api_integartion/api_data/UserModel.dart';
import 'package:api_integartion/api_data/page_response.dart';
import 'package:dio/dio.dart';
import 'Injector.dart';

class AuthApiProvider {
  late Dio _dio;

  AuthApiProvider() {
    _dio = Injector().getDio();
  }

  Future<PageResponse<UserModel?>> getList() async {
    try {
      Response response = await _dio.get(
          "http://3.20.42.152:8018/api/get_supervisor",
          queryParameters: {"limit": 10, "page": 1});
      var pageResponse = PageResponse<UserModel>.fromJson(response.data,
          (data) => UserModel.fromJson(data as Map<String, dynamic>));
      return pageResponse;
    } catch (error) {
      final res = (error as dynamic).response;
      if (res != null) return PageResponse.fromJson(res?.data, (data) => null);
      return PageResponse(code: 0, message: error.toString());
    }
  }
}
