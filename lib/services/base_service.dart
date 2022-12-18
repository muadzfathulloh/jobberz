import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:jobberz_app/constants/strings.dart';
import 'package:jobberz_app/utils/storage.dart';

class BaseService extends GetConnect implements GetxService {
  @override
  void onInit() {
    final token = Storage.getValue(storageToken);

    httpClient.baseUrl = baseURLAPI;
    httpClient.timeout = const Duration(seconds: 8);

    httpClient.addRequestModifier((Request request) {
      request.headers['Authorization'] = "Bearer $token";
      return request;
    });

    var headers = {'Authorization': "Bearer $token"};

    httpClient.addAuthenticator((Request request) async {
      request.headers.addAll(headers);
      return request;
    });

    httpClient.maxAuthRetries = 3;
    super.onInit();
  }
}
