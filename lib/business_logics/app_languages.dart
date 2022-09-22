import 'package:get/get.dart';
import 'package:shelter/ui/languages/bangla.dart';
import 'package:shelter/ui/languages/english.dart';

class AppLanguages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": eng,
        "bn_BD": ban,
      };
}
