import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_d2_2/core/network/api_manger.dart';
import 'package:spacex_d2_2/core/theming/colors.dart';
import 'package:spacex_d2_2/core/theming/styles.dart';
import 'package:spacex_d2_2/features/launches/presentation/bloc/bloc/luanch_bloc.dart';

class LaunchesScreen extends StatelessWidget {
  const LaunchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<String> imagePaths = [
    //   'assets/images/launch1.png',
    //   'assets/images/launch1.png',
    //   'assets/images/launch1.png',
    //   // Add all your image asset paths here
    // ];

    return BlocProvider(
      create: (context) => LuanchBloc(Apimanger()),
      child: BlocConsumer<LuanchBloc, LuanchState>(
        listener: (context, state) {
          if (state.screenStatus == ScreenStatus.loading) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      backgroundColor: Colors.blueAccent,
                      title: Center(
                          child: CircularProgressIndicator(
                        color: Colors.amber,
                      )),
                    ));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Launches',
                style: TextStyle(color: Colors.amberAccent),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => LuanchBloc.get(context).add(clicklaunch()),
            ),
            // body: Column(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text(
            //       'Upcoming Launch',
            //       style: TextStyle(color: ColorsManager.whiteColor),
            //     ),
            //     Image.asset('assets/images/launch1.png'),
            //     Image.asset('assets/images/launch1.png'),
            //   ],
            // ),
            // body: ListView.builder(
            //   itemCount: imagePaths.length,
            //   itemBuilder: (context, index) {
            //     return Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Image.asset(
            //         imagePaths[index],
            //         fit: BoxFit.cover,
            //       ),
            //     );
            //   },
            // ),
          );
        },
      ),
    );
  }
}
