import 'package:digital14/digital14.dart';
import 'package:digital14/features/events_listing/events_listing.dart';

final seachProvider = StateProvider<String>((ref) => '');

void searchChangeListener(WidgetRef ref) {
  ref.listen(seachProvider, (_, v) {
    ref.read(eventsDataProvider.notifier).fetchFirstBatch(v.toString());
  });
}
