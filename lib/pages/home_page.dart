import 'package:digital14/digital14.dart';

import 'package:digital14/features/event_details/event_details.dart';
import 'package:digital14/features/search_listing/search_listing.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.isMobile) {
        return const SearchListingView(navigateToDetails: true);
      } else if (constraints.isTablet) {
        return Scaffold(
          body: Row(
            children: const <Widget>[
              Flexible(
                flex: 4,
                child: SearchListingView(),
              ),
              Flexible(flex: 6, child: EventDetailsView()),
            ],
          ),
        );
      } else {
        return Scaffold(
          body: Row(
            children: const <Widget>[
              Flexible(
                flex: 3,
                child: SearchListingView(),
              ),
              Flexible(flex: 7, child: EventDetailsView()),
            ],
          ),
        );
      }
    });
  }
}
