import 'package:digital14/digital14.dart';
import 'package:digital14/features/events_listing/events_listing.dart';
import 'package:digital14/features/favourite/favourite.dart';

final eventDetailsProvider = StateProvider<EventsData?>((ref) => null);

class EventDetailsView extends HookConsumerWidget {
  const EventDetailsView({this.showBackButton = false, super.key});
  final bool showBackButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = ref.watch(eventDetailsProvider);
    String imageUrl = details?.performers?.images?.huge ?? '';

    if (details == null) {
      return Container();
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          width: double.maxFinite,
          color: context.colors.surface,
          child: Column(
            children: [
              /// App bar with back, title and favourite icon
              DetailsAppBar(showBackButton: showBackButton, details: details),
              const SizedBox(height: 10),

              /// Divider
              Container(
                height: 1,
                color: context.colors.surfaceVariant,
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: imageUrl.isNotEmpty
                                ? Image.network(
                                    details.performers?.images?.huge ?? '',
                                    width: double.maxFinite,
                                    fit: BoxFit.fitHeight,
                                  )
                                : const SizedBox(
                                    width: double.maxFinite,
                                  )),
                        const SizedBox(height: 10),
                        Text(
                          details.readableDate ?? '',
                          style: context.headlineSmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          details.venue?.address ?? '',
                          style: context.titleSmall!
                              .copyWith(color: context.colors.outline),
                        ),
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({
    Key? key,
    required this.showBackButton,
    required this.details,
  }) : super(key: key);

  final bool showBackButton;
  final EventsData? details;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: showBackButton,
          child: InkWell(
            child: Container(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(
                Icons.arrow_back_ios,
                color: context.colors.primary,
                size: 30,
              ),
            ),
            onTap: () {
              context.pop();
            },
          ),
        ),
        Expanded(
          child: Text(
            details?.performers?.name ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: context.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 20),
        FavouriteView(
          favouriteType: FavouriteType.details,
          id: details?.joinId ?? '0',
        ),
      ],
    );
  }
}
