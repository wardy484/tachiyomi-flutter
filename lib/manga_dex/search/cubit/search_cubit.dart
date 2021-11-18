import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttiyomi/data/search_results/searchresults.dart';
import 'package:fluttiyomi/javascript/source_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  final SourceClient _source;

  SearchCubit(SourceClient source)
      : _source = source,
        super(const SearchState.initial());

  Future<void> getMangaList() async {
    SearchResults results = await _source.search("Dungeon Reset");

    emit(SearchState.loaded(results));
  }
}
