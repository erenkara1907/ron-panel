import 'package:ronventory_mobile/app/model/settings/settings_model.dart';

abstract class SettingsBase {
  Future<SettingsModel?> getSettings(String token);
}