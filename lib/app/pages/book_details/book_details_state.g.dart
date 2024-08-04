// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_details_state.dart';

// **************************************************************************
// MatchExtensionGenerator
// **************************************************************************

extension BookDetailsStateStatusMatch on BookDetailsStateStatus {
  T match<T>(
      {required T Function() initial,
      required T Function() loading,
      required T Function() loaded,
      required T Function() error}) {
    final v = this;
    if (v == BookDetailsStateStatus.initial) {
      return initial();
    }

    if (v == BookDetailsStateStatus.loading) {
      return loading();
    }

    if (v == BookDetailsStateStatus.loaded) {
      return loaded();
    }

    if (v == BookDetailsStateStatus.error) {
      return error();
    }

    throw Exception(
        'BookDetailsStateStatus.match failed, found no match for: $this');
  }

  T matchAny<T>(
      {required T Function() any,
      T Function()? initial,
      T Function()? loading,
      T Function()? loaded,
      T Function()? error}) {
    final v = this;
    if (v == BookDetailsStateStatus.initial && initial != null) {
      return initial();
    }

    if (v == BookDetailsStateStatus.loading && loading != null) {
      return loading();
    }

    if (v == BookDetailsStateStatus.loaded && loaded != null) {
      return loaded();
    }

    if (v == BookDetailsStateStatus.error && error != null) {
      return error();
    }

    return any();
  }
}
