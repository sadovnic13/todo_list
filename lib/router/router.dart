import 'package:todo_list/features/home_page/home_page.dart';
import 'package:todo_list/features/reg_page/reg_page.dart';

import '../features/log_page/log_page.dart';

final routes = {
  '/log_page_screen': (context) => const LogPageScreen(),
  '/reg_page_screen': (context) => const RegPageScreen(),
  '/home_page_screen': (context) => const HomepageScreen(),
};
