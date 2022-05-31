import 'package:digital14/digital14.dart';
import 'package:digital14/features/event_details/event_details.dart';
import 'package:digital14/features/events_listing/events_listing.dart';
import 'package:digital14/features/favourite/favourite.dart';

class EventItem extends ConsumerStatefulWidget {
  const EventItem(
      {super.key, required this.data, this.navigateToDetails = false});
  final EventsData data;
  final bool navigateToDetails;

  @override
  ListingItemState createState() => ListingItemState();
}

class ListingItemState extends ConsumerState<EventItem>
    with MaterialStateMixin {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    bool selected = !widget.navigateToDetails
        ? (ref.watch(eventDetailsProvider.notifier).state?.joinId ==
            widget.data.joinId)
        : false;
    String imageUrl = widget.data.performers?.image ?? '';

    return imageUrl.isNotEmpty
        ? MouseRegion(
            cursor: isHovered ? SystemMouseCursors.click : MouseCursor.defer,
            onEnter: (_) {
              hovered = true;
              setMaterialState(MaterialState.hovered, true);
            },
            onExit: (_) {
              hovered = false;
              setMaterialState(MaterialState.hovered, false);
            },
            child: InkWell(
              onTap: () {
                EventListingInteractor.onItemClick(
                  context,
                  ref,
                  widget.data,
                  navigateToDetails: widget.navigateToDetails,
                );

                selected = false;
                hovered = false;

                setState(() {});
              },
              child: Column(
                children: [
                  AdaptiveContainer(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    color: selected
                        ? context.colors.primaryContainer
                        : hovered
                            ? context.colors.primaryContainer
                            : context.colors.surface,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: LayoutBuilder(
                                      builder: (context, constraints) =>
                                          SizedBox(
                                              width: constraints.maxWidth,
                                              height: constraints.maxWidth,
                                              child: imageUrl.isNotEmpty
                                                  ? Image.network(
                                                      imageUrl,
                                                      width: double.maxFinite,
                                                      fit: BoxFit.fitHeight,
                                                    )
                                                  : Container())),
                                ),
                              ),
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: FavouriteView(
                                    favouriteType: FavouriteType.listing,
                                    id: widget.data.joinId ?? '0',
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Flexible(
                            flex: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// Name
                                Text(
                                  widget.data.performers?.name ?? '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.bodyLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 3),

                                /// Address
                                Text(
                                  widget.data.venue?.address ?? '',
                                  style: context.bodySmall!
                                      .copyWith(color: context.colors.outline),
                                ),
                                const SizedBox(height: 3),

                                /// Time
                                Text(
                                  widget.data.readableDate ?? '',
                                  style: context.bodySmall!
                                      .copyWith(color: context.colors.outline),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  AdaptiveContainer(
                    height: 1,
                    color: context.colors.surfaceVariant,
                  )
                ],
              ),
            ))
        : Container();
  }
}
