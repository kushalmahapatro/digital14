class EventsModel {
  List<Events>? events;
  Meta? meta;

  EventsModel({events, meta});

  EventsModel.fromJson(Map<String, dynamic> json) {
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(Events.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (events != null) {
      data['events'] = events!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Events {
  String? type;
  int? id;
  String? datetimeUtc;
  Venue? venue;
  bool? datetimeTbd;
  List<Performers>? performers;
  bool? isOpen;
  String? datetimeLocal;
  bool? timeTbd;
  String? shortTitle;
  String? visibleUntilUtc;
  Stats? stats;
  List<Taxonomies>? taxonomies;
  String? url;
  String? score;
  String? announceDate;
  String? createdAt;
  bool? dateTbd;
  String? title;
  String? popularity;
  String? description;
  String? status;
  AccessMethod? accessMethod;
  bool? conditional;

  Events({
    type,
    id,
    datetimeUtc,
    venue,
    datetimeTbd,
    performers,
    isOpen,
    datetimeLocal,
    timeTbd,
    shortTitle,
    visibleUntilUtc,
    stats,
    taxonomies,
    url,
    score,
    announceDate,
    createdAt,
    dateTbd,
    title,
    popularity,
    description,
    status,
    accessMethod,
    conditional,
  });

  Events.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    datetimeUtc = json['datetime_utc'];
    venue = json['venue'] != null ? Venue.fromJson(json['venue']) : null;
    datetimeTbd = json['datetime_tbd'];
    if (json['performers'] != null) {
      performers = <Performers>[];
      json['performers'].forEach((v) {
        performers!.add(Performers.fromJson(v));
      });
    }
    isOpen = json['is_open'];

    datetimeLocal = json['datetime_local'];
    timeTbd = json['time_tbd'];
    shortTitle = json['short_title'];
    visibleUntilUtc = json['visible_until_utc'];
    stats = json['stats'] != null ? Stats.fromJson(json['stats']) : null;
    if (json['taxonomies'] != null) {
      taxonomies = <Taxonomies>[];
      json['taxonomies'].forEach((v) {
        taxonomies!.add(Taxonomies.fromJson(v));
      });
    }
    url = json['url'];
    score = json['score'].toString();
    announceDate = json['announce_date'];
    createdAt = json['created_at'];
    dateTbd = json['date_tbd'];
    title = json['title'];
    popularity = json['popularity'].toString();
    description = json['description'];
    status = json['status'];
    accessMethod = json['access_method'] != null
        ? AccessMethod.fromJson(json['access_method'])
        : null;

    conditional = json['conditional'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    data['datetime_utc'] = datetimeUtc;
    if (venue != null) {
      data['venue'] = venue!.toJson();
    }
    data['datetime_tbd'] = datetimeTbd;
    if (performers != null) {
      data['performers'] = performers!.map((v) => v.toJson()).toList();
    }
    data['is_open'] = isOpen;

    data['datetime_local'] = datetimeLocal;
    data['time_tbd'] = timeTbd;
    data['short_title'] = shortTitle;
    data['visible_until_utc'] = visibleUntilUtc;
    if (stats != null) {
      data['stats'] = stats!.toJson();
    }
    if (taxonomies != null) {
      data['taxonomies'] = taxonomies!.map((v) => v.toJson()).toList();
    }
    data['url'] = url;
    data['score'] = score;
    data['announce_date'] = announceDate;
    data['created_at'] = createdAt;
    data['date_tbd'] = dateTbd;
    data['title'] = title;
    data['popularity'] = popularity;
    data['description'] = description;
    data['status'] = status;
    if (accessMethod != null) {
      data['access_method'] = accessMethod!.toJson();
    }

    data['conditional'] = conditional;

    return data;
  }
}

class Venue {
  String? state;
  String? nameV2;
  String? postalCode;
  String? name;
  String? timezone;
  String? url;
  String? score;
  Location? location;
  String? address;
  String? country;
  bool? hasUpcomingEvents;
  int? numUpcomingEvents;
  String? city;
  String? slug;
  String? extendedAddress;
  int? id;
  int? popularity;
  AccessMethod? accessMethod;
  int? metroCode;
  int? capacity;
  String? displayLocation;

  Venue(
      {state,
      nameV2,
      postalCode,
      name,
      timezone,
      url,
      score,
      location,
      address,
      country,
      hasUpcomingEvents,
      numUpcomingEvents,
      city,
      slug,
      extendedAddress,
      id,
      popularity,
      accessMethod,
      metroCode,
      capacity,
      displayLocation});

  Venue.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    nameV2 = json['name_v2'];
    postalCode = json['postal_code'];
    name = json['name'];

    timezone = json['timezone'];
    url = json['url'];
    score = json['score'].toString();
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    address = json['address'];
    country = json['country'];
    hasUpcomingEvents = json['has_upcoming_events'];
    numUpcomingEvents = json['num_upcoming_events'];
    city = json['city'];
    slug = json['slug'];
    extendedAddress = json['extended_address'];
    id = json['id'];
    popularity = json['popularity'];
    accessMethod = json['access_method'] != null
        ? AccessMethod.fromJson(json['access_method'])
        : null;
    metroCode = json['metro_code'];
    capacity = json['capacity'];
    displayLocation = json['display_location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['state'] = state;
    data['name_v2'] = nameV2;
    data['postal_code'] = postalCode;
    data['name'] = name;

    data['timezone'] = timezone;
    data['url'] = url;
    data['score'] = score;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['address'] = address;
    data['country'] = country;
    data['has_upcoming_events'] = hasUpcomingEvents;
    data['num_upcoming_events'] = numUpcomingEvents;
    data['city'] = city;
    data['slug'] = slug;
    data['extended_address'] = extendedAddress;
    data['id'] = id;
    data['popularity'] = popularity;
    if (accessMethod != null) {
      data['access_method'] = accessMethod!.toJson();
    }
    data['metro_code'] = metroCode;
    data['capacity'] = capacity;
    data['display_location'] = displayLocation;
    return data;
  }
}

class Location {
  double? lat;
  double? lon;

  Location({lat, lon});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lon'] = lon;
    return data;
  }
}

class AccessMethod {
  String? method;
  String? createdAt;
  bool? employeeOnly;

  AccessMethod({method, createdAt, employeeOnly});

  AccessMethod.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    createdAt = json['created_at'];
    employeeOnly = json['employee_only'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['method'] = method;
    data['created_at'] = createdAt;
    data['employee_only'] = employeeOnly;
    return data;
  }
}

class Performers {
  String? type;
  String? name;
  String? image;
  int? id;
  Images? images;
  List<Divisions>? divisions;
  bool? hasUpcomingEvents;
  bool? primary;
  Stats? stats;
  List<Taxonomies>? taxonomies;
  String? imageAttribution;
  String? url;
  String? score;
  String? slug;
  int? homeVenueId;
  String? shortName;
  int? numUpcomingEvents;
  Colors? colors;
  String? imageLicense;
  int? popularity;
  bool? homeTeam;
  Location? location;
  String? imageRightsMessage;
  bool? awayTeam;

  Performers(
      {type,
      name,
      image,
      id,
      images,
      divisions,
      hasUpcomingEvents,
      primary,
      stats,
      taxonomies,
      imageAttribution,
      url,
      score,
      slug,
      homeVenueId,
      shortName,
      numUpcomingEvents,
      colors,
      imageLicense,
      popularity,
      homeTeam,
      location,
      imageRightsMessage,
      awayTeam});

  Performers.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    image = json['image'];
    id = json['id'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    if (json['divisions'] != null) {
      divisions = <Divisions>[];
      json['divisions'].forEach((v) {
        divisions!.add(Divisions.fromJson(v));
      });
    }
    hasUpcomingEvents = json['has_upcoming_events'];
    primary = json['primary'];
    stats = json['stats'] != null ? Stats.fromJson(json['stats']) : null;
    if (json['taxonomies'] != null) {
      taxonomies = <Taxonomies>[];
      json['taxonomies'].forEach((v) {
        taxonomies!.add(Taxonomies.fromJson(v));
      });
    }
    imageAttribution = json['image_attribution'];
    url = json['url'];
    score = json['score'].toString();
    slug = json['slug'];
    homeVenueId = json['home_venue_id'];
    shortName = json['short_name'];
    numUpcomingEvents = json['num_upcoming_events'];
    colors = json['colors'] != null ? Colors.fromJson(json['colors']) : null;
    imageLicense = json['image_license'];
    popularity = json['popularity'];
    homeTeam = json['home_team'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    imageRightsMessage = json['image_rights_message'];
    awayTeam = json['away_team'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['name'] = name;
    data['image'] = image;
    data['id'] = id;
    if (images != null) {
      data['images'] = images!.toJson();
    }
    if (divisions != null) {
      data['divisions'] = divisions!.map((v) => v.toJson()).toList();
    }
    data['has_upcoming_events'] = hasUpcomingEvents;
    data['primary'] = primary;
    if (stats != null) {
      data['stats'] = stats!.toJson();
    }
    if (taxonomies != null) {
      data['taxonomies'] = taxonomies!.map((v) => v.toJson()).toList();
    }
    data['image_attribution'] = imageAttribution;
    data['url'] = url;
    data['score'] = score;
    data['slug'] = slug;
    data['home_venue_id'] = homeVenueId;
    data['short_name'] = shortName;
    data['num_upcoming_events'] = numUpcomingEvents;
    if (colors != null) {
      data['colors'] = colors!.toJson();
    }
    data['image_license'] = imageLicense;
    data['popularity'] = popularity;
    data['home_team'] = homeTeam;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['image_rights_message'] = imageRightsMessage;
    data['away_team'] = awayTeam;
    return data;
  }
}

class Images {
  String? huge;

  Images({huge});

  Images.fromJson(Map<String, dynamic> json) {
    huge = json['huge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['huge'] = huge;
    return data;
  }
}

class Divisions {
  int? taxonomyId;
  String? shortName;
  String? displayName;
  String? displayType;
  int? divisionLevel;
  String? slug;

  Divisions(
      {taxonomyId, shortName, displayName, displayType, divisionLevel, slug});

  Divisions.fromJson(Map<String, dynamic> json) {
    taxonomyId = json['taxonomy_id'];
    shortName = json['short_name'];
    displayName = json['display_name'];
    displayType = json['display_type'];
    divisionLevel = json['division_level'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['taxonomy_id'] = taxonomyId;
    data['short_name'] = shortName;
    data['display_name'] = displayName;
    data['display_type'] = displayType;
    data['division_level'] = divisionLevel;
    data['slug'] = slug;
    return data;
  }
}

class Stats {
  int? eventCount;

  Stats({eventCount});

  Stats.fromJson(Map<String, dynamic> json) {
    eventCount = json['event_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['event_count'] = eventCount;
    return data;
  }
}

class Taxonomies {
  int? id;
  String? name;
  int? parentId;
  DocumentSource? documentSource;
  int? rank;

  Taxonomies({id, name, parentId, documentSource, rank});

  Taxonomies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    parentId = json['parent_id'];
    documentSource = json['document_source'] != null
        ? DocumentSource.fromJson(json['document_source'])
        : null;
    rank = json['rank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['parent_id'] = parentId;
    if (documentSource != null) {
      data['document_source'] = documentSource!.toJson();
    }
    data['rank'] = rank;
    return data;
  }
}

class DocumentSource {
  String? sourceType;
  String? generationType;

  DocumentSource({sourceType, generationType});

  DocumentSource.fromJson(Map<String, dynamic> json) {
    sourceType = json['source_type'];
    generationType = json['generation_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['source_type'] = sourceType;
    data['generation_type'] = generationType;
    return data;
  }
}

class Colors {
  List<String>? all;
  String? iconic;
  List<String>? primary;

  Colors({all, iconic, primary});

  Colors.fromJson(Map<String, dynamic> json) {
    all = json['all'].cast<String>();
    iconic = json['iconic'];
    primary = json['primary'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['all'] = all;
    data['iconic'] = iconic;
    data['primary'] = primary;
    return data;
  }
}

class Meta {
  int? total;
  int? took;
  int? page;
  int? perPage;

  Meta({total, took, page, perPage, geolocation});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    took = json['took'];
    page = json['page'];
    perPage = json['per_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['took'] = took;
    data['page'] = page;
    data['per_page'] = perPage;

    return data;
  }
}
