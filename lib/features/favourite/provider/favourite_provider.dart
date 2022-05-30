import 'package:digital14/digital14.dart';

final favouriteProvider = StateProvider<Set<String>>((ref) {
  if (prefs != null && prefs!.containsKey("fav_list")) {
    Set<String> ids = <String>{};
    prefs!.getStringList("fav_list")?.forEach((element) {
      ids.add(element);
    });
    return ids;
  } else {
    return <String>{};
  }
});
