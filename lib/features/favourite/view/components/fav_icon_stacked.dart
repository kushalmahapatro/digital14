import 'package:digital14/digital14.dart';

Widget favIcon(BuildContext context) {
  return SizedBox(
      height: 17,
      width: 17,
      child: Stack(
        children: [
          const Positioned(
              top: 0,
              left: 0,
              child: Icon(
                Icons.favorite,
                size: 17,
                color: Colors.white,
              )),
          Positioned(
              top: 1,
              left: 1,
              child: Icon(
                Icons.favorite,
                size: 15,
                color: context.colors.error,

                /// effect can be achieved even by shadow, but adding bigger icon looks good, like an outline
                // shadows: [
                //   BoxShadow(
                //       color: Colors.white,
                //       blurRadius: 0,
                //       offset: Offset(1, 1),
                //       spreadRadius: 0),
                //   BoxShadow(
                //       color: Colors.white,
                //       blurRadius: 0,
                //       offset: Offset(0, 2),
                //       spreadRadius: 0)
                // ],
              )),
        ],
      ));
}
