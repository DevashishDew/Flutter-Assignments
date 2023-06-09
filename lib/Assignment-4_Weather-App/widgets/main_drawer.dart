import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key, required this.onSelectTheme}) : super(key: key);

  final void Function(String theme) onSelectTheme;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
            child: Row(
              children: [
                Icon(
                  Icons.cloud,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  'Weather Report',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.palette,
              size: 26,
              color: Theme.of(context).colorScheme.background,
            ),
            title: Text(
              'Theme',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onTap: (){
              onSelectTheme('meals');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
              color: Theme.of(context).colorScheme.background,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onTap: (){
              onSelectTheme('filters');
            },
          ),
        ],
      ),
    );
  }
}
