import 'package:digital14/digital14.dart';
import 'package:digital14/features/search/search.dart';
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
    bool bottomPadding = false;

    if (kIsWeb) {
      bottomPadding = true;
    } else if (Platform.isMacOS) {
      bottomPadding = true;
    }

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Container(
              decoration: BoxDecoration(
                  color: context.colors.primary,
                  borderRadius: BorderRadius.circular(5)),
              height: 30,
              alignment: Alignment.center,
              child: InputText(
                controller: controller,
                bottomPadding: MediaQuery.of(context).size.width > 600
                    ? bottomPadding
                    : false,
              ),
            ),
          ),
        ),

        /// Cancel button

        // Text(
        //   "Cancel",
        //   style: context.bodySmall?.copyWith(color: context.colors.surface),
        // )
      ],
    );
  }
}

class InputText extends ConsumerWidget {
  const InputText({
    Key? key,
    required this.controller,
    required this.bottomPadding,
  }) : super(key: key);

  final TextEditingController controller;

  final bool bottomPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    searchChangeListener(ref);

    return TextField(
        style:
            context.bodyLarge?.copyWith(color: context.colors.surfaceVariant),
        controller: controller,
        onChanged: (value) {
          ref.read(seachProvider.notifier).state = value;
        },
        cursorHeight: 4,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          hintText: "Search for any event",
          hintStyle: context.bodyLarge
              ?.copyWith(color: context.colors.surfaceVariant.withOpacity(0.6)),
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.only(bottom: bottomPadding ? 20 : 15),
          suffixIcon: ref.watch(seachProvider).isNotEmpty
              ? InkWell(
                  onTap: () => SearchInteractor.onClearClick(ref, controller),
                  child: Icon(Icons.cancel,
                      size: 15, color: context.colors.surface),
                )
              : null,
          prefixIcon:
              Icon(Icons.search, size: 20, color: context.colors.surface),
        ));
  }
}
