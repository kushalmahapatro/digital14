import 'package:digital14/digital14.dart';
import 'package:digital14/features/events_listing/events_listing.dart';

final seachProvider = StateProvider<String>((ref) => '');

final Debouncer debouncer = Debouncer(delay: const Duration(milliseconds: 300));
void searchChangeListener(WidgetRef ref) {
  ref.listen(seachProvider, (_, v) {
    debouncer.call(() {
      ref.read(eventsDataProvider.notifier).fetchFirstBatch(v.toString());
    });
  });
}

class Debouncer {
  final Duration? delay;
  Timer? _timer;

  Debouncer({this.delay});

  void call(void Function() action) {
    _timer?.cancel();
    _timer = Timer(delay!, action);
  }

  /// Notifies if the delayed call is active.
  bool get isRunning => _timer?.isActive ?? false;

  /// Cancel the current delayed call.
  void cancel() => _timer?.cancel();
}
