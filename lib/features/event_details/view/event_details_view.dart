import 'package:digital14/digital14.dart';
import 'package:digital14/features/events/entity/events_ui_model.dart';

import '../../favourite/view/favourite_view.dart';

final eventDetailsProvider = StateProvider<EventsUiModel?>((ref) => null);

class EventDetailsView extends HookConsumerWidget {
  const EventDetailsView({this.showBackButton = false, super.key});
  final bool showBackButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = ref.watch(eventDetailsProvider);
    String imageUrl = details?.performers?.images?.huge ?? '';

    return Scaffold(
      body: details == null
          ? Container()
          : SafeArea(
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.maxFinite,
                color: context.colors.surface,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: showBackButton,
                          child: InkWell(
                            child: Container(
                              padding: const EdgeInsets.only(right: 15),
                              child: Icon(
                                Icons.chevron_left,
                                color: context.colors.primary,
                                size: 40,
                              ),
                            ),
                            onTap: () {
                              context.pop();
                            },
                          ),
                        ),
                        Expanded(
                          child: Text(
                            details.performers?.name ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: context.headlineSmall!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(width: 20),
                        FavouriteView(
                          favouriteType: FavouriteType.details,
                          id: details.joinId ?? '0',
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    AdaptiveContainer(
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
                                          details.performers?.images?.huge ??
                                              '',
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
