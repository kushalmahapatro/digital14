import 'package:digital14/features/events_listing/events_listing.dart';

class EventsUiModel {
  EventsUiModel({
    this.eventsData,
    this.total,
    this.pageNumber,
    this.paginating,
  });
  List<EventsData>? eventsData;
  int? total;
  int? pageNumber;
  bool? paginating;

  EventsUiModel copyWith(
      {List<EventsData>? eventsData,
      int? total,
      int? pageNumber,
      bool? paginating}) {
    return EventsUiModel(
        eventsData: eventsData ?? this.eventsData,
        total: total ?? this.total,
        pageNumber: pageNumber ?? this.pageNumber,
        paginating: paginating ?? this.paginating);
  }
}

class EventsData {
  EventsData(
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
