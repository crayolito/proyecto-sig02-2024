import 'package:app_sig_proyect/bloc/gps/gps_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenPermission extends StatelessWidget {
  const ScreenPermission({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final gpsBloc = BlocProvider.of<GpsBloc>(context, listen: true);

    return Scaffold(
      body: Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://res.cloudinary.com/da9xsfose/image/upload/v1703428437/dkzr0950inaxgjgtzwyl.png"),
                  fit: BoxFit.cover)),
          child: Center(
            child: Container(
              padding: const EdgeInsets.only(top: 10),
              margin: EdgeInsets.symmetric(horizontal: size.width * .15),
              width: size.width,
              height: size.height * .2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white.withOpacity(.85)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StatusDisplay(
                    estado: gpsBloc.state.isGpsPermissionGranted,
                    message: "Acceso al GPS",
                  ),
                  StatusDisplay(
                    estado: gpsBloc.state.isGpsEnabled,
                    message: "Estado del GPS",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // ButtonNextProcess(
                  //   estado: gpsBloc.state.isAllGranted,
                  // )
                ],
              ),
            ),
          )),
    );
  }
}

// class ButtonNextProcess extends StatelessWidget {
//   final bool estado;
//   const ButtonNextProcess({
//     super.key,
//     required this.estado,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         child: Container(
//       alignment: Alignment.center,
//       height: 50,
//       width: 150,
//       decoration: const BoxDecoration(
//           border: Border(
//             bottom: BorderSide(color: Colors.black, width: 3),
//             top: BorderSide(color: Colors.black, width: 3),
//             left: BorderSide(color: Colors.black, width: 3),
//             right: BorderSide(color: Colors.black, width: 3),
//           ),
//           borderRadius: BorderRadius.all(Radius.circular(15))),
//       child: Text(estado ? 'Continua ->' : 'Espera ...',
//           style: const TextStyle(
//               color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
//     ));
//   }
// }

// VISUALIZACION DEL ESTADO
class StatusDisplay extends StatelessWidget {
  final bool estado;
  final String message;

  const StatusDisplay({
    super.key,
    required this.estado,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: TextButton.icon(
          onPressed: () {
            final gpsBloc = BlocProvider.of<GpsBloc>(context, listen: false);
            gpsBloc.askGpsAccess();
          },
          icon: estado
              ? const Icon(
                  size: 35,
                  Icons.check_circle_outline_sharp,
                  color: Colors.green,
                )
              : const Icon(
                  size: 35,
                  Icons.cancel_outlined,
                  color: Colors.red,
                ),
          label: Text(
            message,
            style: const TextStyle(color: Colors.black, fontSize: 25),
          )),
    );
  }
}
