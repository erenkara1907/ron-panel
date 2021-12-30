import 'package:get/get.dart';
import 'package:ronventory_mobile/app/core/service/settings_base.dart';
import 'package:ronventory_mobile/app/messages/settings/settings_messages.snackbar.dart';
import 'package:ronventory_mobile/app/model/settings/settings_model.dart';
import 'package:ronventory_mobile/app/service/settings/settings_service.dart';

enum AppMode { DEBUG, RELEASE }

class SettingsRepository implements SettingsBase {

  final SettingsService _settingsService = Get.put(SettingsService());

  AppMode appMode = AppMode.RELEASE;

  @override
  Future<SettingsModel?> getSettings(String token) async {
    if(appMode == AppMode.DEBUG){
      return null;
    }else {
      final response = await _settingsService.getSettings(token);
      if(response!.sidebar != null){
        return response;
      }
    }
  }
}
