import 'package:get/get.dart';
import 'package:jobberz_app/models/job_model.dart';
import 'package:jobberz_app/services/base_service.dart';

class JobSevice extends BaseService {
  Future<List<JobDataModel>?> getJob() async {
    try {
      final response = await get("/job");
      if (response.statusCode == 200) {
        List jsonResponse = response.body['data'];
        return jsonResponse.map((e) => JobDataModel.fromJson(e)).toList();
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      print(e.toString());
      // rethrow;
    }
  }

  Future<bool> createJob(Map<String, dynamic> data) async {
    try {
      var jobData = <String, dynamic>{
        'job_name': data['job_name'],
        'company': data['company'],
        'rate': data['rate'],
        'sallary': data['sallary'],
      };

      final response = await post("/jobcreate", jobData);

      if (response.statusCode == 200) {
        return true;
      } else {
        throw (response.body['data'] ?? response.body['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  // Future<bool> updateTransaction(Map<String, dynamic> data, int id) async {
  //   try {
  //     late FormData form;

  //     if (data['receipt_image'] != null) {
  //       if (data['subcategory_id'] != 0) {
  //         form = FormData({
  //           'amount': data['amount'].toString(),
  //           'category_id': data['category_id'].toString(),
  //           'wallet_id': data['wallet_id'].toString(),
  //           'description': data['description'].toString(),
  //           'date': data['date'].toString(),
  //           'subcategory_id': data['subcategory_id'].toString(),
  //           'receipt_image': MultipartFile(data['receipt_image'].path,
  //               filename: data['receipt_image'].path.split("/").last)
  //         });
  //       } else {
  //         form = FormData({
  //           'amount': data['amount'].toString(),
  //           'category_id': data['category_id'].toString(),
  //           'wallet_id': data['wallet_id'].toString(),
  //           'description': data['description'].toString(),
  //           'date': data['date'].toString(),
  //           'receipt_image': MultipartFile(data['receipt_image'].path,
  //               filename: data['receipt_image'].path.split("/").last)
  //         });
  //       }
  //     } else {
  //       if (data['subcategory_id'] != 0) {
  //         form = FormData({
  //           'amount': data['amount'].toString(),
  //           'category_id': data['category_id'].toString(),
  //           'wallet_id': data['wallet_id'].toString(),
  //           'description': data['description'].toString(),
  //           'subcategory_id': data['subcategory_id'].toString(),
  //           'date': data['date'].toString(),
  //         });
  //       } else {
  //         form = FormData({
  //           'amount': data['amount'].toString(),
  //           'category_id': data['category_id'].toString(),
  //           'wallet_id': data['wallet_id'].toString(),
  //           'description': data['description'].toString(),
  //           'date': data['date'].toString(),
  //         });
  //       }
  //     }

  //     final response = await put("/transactions/update/$id", form);
  //     if (response.statusCode == 200) {
  //       return true;
  //     } else {
  //       throw (response.body['data'] ?? response.body['message']);
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<bool> destroyTransaction(int id) async {
  //   try {
  //     final response = await delete("/transactions/delete/$id");

  //     if (response.statusCode == 200) {
  //       return true;
  //     } else {
  //       throw (response.body['data'] ?? response.body['message']);
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
