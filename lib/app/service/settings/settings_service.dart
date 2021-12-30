import 'package:get/get.dart';
import 'package:ronventory_mobile/app/core/service/settings_base.dart';
import 'package:ronventory_mobile/app/model/settings/settings_model.dart';
import 'package:ronventory_mobile/app/util/consts.dart';

class SettingsService extends GetConnect with SettingsBase {
  @override
  Future<SettingsModel?> getSettings(String token) async {
    final response = await get(settingsUrl, headers: {
      'x-token': token,
      'x-device': 'mobile'
    });

    return SettingsModel.fromJson(response.body);
  }
}
