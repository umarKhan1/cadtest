// ignore: file_names
part of '../home_imports.dart';

class DisplayVerticallist extends StatefulWidget {
  const DisplayVerticallist({super.key});

  @override
  State<DisplayVerticallist> createState() => _DisplayVerticallistState();
}

class _DisplayVerticallistState extends State<DisplayVerticallist> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 100;
    var height = MediaQuery.of(context).size.height / 100;
    return Consumer<GetResultProvider>(
      builder: (context, value, child) {
        return value.totalLength == 0
            ? Container()
            : SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListView.builder(
                    itemCount: value.totalLength,
                    itemBuilder: ((context, totallenindex) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (value
                                              .urlModel[totallenindex].status ==
                                          true) {
                                        setState(() {
                                          value.urlModel[totallenindex].status =
                                              false;
                                        });
                                      } else {
                                        setState(() {
                                          value.urlModel[totallenindex].status =
                                              true;
                                        });
                                      }
                                    },
                                    child: FancyShimmerImage(
                                        height: 5.6 * height,
                                        width: 11.1 * width,
                                        errorWidget: Image.network(
                                            AppStrings.error_String),
                                        imageUrl:
                                            AppStrings.Url_____Image___String),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (value.captionString[totallenindex]
                                              .status ==
                                          true) {
                                        setState(() {
                                          value.captionString[totallenindex]
                                              .status = false;
                                        });
                                      } else {
                                        setState(() {
                                          value.captionString[totallenindex]
                                              .status = true;
                                        });
                                      }
                                    },
                                    child: FancyShimmerImage(
                                        height: 5.6 * height,
                                        width: 11.1 * width,
                                        errorWidget: Image.network(
                                            AppStrings.error_String),
                                        imageUrl: AppStrings
                                            .Caption____Image___String),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                height: 5.6 * height,
                                width: 55.5 * width,
                                child: ListView.builder(
                                    itemCount: value.segModel.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: ((context, index) {
                                      return Row(
                                        children: [
                                          if (value
                                                  .urlModel[totallenindex].id ==
                                              value.segModel[index].imageId)
                                            InkWell(
                                              onTap: () async {},
                                              child: FancyShimmerImage(
                                                  height: 5.6 * height,
                                                  width: 11.1 * width,
                                                  errorWidget: Image.network(
                                                      AppStrings.error_String),
                                                  imageUrl: value
                                                      .segModel[index].imageUrl
                                                      .toString()),
                                            )
                                          else
                                            Container(),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                        ],
                                      );
                                    })),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          value.urlModel.isEmpty
                              ? Container()
                              : value.urlModel[totallenindex].status == false
                                  ? Container()
                                  : Text(
                                      value.urlModel[totallenindex].cocoUrl
                                          .toString(),
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                          value.urlModel.isEmpty
                              ? Container()
                              : value.urlModel[totallenindex].status == false
                                  ? Container()
                                  : Text(
                                      value.urlModel[totallenindex].flickerUrl
                                          .toString(),
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                          const SizedBox(
                            height: 10,
                          ),
                          value.captionString.isEmpty
                              ? Container()
                              : value.captionString[totallenindex].status ==
                                      false
                                  ? Container()
                                  : Text(
                                      value
                                          .captionString[totallenindex].captions
                                          .toString(),
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                          SizedBox(
                              height: 250,
                              child: value.urlModel.isEmpty
                                  ? Container()
                                  : Stack(
                                      children: [
                                        FancyShimmerImage(
                                            errorWidget: Image.network(
                                                AppStrings.error_String),
                                            imageUrl: value
                                                .urlModel[totallenindex]
                                                .flickerUrl
                                                .toString()),
                                      ],
                                    )),
                        ],
                      );
                    }),
                  ),
                ),
              );
      },
    );
  }
}
