part of './home_imports.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    Provider.of<GetLocalCatProvider>(context, listen: false).getCat();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          searchWidget(context),
          displayList(),
        ]),
      )),
    );
  }
}
