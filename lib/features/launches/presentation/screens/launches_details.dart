import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                    padding: EdgeInsets.all(8.h),
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
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.luanchModel.name ?? "name",
                        style: TextStyle(
                          fontSize: 24.sp,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Flight Number: ${widget.luanchModel.name}",
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.pink,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "${widget.luanchModel.details}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.green,
                        ),
                        // textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.h, horizontal: 6.w),
                        child: Container(
                          color: Colors.brown,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 11,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 12.h,
                                      bottom: 12.h,
                                      left: 12.w,
                                      right: 8.w),
                                  child: YoutubePlayer(
                                    controller: controller,
                                    showVideoProgressIndicator: true,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 2.w),
                                  child: Wrap(
                                    runSpacing: 10,
                                    alignment: WrapAlignment.center,
                                    children: [
                                      Container(
                                          height: 40.h,
                                          width: 20.w,
                                          color: Colors.brown.shade900),
                                      CircleAvatar(
                                          backgroundColor:
                                              Colors.brown.shade900,
                                          radius: 10.r),
                                      CircleAvatar(
                                          backgroundColor:
                                              Colors.brown.shade900,
                                          radius: 10.r),
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
                        fontSize: 12.sp,
                      ),
                      TextBtn(
                        text: widget.luanchModel.links?.article ?? "",
                        onPressed: () => launchURL(
                            widget.luanchModel.links?.wikipedia ?? ""),
                        fontSize: 12.sp,
                      ),
                      CustomOutline(
                        onTap: () {
                          final snackBar = SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(
                                "Flight Number: : ${widget.luanchModel.name}"),
                            duration:
                                const Duration(seconds: 3), // Optional duration
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
                        strokeWidth: 1.w,
                        radius: 20.r,
                        padding: const EdgeInsets.all(3),
                        width: 160.w,
                        height: 38.h,
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.grey, Colors.yellow],
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
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
                          child: Center(
                            child: Text(
                              'Launch',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SafeArea(child: SizedBox(height: 10.h))
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
