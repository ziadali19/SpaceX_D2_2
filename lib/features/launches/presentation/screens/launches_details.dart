import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_d2_2/core/utils/CustomOutline.dart';
import 'package:spacex_d2_2/core/utils/spacex_background_view.dart';
import 'package:spacex_d2_2/features/launches/controller/cubit/luanches_cubit.dart';
import 'package:spacex_d2_2/features/launches/data/models/launches_model.dart';
import 'package:spacex_d2_2/features/launches/presentation/screens/hacker_video_view.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../core/utils/text_button.dart';

class DetailView extends StatefulWidget {
  const DetailView({Key? key, required this.luanchModel}) : super(key: key);
  final LuanchModel luanchModel;
  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  void launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      await closeInAppWebView();
    } else {
      throw 'Could not launch $url';
    }
  }

  Future alertDialog() async {
    context.read<LuanchesCubit>().getLunaches();
    showDialog(
        context: context,
        builder: (context) {
          return const HackerVideoView();
        });
  }

  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    final viewoID =
        YoutubePlayer.convertUrlToId(widget.luanchModel.links?.webcast ?? "");
    controller = YoutubePlayerController(
        initialVideoId: viewoID!,
        flags: const YoutubePlayerFlags(autoPlay: false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SpaceXBacground(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                leading: const BackButton(color: Colors.pink),
                backgroundColor: Colors.transparent,
                expandedHeight: MediaQuery.of(context).size.height * 0.5,
                flexibleSpace: FlexibleSpaceBar(
                  title: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          alignment: Alignment.bottomCenter,
                          image: NetworkImage(
                              widget.luanchModel.links?.patch?.large ?? ""),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.luanchModel.name ?? "name",
                        style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontFamily: "PressStart2P"),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Flight Number: ${widget.luanchModel.name}",
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.pink,
                            fontFamily: "PressStart2P"),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "${widget.luanchModel.details}",
                        style: const TextStyle(
                            fontSize: 10,
                            color: Colors.green,
                            fontFamily: "PressStart2P"),
                        // textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 6),
                        child: Container(
                          color: Colors.brown,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 11,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, bottom: 12, left: 12, right: 8),
                                  child: YoutubePlayer(
                                    controller: controller,
                                    showVideoProgressIndicator: true,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 2),
                                  child: Wrap(
                                    runSpacing: 10,
                                    alignment: WrapAlignment.center,
                                    children: [
                                      Container(
                                          height: 40,
                                          width: 20,
                                          color: Colors.brown.shade900),
                                      CircleAvatar(
                                          backgroundColor:
                                              Colors.brown.shade900,
                                          radius: 10),
                                      CircleAvatar(
                                          backgroundColor:
                                              Colors.brown.shade900,
                                          radius: 10),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      TextBtn(
                        text: widget.luanchModel.links?.article ?? "",
                        onPressed: () =>
                            launchURL(widget.luanchModel.links?.article ?? ""),
                        fontSize: 8,
                      ),
                      TextBtn(
                        text: widget.luanchModel.links?.article ?? "",
                        onPressed: () => launchURL(
                            widget.luanchModel.links?.wikipedia ?? ""),
                        fontSize: 8,
                      ),
                      CustomOutline(
                        onTap: () {
                          final snackBar = SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(
                                "Flight Number: : ${widget.luanchModel.name}"),
                            duration: Duration(seconds: 3), // Optional duration
                            action: SnackBarAction(
                              label: 'Sucessful Lunach',
                              onPressed: () {
                                // Perform some action when 'Close' is pressed
                              },
                              textColor: Colors.white,
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

                          //alertDialog();
                        },
                        strokeWidth: 1,
                        radius: 20,
                        padding: const EdgeInsets.all(3),
                        width: 160,
                        height: 38,
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.grey, Colors.yellow],
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                const Color.fromARGB(255, 35, 27, 29)
                                    .withOpacity(0.7),
                                Colors.green.withOpacity(0.7)
                              ],
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Launch',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SafeArea(child: SizedBox(height: 10))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
