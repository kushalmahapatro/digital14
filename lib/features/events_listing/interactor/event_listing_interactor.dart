import 'package:digital14/digital14.dart';
import 'package:digital14/features/event_details/event_details.dart';
import 'package:digital14/features/events_listing/entity/events_ui_model.dart';

class EventListingInteractor {
  EventListingInteractor._();

  static void onItemClick(BuildContext c, WidgetRef ref, EventsData data,
      {bool navigateToDetails = false}) {
    if (navigateToDetails) {
      c.pushNamed("details", extra: data);
    }
    ref
      ..refresh(eventDetailsProvider)
      ..read(eventDetailsProvider.notifier).state = data;
  }
}
