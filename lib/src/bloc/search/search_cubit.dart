import 'package:bloc/bloc.dart';
import 'package:flutter_tenor_gif_picker/src/repository/tenor_repository.dart';
import 'package:flutter_tenor_gif_picker/src/setup/tenor_meta.dart';
import 'package:meta/meta.dart';
import 'package:tenor_api_service/tenor_api_service.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  String? next;
  final List<TenorData> results = [];

  void search(
    String query, {
    String? next,
    int limit = 10,
  }) async {
    if (next == null) {
      results.clear();
      emit(SearchLoading());
    }
    final result = await tenorRepository.search(
      TenorSearchRequest(
        key: tenorMeta!.apiKey,
        query: query,
        country: tenorMeta?.country,
        clientKey: tenorMeta?.clientKey,
        contentFilter: tenorMeta?.contentFilter,
        locale: tenorMeta?.locale,
        mediaFilter: 'tinygif, gif',
        limit: limit,
        pos: next,
      ),
    );

    if (result.status) {
      this.next = result.data!.next;
      emit(SearchResult(results..addAll(result.data!.results)));
    } else {
      emit(SearchError(result.error));
    }
  }
}
