import 'package:my_caff/feauture/data/datasources/database/db_service.dart';

class RootService {
  static Future<void> init() async {
    await DBService.init(); // GetStorage Database
  }
}
