import 'package:my_caff/core/errors/exception.dart';
import 'package:my_caff/feauture/data/datasources/database/db_service.dart';
import 'package:my_caff/feauture/domain/entites/person_entity.dart';
import 'package:my_caff/feauture/presentation/controllers/base_controller.dart';

class ProfileController extends BaseController {
  late final PersonEntity? userInfo;

  @override
  void onInit() async {
    super.onInit();
    changeLoading(true);
    userInfo = await getUser();
    changeLoading(false);
  }

  Future<PersonEntity?> getUser() async {
    var resultEither = await userRepo.getUser();
    if (resultEither.isRight()) {
      var result = resultEither.getOrElse(() => throw ServerException());
      return result;
    }
    return null;
  }

  Future<void> exitProfile() async {
    await DBService.to.delAccessToken();
  }
}
