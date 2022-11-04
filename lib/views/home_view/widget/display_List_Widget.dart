part of '../home_imports.dart';

Widget displayList() {
  return Column(
    children: [
      Row(
        children: [
          Row(
            children: [
              FancyShimmerImage(
                  height: 40,
                  width: 40,
                  errorWidget: Image.network(AppStrings.error_String),
                  imageUrl: AppStrings.Url_____Image___String),
              const SizedBox(
                width: 10,
              ),
              FancyShimmerImage(
                  height: 40,
                  width: 40,
                  errorWidget: Image.network(AppStrings.error_String),
                  imageUrl: AppStrings.Caption____Image___String),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            height: 40,
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(
                    parent: NeverScrollableScrollPhysics()),
                itemBuilder: ((context, index) {
                  return Row(
                    children: [
                      FancyShimmerImage(
                          height: 40,
                          width: 40,
                          errorWidget: Image.network(AppStrings.error_String),
                          imageUrl: AppStrings.Caption____Image___String),
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
      SizedBox(
        height: 200,
        child: FancyShimmerImage(
            errorWidget: Image.network(AppStrings.error_String),
            imageUrl:
                "https://media-whichmedia.s3.ap-southeast-1.amazonaws.com/media/large/e/1/e1068d5affe5.jpeg"),
      ),
    ],
  );
}
