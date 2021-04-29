import 'package:authentication_repository/authentication_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_digital_shat/app/bloc/app_bloc.dart';
import 'package:my_digital_shat/app/routes/routes.dart';
import 'package:my_digital_shat/chat/bloc/message/message_bloc.dart';
import 'package:my_digital_shat/repository/message/firebase_message_repository.dart';
import 'package:my_digital_shat/theme.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required AuthenticationRepository authenticationRepository,
  })   : _authenticationRepository = authenticationRepository,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppBloc>(
            create: (BuildContext context) =>
                AppBloc(authenticationRepository: _authenticationRepository),
          ),
          BlocProvider<MessageBloc>(
            create: (BuildContext context) =>
                MessageBloc(messageRepository: FirebaseMessageRepository()),
          ),
        ],
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
