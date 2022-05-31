import 'package:digital14/digital14.dart';
import 'package:digital14/features/events_listing/events_listing.dart';
import 'package:digital14/features/search/search.dart';

class SearchListingView extends HookConsumerWidget {
  const SearchListingView({Key? key, this.navigateToDetails = false})
      : super(key: key);
  final bool navigateToDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(toolbarHeight: 50, title: const SearchView()),
        body: Container(
            decoration: BoxDecoration(
                border: navigateToDetails
                    ? const Border()
                    : Border(
                        right: BorderSide(
                            color: context.colors.surfaceVariant, width: 1))),
            child: EventsView(navigateToDetails: navigateToDetails)));
  }
}
