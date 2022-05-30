import 'package:digital14/digital14.dart';
import 'package:digital14/features/events_listing/events_listing.dart';

class EventsApiDataHelper {
  Future<EventsUiModel> getEvents(String query, {int pageNumber = 1}) async {
    if (query.isEmpty) {
      return EventsUiModel(
          eventsData: <EventsData>[],
          pageNumber: 1,
          total: 0,
          paginating: false);
    }

    RestServiceResponse resp = await restService.get("/events",
        parameters: <String, String>{
          'q': query,
          'per_page': '20',
          'page': pageNumber.toString()
        });
    EventsModel apiModel = EventsModel.fromJson(resp.response);
    List<EventsData> data = <EventsData>[];
    for (var event in (apiModel.events ?? <Events>[])) {
      for (var performer in (event.performers ?? <Performers>[])) {
        final f = DateFormat('EEE, dd MMM yyyy hh:mm a');

        data.add(EventsData(
            performers: performer,
            venue: event.venue,
            datetimeUtc: event.datetimeUtc,
            readableDate: f.format(DateTime.parse(event.datetimeUtc ?? '')),
            id: performer.id,
            joinId: event.id.toString() + performer.id.toString(),
            url: event.url));
      }
    }
    return EventsUiModel(
        eventsData: data,
        pageNumber: apiModel.meta?.page ?? 1,
        total: apiModel.meta?.total ?? 0,
        paginating: false);
  }
}
