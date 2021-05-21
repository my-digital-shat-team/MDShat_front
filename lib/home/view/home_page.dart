import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:my_digital_shat/app/bloc/app_bloc.dart';
import 'package:my_digital_shat/app/view/toolbar.dart';
import 'package:my_digital_shat/login/view/login_page.dart';

class HomePage extends StatefulWidget {
  static Page page() => MaterialPage<void>(child: HomePage());

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      bottomNavigationBar: Toolbar(),
      appBar: AppBar(
        title: const Text('Accueil'),
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              context.read<AppBloc>().add(AppLogoutRequested());
              Navigator.of(context).push<void>(LoginPage.route());
            },
          )
        ],
      ),
      body: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Bienvenue', style: textTheme.headline6),
            const SizedBox(height: 4.0),
            Text(user.email ?? '', style: textTheme.headline6),
            const SizedBox(height: 4.0),
            Text(user.name ?? '', style: textTheme.headline5),
            const SizedBox(height: 4.0),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('fr_FR', null);
  }
}
