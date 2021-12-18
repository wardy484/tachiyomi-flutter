import 'package:bloc/bloc.dart';
import 'package:fluttiyomi/database/tables.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favourites_state.dart';
part 'favourites_cubit.freezed.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  final MyDatabase _database;

  FavouritesCubit(MyDatabase database)
      : _database = database,
        super(const FavouritesState.initial());

  Future<void> get() async {
    final favourites = await _database.getFavourites();

    emit(FavouritesState.loaded(favourites));
  }
}
