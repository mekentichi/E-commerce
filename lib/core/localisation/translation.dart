import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'fr': {'01': 'Bienvenue'},
        'ar': {'01': 'مرحبا'},
      };
}
