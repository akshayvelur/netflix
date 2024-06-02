import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/common/utils.dart';
import 'package:netflix/models/search_model.dart';
import 'package:netflix/services/api.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  Api apiservices = Api();
  SearchModel? searchModel = null;

  void search(String query) {
    apiservices.getSearchMovies(query).then((results) {
      setState(() {
        searchModel = results;
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CupertinoSearchTextField(
              padding: EdgeInsets.all(10),
              controller: searchController,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon: Icon(
                Icons.cancel,
                color: Colors.grey,
              ),
              style: TextStyle(color: Colors.white),
              backgroundColor: Colors.grey.withOpacity(0.3),
              onChanged: (value) {
                if (value.isEmpty) {
                } else {
                  search(searchController.text);
                }
              },
            ),
            searchModel == null
                ? const SizedBox.shrink()
                : GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: searchModel?.results.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 5,
                        childAspectRatio: 1.2 / 2),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          searchModel!.results[index].backdropPath == null
                              ? Image.asset(
                                  "assets/netflix.png",
                                  height: 170,
                                )
                              : CachedNetworkImage(
                                  imageUrl:
                                      "${imageUrl}${searchModel!.results[index].backdropPath}",
                                  height: 170,
                                ),
                          SizedBox(
                            width: 100,
                            child: Text(
                              searchModel!.results[index].name,
                              style: TextStyle(fontSize: 14),
                              maxLines: 2,
                            ),
                          )
                        ],
                      );
                    })
          ],
        ),
      ),
    ));
  }
}
