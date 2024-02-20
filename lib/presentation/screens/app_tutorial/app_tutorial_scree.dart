import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

final slides = <SlideInfo>[
  SlideInfo(
      title: 'Search food',
      caption:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Faucibus purus in massa tempor nec. Gravida arcu ac tortor dignissim convallis aenean et tortor. Cras adipiscing enim eu turpis egestas. Duis at tellus at urna condimentum mattis pellentesque. Id consectetur purus ut faucibus. Rutrum quisque non tellus orci ac. Feugiat nibh sed pulvinar proin gravida hendrerit. Est placerat in egestas erat. Mattis molestie a iaculis at erat pellentesque adipiscing commodo elit. Ut lectus arcu bibendum at varius vel pharetra. Imperdiet nulla malesuada pellentesque elit eget gravida cum sociis natoque. Sit amet nulla facilisi morbi tempus. Amet nisl suscipit adipiscing bibendum est ultricies integer quis auctor. Sed elementum tempus egestas sed sed.',
      imageUrl: 'assets/images/1.png'),
  SlideInfo(
      title: 'Fast Delivery',
      caption:
          'Semper auctor neque vitae tempus quam. Non curabitur gravida arcu ac. Elit scelerisque mauris pellentesque pulvinar. Blandit aliquam etiam erat velit scelerisque. Ut enim blandit volutpat maecenas volutpat blandit. Volutpat sed cras ornare arcu dui vivamus arcu. Non quam lacus suspendisse faucibus interdum posuere lorem ipsum dolor. Accumsan tortor posuere ac ut. Ac turpis egestas maecenas pharetra. Non arcu risus quis varius quam quisque.',
      imageUrl: 'assets/images/2.png'),
  SlideInfo(
      title: 'Enjoy',
      caption:
          'Nam aliquam sem et tortor consequat id porta nibh venenatis. Odio pellentesque diam volutpat commodo sed egestas egestas fringilla. Sed nisi lacus sed viverra tellus in hac. Dictum sit amet justo donec enim diam vulputate. Enim tortor at auctor urna nunc. Amet dictum sit amet justo. Sit amet nisl suscipit adipiscing bibendum est ultricies integer. Viverra maecenas accumsan lacus vel facilisis volutpat est velit. Neque convallis a cras semper auctor neque vitae. Mauris pellentesque pulvinar pellentesque habitant morbi tristique senectus et. Viverra aliquet eget sit amet tellus cras adipiscing enim. Facilisis mauris sit amet massa vitae tortor condimentum. Elementum facilisis leo vel fringilla est ullamcorper eget nulla.',
      imageUrl: 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  const AppTutorialScreen({super.key});

  static const name = 'tutorial_screen';

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();

  bool endReached = false;

  @override
  void initState() {
    super.initState();

    // Listener
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }

      // print('${ pageViewController.page }');
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Tutorial')),
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl))
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 10,
            child: TextButton(
              child: const Text('Skip'),
              onPressed: () => context.pop(),
            ),
          ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      child: const Text('Start'),
                      onPressed: () => context.pop(),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide(
      {super.key,
      required this.title,
      required this.caption,
      required this.imageUrl});

  final String title;
  final String caption;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(imageUrl),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(caption, style: captionStyle)
          ],
        ),
      ),
    );
  }
}
