import 'package:flutter/widgets.dart';
import 'package:my_digital_shat/app/bloc/app_bloc.dart';
import 'package:my_digital_shat/home/view/home_page.dart';
import 'package:my_digital_shat/login/view/login_page.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
    default:
      return [LoginPage.page()];
  }
}
