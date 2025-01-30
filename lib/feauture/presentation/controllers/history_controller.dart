import 'package:my_caff/core/errors/exception.dart';
import 'package:my_caff/feauture/domain/entites/my_order_entity.dart';
import 'package:my_caff/feauture/presentation/controllers/base_controller.dart';

class HistoryController extends BaseController {
  List<MyOrderEntity>? orders;
  @override
  void onInit() async {
    super.onInit();
    changeLoading(true);
    orders = await getOrders();

    changeLoading(false);
  }

  Future<List<MyOrderEntity>?> getOrders() async {
    var response = await userRepo.getOrders();
    if (response.isRight()) {
      var result = response.getOrElse(() => throw ServerException());
      return result;
    }
    return null;
  }
}
