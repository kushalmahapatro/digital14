import 'package:digital14/digital14.dart';
import 'package:digital14/features/favourite/favourite.dart';

class FavouriteInteractor {
  FavouriteInteractor._();

  static void onFavourtieAddClick(WidgetRef ref, String id) {
    Set<String> list = <String>{};
    list.addAll(ref.read(favouriteProvider.notifier).state);
    list.add(id);
    ref.read(favouriteProvider.notifier).update((state) => list);
    if (prefs != null) {
      List<String> ids = <String>[];
      for (var element in list) {
        ids.add(element.toString());
      }
      prefs!.setStringList("fav_list", ids);
    }
  }

  static void onFavourtieRemoveClick(WidgetRef ref, String id) {
    Set<String> list = <String>{};
    list.addAll(ref.read(favouriteProvider.notifier).state);
    list.remove(id);
    ref.read(favouriteProvider.notifier).update((state) => list);
    if (prefs != null) {
      List<String> ids = <String>[];
      for (var element in list) {
        ids.add(element.toString());
      }
      prefs!.setStringList("fav_list", ids);
    }
  }
}
