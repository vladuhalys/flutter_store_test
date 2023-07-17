import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'error_text': 'Something went wrong!',
          'hello': 'Hello Flutter!',
          'store': 'Store.com',
          'settings': 'Settings',
          'settings_theme': 'Theme',
          'settings_lang': 'English',
          'shopping_cart': 'Shopping Cart',
          'sign_in': 'Sign In',
        },
        'uk_UA': {
          'error_text': 'Щось пішло не так!',
          'hello': 'Привіт Флаттер!',
          'store': 'Mаркет.ua',
          'settings': 'Налаштування',
          'settings_theme': 'Тема',
          'settings_lang': 'Українська',
          'shopping_cart': 'Кошик',
          'sign_in': 'Увійти',
        },
      };
}
