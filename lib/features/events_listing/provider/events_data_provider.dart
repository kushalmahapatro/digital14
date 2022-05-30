import 'package:digital14/digital14.dart';
import 'package:digital14/features/events_listing/events_listing.dart';

final eventsDataProvider = StateNotifierProvider<
    PaginationNotifier<EventsUiModel>, AsyncValue<EventsUiModel>>((ref) {
  return PaginationNotifier(
    fetchNextItems: (String query, int number) {
      return ref.read(eventsApiProvider).getEvents(query, pageNumber: number);
    },
  )..init();
});

final eventsApiProvider =
    Provider<EventsApiDataHelper>((ref) => EventsApiDataHelper());
