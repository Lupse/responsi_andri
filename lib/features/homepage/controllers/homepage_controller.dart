import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:hive/hive.dart';
import 'package:latihan_responsi_prak_mobile/repo/auth_repo.dart';

class HomepageController extends GetxController {
  final AuthRepo authRepo = Get.find();

  void logout() {
    authRepo.logout();
  }

  Future<String?> getLoggedInUser() async {
    var sessionBox = await Hive.openBox('session');
    return sessionBox.get('loggedInUser');
  }
}
