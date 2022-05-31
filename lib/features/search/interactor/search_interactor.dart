import 'package:digital14/digital14.dart';
import 'package:digital14/features/event_details/event_details.dart';
import 'package:digital14/features/search_listing/search_listing.dart';

class SearchInteractor {
  SearchInteractor._();

  static void onClearClick(WidgetRef ref, TextEditingController controller) {
    ref.read(seachProvider.notifier).state = '';
    ref.read(eventDetailsProvider.notifier).state = null;
    controller.text = '';
  }
}
