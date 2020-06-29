import 'package:Covid19_Tracker/pages/DistrictData.dart';
import 'services.dart';
import 'package:flutter/material.dart';

class SearchState extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: theme.primaryColor,
      primaryIconTheme: theme.primaryIconTheme,
      primaryColorBrightness: theme.primaryColorBrightness,
      primaryTextTheme: theme.primaryTextTheme,
    );
  }

  List<DistrictData> DistrictList;

  SearchState(this.DistrictList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          }),
    ];
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Services.getData().then((DistrictData) {
      DistrictList = DistrictData;
    });
    final SuggestionList = query.isEmpty
        ? DistrictList
        : DistrictList.where((element) =>
            element.state.toString().toLowerCase().startsWith(query)).toList();

    return ListView.builder(
      itemCount: SuggestionList.length,
      itemBuilder: (context, index) {
        DistrictData data = SuggestionList[index];
        return ListTile(
          title: Text(data.state),
          subtitle: Text(data.statecode),
        );
      },
    );
    throw UnimplementedError();
  }
}
