import 'package:digital14/digital14.dart';

Widget favIcon(BuildContext context) {
  return SizedBox(
      height: 18,
      width: 18,
      child: Stack(
        children: [
          const Positioned(
              top: 0,
              left: 0,
              child: Icon(
                Icons.favorite,
                size: 18,
                color: Colors.white,
              )),
          Positioned(
              top: 1.5,
              left: 1.5,
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
