import 'package:digital14/features/events/entity/events_model.dart';

class EventsUiModel {
  EventsUiModel(
      {this.performers,
      this.datetimeUtc,
      this.readableDate,
      this.venue,
      this.url,
      this.joinId,
      this.id});
  Performers? performers;
  String? datetimeUtc;
  String? readableDate;
  Venue? venue;
  String? url;
  int? id;
  String? joinId;
}
