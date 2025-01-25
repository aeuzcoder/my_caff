import 'package:my_caff/feauture/data/datasources/database/db_service.dart';
import 'package:my_caff/feauture/presentation/controllers/base_controller.dart';

class ProfileController extends BaseController {
  Future<void> exitProfile() async {
    await DBService.to.delAccessToken();
  }
}
