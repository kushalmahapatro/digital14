import 'package:digital14/digital14.dart';
import 'package:digital14/features/events_listing/events_listing.dart';

class EventsView extends HookConsumerWidget {
  EventsView({super.key, this.navigateToDetails = false});
  final bool navigateToDetails;
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(eventsDataProvider.notifier).fetchNextBatch();
        });
      }
    });

    final data = ref.watch(eventsDataProvider);
    return data.when(
        error: (err, s) => Text(err.toString()),
        data: (EventsUiModel events) {
          if (events.eventsData != null &&
              (events.eventsData ?? <EventsData>[]).isNotEmpty) {
            return ListView.builder(
                controller: controller,
                itemCount: (events.eventsData?.length ?? 0) + 1,
                itemBuilder: (context, index) {
                  if (index < (events.eventsData!.length)) {
                    return EventItem(
                        data: events.eventsData![index],
                        navigateToDetails: navigateToDetails);
                  } else {
                    return Container(
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: events.eventsData!.length < (events.total ?? 0)
                              ? const CircularProgressIndicator()
                              : const Text("End of Search"),
                        ));
                  }
                });
          } else {
            return const Center(child: Text("No search result"));
          }
        },
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
