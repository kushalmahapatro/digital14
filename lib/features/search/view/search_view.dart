import 'package:digital14/digital14.dart';
import 'package:digital14/features/search_listing/search_listing.dart';

class SearchView extends StatefulHookConsumerWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchViewState();
}

class _SearchViewState extends ConsumerState<SearchView> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    if (ref.read(seachProvider).isNotEmpty) {
      controller.text = ref.read(seachProvider);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool bottomPadding = kIsWeb
        ? true
        : Platform.isMacOS
            ? true
            : false;
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, right: 5),
            child: Container(
              decoration: BoxDecoration(
                  color: context.colors.primary,
                  borderRadius: BorderRadius.circular(5)),
              height: 30,
              alignment: Alignment.center,
              child: TextField(
                controller: controller,
                onChanged: (value) {
                  ref.read(seachProvider.notifier).state = value;
                },
                cursorHeight: 4,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  hintText: "search",
                  hintStyle: context.bodyLarge
                      ?.copyWith(color: context.colors.surfaceVariant),
                  focusedBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(bottom: bottomPadding ? 20 : 15),
                  suffixIcon: ref.watch(seachProvider).isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            ref.read(seachProvider.notifier).state = '';
                            controller.text = '';
                          },
                          icon: Icon(Icons.cancel,
                              size: 15, color: context.colors.surface),
                        )
                      : null,
                  prefixIcon: Icon(Icons.search,
                      size: 20, color: context.colors.surface),
                ),
                style:
                    context.bodyLarge?.copyWith(color: context.colors.surface),
              ),
            ),
          ),
        ),
        Text(
          "Cancel",
          style: context.bodySmall?.copyWith(color: context.colors.surface),
        )
      ],
    );
  }
}
