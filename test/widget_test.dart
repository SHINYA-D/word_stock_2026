import 'package:flutter_test/flutter_test.dart';

import 'presentation/auth/login_page_test.dart' as login_page;
import 'presentation/auth/password_reset_page_test.dart' as password_reset_page;
import 'presentation/auth/sign_up_page_test.dart' as sign_up_page;
import 'presentation/auth/splash_page_test.dart' as splash_page;
import 'presentation/home/home_page_test.dart' as home_page;
import 'presentation/result/result_page_test.dart' as result_page;
import 'presentation/settings/settings_page_test.dart' as settings_page;
import 'presentation/test_session/test_page_test.dart' as test_page;
import 'presentation/test_session/test_result_page_test.dart' as test_result_page;
import 'presentation/test_session/test_settings_page_test.dart' as test_settings_page;
import 'presentation/word/word_list_page_test.dart' as word_list_page;

void main() {
  group('Auth', () {
    splash_page.main();
    login_page.main();
    sign_up_page.main();
    password_reset_page.main();
  });

  group('Home', () {
    home_page.main();
  });

  group('Word', () {
    word_list_page.main();
  }); 

  group('TestSession', () {
    test_settings_page.main();
    test_page.main();
    test_result_page.main();
  });

  group('Result', () {
    result_page.main();
  });

  group('Settings', () {
    settings_page.main();
  });
}
