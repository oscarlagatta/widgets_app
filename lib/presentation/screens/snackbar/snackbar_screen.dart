import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});

  static const name = 'snackbar_screen';

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content: const Text('Hello World!!'),
      action: SnackBarAction(
        label: 'Ok!',
        onPressed: () {},
      ),
      // the action will make it close!
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text(
              'alksdjfla ksjdflkajsd lkfjasd;lf jka;slkfj ;ldjsaldaksjlk;fjds;lfjad'),
          actions: [
            TextButton(
              onPressed: () {
                return context.pop();
              },
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                return context.pop();
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars and Dialogs'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showCustomSnackbar(context);
        },
        label: const Text('show snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [const Text('Lorem Ipsum asdfa etc tetsf')],
                );
              },
              child: Text('Used Licenses'),
            ),
            FilledButton(
              onPressed: () {
                return openDialog(context);
              },
              child: Text('Show Dialog'),
            )
          ],
        ),
      ),
    );
  }
}
