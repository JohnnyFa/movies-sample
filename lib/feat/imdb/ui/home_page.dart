import 'package:flutter/material.dart';
import 'package:movies_flutter_sample/common/di/setup_locator.dart';
import 'package:movies_flutter_sample/common/observer/event_observer.dart';
import 'package:movies_flutter_sample/feat/imdb/viewmodel/home_page_vm.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements EventObserver{
  final _vm = getIt.get<HomePageViewModel>();

  @override
  void initState() {
    super.initState();
    _vm.subscribe(this);
    _vm.fetchMovies();
  }

  @override
  void dispose() {
    _vm.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('SEX')));
  }

  @override
  void notify(String key, value) {
    switch (key) {
      case HomePageViewModel.onLoading:
        break;
      case HomePageViewModel.onSuccess:
        break;
      case HomePageViewModel.onError:
        break;
    }
  }
}
