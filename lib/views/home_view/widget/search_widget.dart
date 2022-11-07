part of '../home_imports.dart';

Widget searchWidget(BuildContext context) {
  var width = MediaQuery.of(context).size.width / 100;
  var height = MediaQuery.of(context).size.height / 100;
  String? id;

  return Center(
    child: Center(child: Consumer<GetLocalCatProvider>(
      builder: (context, v, child) {
        return Autocomplete<CategoriesByID>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            return v.dataGetList
                .where((CategoriesByID county) => county.catName!
                    .toLowerCase()
                    .startsWith(textEditingValue.text.toLowerCase()))
                .toList();
          },
          displayStringForOption: (CategoriesByID option) => option.catName!,
          fieldViewBuilder: (BuildContext context,
              TextEditingController fieldTextEditingController,
              FocusNode fieldFocusNode,
              VoidCallback onFieldSubmitted) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 7.2 * height,
                  width: 70.65 * width,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.shade200),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: "Select Categories",
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                    ),
                    controller: fieldTextEditingController,
                    focusNode: fieldFocusNode,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Provider.of<GetResultProvider>(context, listen: false)
                          .searchGetCatProvider(
                              catId: id, queryType: "getImagesByCats");
                    },
                    child: const Text("Search"))
              ],
            );
          },
          onSelected: (CategoriesByID selection) {
            id = selection.id;
          },
          optionsViewBuilder: (BuildContext context,
              AutocompleteOnSelected<CategoriesByID> onSelected,
              Iterable<CategoriesByID> options) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Material(
                  elevation: 0.5,
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    width: 230,
                    height: 130,
                    color: Colors.white,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(10.0),
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        CategoriesByID option = options.elementAt(index);

                        return GestureDetector(
                          onTap: () {
                            onSelected(option);
                          },
                          child: Column(
                            children: [
                              const Divider(
                                height: 1,
                                color: Colors.black,
                                thickness: 1,
                              ),
                              SizedBox(
                                height: 40,
                                child: Center(
                                  child: Text(option.catName!,
                                      textAlign: TextAlign.center,
                                      style:
                                          const TextStyle(color: Colors.black)),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    )),
  );
}
