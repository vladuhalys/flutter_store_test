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
          'shopping_cart_button': 'Add to Shopping Cart',
          'sign_in': 'Sign In',
          'currency': 'USD',
          'purchasedCount': 'Purchased Count',
          'empty_cart': 'Empty Cart',
        },
        'uk_UA': {
          'error_text': 'Щось пішло не так!',
          'hello': 'Привіт Флаттер!',
          'store': 'Mаркет.ua',
          'settings': 'Налаштування',
          'settings_theme': 'Тема',
          'settings_lang': 'Українська',
          'shopping_cart': 'Кошик',
          'shopping_cart_button': 'Додати в кошик',
          'sign_in': 'Увійти',
          'currency': 'грн',
          'purchasedCount': 'Куплено',
          'empty_cart': 'Пустий кошик',
        },
      };
}
