import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_flutter_sample/common/di/setup_locator.dart';
import 'package:movies_flutter_sample/common/observer/event_observer.dart';
import 'package:movies_flutter_sample/feat/imdb/viewmodel/home_page_vm.dart';

import '../data/e_home_page_state.dart';
import 'movie_carousel_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements EventObserver {
  final _vm = getIt.get<HomePageViewModel>();

  HomePageState _currentState = HomePageState.loading;

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
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    final stateWidgets = {
      HomePageState.loading: _loading,
      HomePageState.success: _success,
      HomePageState.error: _error,
    };

    return stateWidgets[_currentState] ?? Container();
  }

  Widget get _loading => const Center(child: CircularProgressIndicator());

  Widget get _error => const Center(child: Text('Ocorreu um erro, tente novamente mais tarde...'));

  Widget get _success => Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: CarouselSlider.builder(
          itemCount: _vm.movies?.results?.length,
          itemBuilder: (context, index, realIndex) {
            final movie = _vm.movies?.results?[index];
            return movie != null ? MovieCarouselItem(movie: movie) : Container();
          },
          options: CarouselOptions(
            height: 400.0,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: false,
            viewportFraction: 0.8,
          ),
        ),
      );

  @override
  void notify(String key, value) {
    switch (key) {
      case HomePageViewModel.onUpdateState:
        setState(() => _currentState = value);
        break;
    }
  }
}
