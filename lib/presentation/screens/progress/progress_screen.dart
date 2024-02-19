import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  static const name = 'progress_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Indicators'),
      ),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text('Circular Progress Indicator'),
          SizedBox(
            height: 30,
          ),
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.black45,
          ),
          SizedBox(
            height: 30,
          ),
          Text('Circular and Linear Progress Indicator Controlled'),
          SizedBox(
            height: 30,
          ),
          _ControllerProgressIndicator(),
        ],
      ),
    );
  }
}


class _ControllerProgressIndicator extends StatelessWidget {
  const _ControllerProgressIndicator();

  @override
  Widget build(BuildContext context) {

    // the stream builder will dispose the `stream` when the widget is destroyed
    return StreamBuilder<double>(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return (value *2) / 100;
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {

        final progressValue = snapshot.data ?? 0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              CircularProgressIndicator(value: progressValue, strokeWidth: 2, backgroundColor: Colors.black12,),
              const SizedBox(
                height: 30,
              ),
              Expanded(child:
                LinearProgressIndicator(value: progressValue),
              ),
            ],
          ),
        );
      }
    );
  }
}
