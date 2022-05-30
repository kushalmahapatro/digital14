import 'package:digital14/digital14.dart';
import 'package:digital14/features/events_listing/entity/events_ui_model.dart';

class PaginationNotifier<T> extends StateNotifier<AsyncValue<EventsUiModel>> {
  PaginationNotifier({
    required this.fetchNextItems,
  }) : super(const AsyncValue.loading());

  final Future<EventsUiModel> Function(String query, int pageNumber)
      fetchNextItems;

  String queryState = '';

  Timer _timer = Timer(const Duration(milliseconds: 0), () {});
  void init() {
    if (state.value?.eventsData == null &&
        (state.value?.eventsData ?? <EventsData>[]).isEmpty) {
      fetchFirstBatch('');
    }
  }

  void updateData(EventsUiModel result) {
    if ((result.eventsData ?? <EventsData>[]).isEmpty) {
      state = AsyncValue.data(result.copyWith(paginating: false));
    } else {
      List<EventsData> datas = state.value!.eventsData!
        ..addAll(result.eventsData ?? <EventsData>[]);
      state = AsyncValue.data(
          result.copyWith(paginating: false, eventsData: datas));
    }
  }

  void newData(EventsUiModel result) {
    state = AsyncValue.data(result);
  }

  Future<void> fetchFirstBatch(String query) async {
    queryState = query;
    try {
      state = const AsyncValue.loading();
      final EventsUiModel result = await fetchNextItems(queryState, 1);

      newData(result);
    } catch (e, stk) {
      state = AsyncValue.error(e, stackTrace: stk);
    }
  }

  Future<void> fetchNextBatch() async {
    if (_timer.isActive &&
        (state.value?.eventsData ?? <EventsData>[]).isNotEmpty) {
      return;
    }
    if (state.value?.paginating ?? true) {
      return;
    }
    if ((state.value?.eventsData?.length ?? 0) < (state.value?.total ?? 0)) {
      _timer = Timer(const Duration(milliseconds: 1000), () {});
      try {
        state = AsyncValue.data(state.value!.copyWith(paginating: true));

        await Future.delayed(const Duration(seconds: 1));
        final result = await fetchNextItems(
            queryState, (state.value?.pageNumber ?? 1) + 1);
        updateData(result);
      } catch (e, stk) {
        state = AsyncValue.error(e, stackTrace: stk);
      }
    }
  }
}
