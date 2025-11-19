import 'package:flutter/material.dart';
import '../pages/exercise_list_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const DrawerHeader(
              child: ListTile(
                leading: CircleAvatar(child: Icon(Icons.fitness_center)),
                title: Text('Exercise App', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                subtitle: Text('v1.0'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.fitness_center),
              title: const Text('Exercises'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => ExerciseListPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite_border),
              title: const Text('Favorites'),
              onTap: () {
                Navigator.pop(context);
                // TODO: push favorites page
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                // TODO: push settings page
              },
            ),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
              onTap: () => showAboutDialog(context: context, applicationName: 'Exercise App', applicationVersion: '1.0'),
            ),
          ],
        ),
      ),
    );
  }
}
