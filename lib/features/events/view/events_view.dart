import 'package:digital14/digital14.dart';
import 'package:digital14/features/events/events.dart';
import 'package:digital14/features/events/view/components/event_item.dart';
import 'package:digital14/features/search_listing/search_listing.dart';

final eventsDataProvider = FutureProvider<List<EventsUiModel>?>(((ref) async {
  if (ref.watch(seachProvider).isNotEmpty) {
    return ref.read(eventsApiProvider).getEvents(ref.read(seachProvider));
  } else {
    return null;
  }
}));

class EventsView extends HookConsumerWidget {
  const EventsView({super.key, this.navigateToDetails = false});
  final bool navigateToDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(eventsDataProvider);
    return data.when(
        error: (err, s) => Text(err.toString()),
        data: (List<EventsUiModel>? events) {
          if (events != null && events.isNotEmpty) {
            return ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) => EventItem(
                    data: events[index], navigateToDetails: navigateToDetails));
          } else {
            return const Center(child: Text("No search result"));
          }
        },
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
