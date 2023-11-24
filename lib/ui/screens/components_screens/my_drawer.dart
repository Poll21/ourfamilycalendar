import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_family_calendar/blocs/auth_bloc/auth_bloc.dart';
import 'package:our_family_calendar/blocs/setting_app_bloc/setting_app_bloc.dart';
import 'package:our_family_calendar/main_navigation.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final _user = context.read<AuthBloc>().state.user;
    return Column(
      children: [
        DrawerHeader(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                  ),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.black26,
                    child: InkWell(
                      child: Icon(Icons.add),
                      onTap: () {},
                    ),
                  )
                ],
              ),
              Text(_user?.displayName ?? 'Пользователь', style: const TextStyle(color: Colors.black)),
            ],
          ),

        ),
        ListTile(
          title: Text('Главная'),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed(Screens.home);
            },
            icon: const Icon(Icons.home),
          ),
        ),
        ListTile(
          title: Text('Профтль',),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ),
        ListTile(
          title: Text('Семья'),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.group_add_sharp),
          ),
        ),
        ListTile(
          title: Text('Настройки'),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Screens.settings);
            },
            icon: const Icon(Icons.settings),
          ),
        ),
        ListTile(
          title: Text('Выти'),
          leading: IconButton(
            onPressed: () {
              context.read<AuthBloc>().add(AuthLogOutEvent());
              context.read<SettingAppBloc>().add(SettingAppSetEvent(
                  isAuthorized: false, locale: null, appTheme: null));
              Navigator.of(context).popAndPushNamed(Screens.main);
            },
            icon: const Icon(Icons.logout),
          ),
        ),
      ],
    );
  }
}
