import 'package:latihan/providers/base_network.dart';

class ApiResource {
  static ApiResource instance = ApiResource();

  Future<Map<String, dynamic>> getNews() {
    return BaseNetwork.get("articles/?format=json");
  }

  Future<Map<String, dynamic>> getBlog() {
    return BaseNetwork.get("blogs/?format=json");
  }

  Future<Map<String, dynamic>> getReports() {
    return BaseNetwork.get("reports/?format=json");
  }
}
