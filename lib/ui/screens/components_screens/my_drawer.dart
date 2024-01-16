import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_family_calendar/blocs/auth_bloc/auth_bloc.dart';
import 'package:our_family_calendar/blocs/setting_app_bloc/setting_app_bloc.dart';
import 'package:our_family_calendar/generated/l10n.dart';
import 'package:our_family_calendar/main_navigation.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final _user = context.read<AuthBloc>().state.user;
    final _photoURL = _user?.photoURL ?? '';
    return Column(
      children: [
        DrawerHeader(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(

                  radius: 50,
                  backgroundImage: NetworkImage((_photoURL != '')
                      ? _photoURL
                      : 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')),
              Text(_user?.displayName ?? 'Пользователь',
                  style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
        ),
        DrawerButton(
          title: 'Главная',
          onTap: () {
            Navigator.of(context).popAndPushNamed(Screens.home);
          },
          icon: const Icon(Icons.home),
        ),
        DrawerButton(
          title: 'Профтль',
          onTap: () {
            // Navigator.of(context).popAndPushNamed(Screens.home);
          },
          icon: const Icon(Icons.person),
        ),
        DrawerButton(
          title: 'Семья',
          onTap: () {
            // Navigator.of(context).popAndPushNamed(Screens.home);
          },
          icon: const Icon(Icons.group_add_sharp),
        ),
        DrawerButton(
          title: 'Настройки',
          onTap: () {
            Navigator.of(context).popAndPushNamed(Screens.settings);
          },
          icon: const Icon(Icons.settings),
        ),
        DrawerButton(
          title: 'Выти',
          onTap: () {
            context.read<AuthBloc>().add(AuthLogOutEvent());
            context.read<SettingAppBloc>().add(SettingAppSetEvent(
                isAuthorized: false,
                locale: null,
                appTheme: null,
                socialRole: null));
            Navigator.of(context).popAndPushNamed(Screens.main);
          },
          icon: const Icon(Icons.logout),
        ),
      ],
    );
  }
}

class DrawerButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Icon icon;

  const DrawerButton(
      {super.key,
      required this.title,
      required this.onTap,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Theme.of(context).shadowColor, offset: const Offset(1, 1)),
        ], color: Colors.black87, borderRadius: BorderRadius.circular(12)),
        child: InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                icon,
                const SizedBox(
                  width: 24,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            )),
      ),
    );
  }
}
