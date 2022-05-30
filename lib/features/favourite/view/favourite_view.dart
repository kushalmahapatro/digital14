import 'package:digital14/digital14.dart';
import 'package:digital14/features/favourite/favourite.dart';

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
        Widget fav = const SizedBox();
        if (favData.contains(id)) {
          fav = favIcon(context);
        }
        return fav;

      case FavouriteType.details:
        Widget fav = InkWell(
            onTap: () => FavouriteInteractor.onFavourtieAddClick(ref, id),
            child: const Icon(
              Icons.favorite_border,
              size: 30,
              color: Colors.redAccent,
            ));
        if (favData.contains(id)) {
          fav = InkWell(
            onTap: () => FavouriteInteractor.onFavourtieRemoveClick(ref, id),
            child: const Icon(
              Icons.favorite,
              size: 30,
              color: Colors.redAccent,
            ),
          );
        }
        return fav;
    }
  }
}
