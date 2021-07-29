import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:grohe_app/models/location.dart';
import 'package:grohe_app/repositories/home/index.dart';
import 'package:meta/meta.dart';

part 'event.dart';
part 'state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.homeRepository,
  }) : super(const HomeState());

  final HomeRepository homeRepository;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetLocationsRequested) {
      yield* _mapGetLocationsToState();
    }
  }

  Stream<HomeState> _mapGetLocationsToState() async* {
    yield state.copyWith(status: HomeStatus.loading);
    try {
      final locations = await homeRepository.getLocations();
      yield state.copyWith(
        status: HomeStatus.success,
        locations: locations.locations.toList(),
      );
    } on Exception {
      yield state.copyWith(status: HomeStatus.failure);
    }
  }
}