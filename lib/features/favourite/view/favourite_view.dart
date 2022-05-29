import 'package:digital14/digital14.dart';

enum FavouriteType { listing, details }

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

class FavouriteView extends HookConsumerWidget {
  const FavouriteView({required this.favouriteType, required this.id, Key? key})
      : super(key: key);

  final FavouriteType favouriteType;
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favData = ref.watch(favouriteProvider);

    switch (favouriteType) {
      case FavouriteType.listing:
        if (favData.contains(id)) {
          return Stack(
            children: [
              const SizedBox(
                height: 19,
                child: Positioned(
                    top: 0,
                    left: 0,
                    child: Icon(
                      Icons.favorite,
                      size: 19,
                      color: Colors.white,
                    )),
              ),
              Positioned(
                  top: 2,
                  left: 2,
                  child: Icon(
                    Icons.favorite,
                    size: 15,
                    color: context.colors.error,
                  )),
            ],
          );
        } else {
          return Container();
        }

      case FavouriteType.details:
        if (favData.contains(id)) {
          return InkWell(
            onTap: () {
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
            },
            child: const Icon(
              Icons.favorite,
              size: 30,
              color: Colors.redAccent,
            ),
          );
        } else {
          return InkWell(
              onTap: () {
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
              },
              child: const Icon(
                Icons.favorite_border,
                size: 30,
                color: Colors.redAccent,
              ));
        }
    }
  }
}
