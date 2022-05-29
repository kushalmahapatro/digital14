import 'package:digital14/digital14.dart';
import 'package:digital14/features/events/events.dart';
import 'package:digital14/features/events/entity/events_model.dart';
import 'package:digital14/rest_services/rest_service.dart';

class EventsPresenter {
  Future<List<EventsUiModel>> getEvents(String query) async {
    RestServiceResponse resp = await restService
        .get("/events", parameters: <String, String>{'q': query});
    EventsModel apiModel = EventsModel.fromJson(resp.response);
    List<EventsUiModel> uiModel = <EventsUiModel>[];
    for (var event in (apiModel.events ?? <Events>[])) {
      for (var performer in (event.performers ?? <Performers>[])) {
        final f = DateFormat('EEE, dd MMM yyyy hh:mm a');

        uiModel.add(EventsUiModel(
            performers: performer,
            venue: event.venue,
            datetimeUtc: event.datetimeUtc,
            readableDate: f.format(DateTime.parse(event.datetimeUtc ?? '')),
            id: performer.id,
            joinId: event.id.toString() + performer.id.toString(),
            url: event.url));
      }
    }
    return uiModel;
  }
}

final eventsApiProvider = Provider<EventsPresenter>((ref) => EventsPresenter());
