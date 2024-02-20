import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  const InfiniteScrollScreen({super.key});

  static const name = 'infinite_screen';

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];

  final ScrollController scrollController = ScrollController();

  bool isLoading = false;

  bool isMounted = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    scrollController.addListener(() {
      // if I am at the end I load the images
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        // load next page
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future<void> loadNextPage() async {
    // I am already loading won't send request
    if (isLoading) return;

    isLoading = true;

    await Future.delayed(
      const Duration(seconds: 2),
    );

    addFiveImages();
    isLoading = false;

    // to redraw the screen call setState

    // verify if the widget is mounted.
    if (!isMounted) return;

    setState(() {});

    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    isLoading = true;

    setState(() {});

    await Future.delayed(
      const Duration(seconds: 3),
    );

    isLoading = false;

    final lastId = imagesIds.last;

    imagesIds.clear();

    imagesIds.add(lastId + 1);

    addFiveImages();

    setState(() {});



  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
        scrollController.position.pixels + 120, // current position + 120px
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
    );
  }

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: const Text('Infinite Scroll'),
      // ),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage(
                    'https://picsum.photos/id/${imagesIds[index]}/500/300'),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        // child: const Icon(Icons.arrow_back_ios_new_outlined),
        child: isLoading
            ? FadeInRight(
                child: SpinPerfect(
                  infinite: true,
                  child: const Icon(Icons.refresh_rounded),
                ),
              )
            : FadeIn(
                child: const Icon(Icons.arrow_back_ios_new_outlined),
              ),
      ),
    );
  }
}
