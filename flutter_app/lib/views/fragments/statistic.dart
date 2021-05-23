import 'package:flutter/material.dart';
import 'package:flutter_app/provider/user_provider.dart';
import 'package:flutter_app/views/components/category_tag.dart';
import 'package:flutter_app/views/utils/spacer.dart';
import 'package:provider/provider.dart';

class StatisticFragment extends StatefulWidget {
  @override
  _StatisticFragmentState createState() => _StatisticFragmentState();
}

class _StatisticFragmentState extends State<StatisticFragment> {
  late UserProvider _userProvider;
  @override
  didChangeDependencies() {
    _userProvider = Provider.of<UserProvider>(context, listen: true);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            child: GestureDetector(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.keyboard_arrow_left,
                    size: 32.0,
                  ),
                  Text('Home'),
                ],
              ),
              onTap: () => Navigator.pop(context),
            ),
          ),
        ),
        leadingWidth: 400.0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 32.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: ClipRRect(
                        child: _userProvider.user.avatar != null
                            ? Image.network(
                                _userProvider.user.avatar.toString())
                            : Image(
                                image:
                                    AssetImage('assets/default/takodachi.png')),
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                      radius: 80.0,
                    ),
                    VerticalSpacer(distance: 16.0),
                    Text(
                      _userProvider.user.name != null
                          ? _userProvider.user.name.toString()
                          : "Guest",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ),
            ),
            VerticalSpacer(distance: 32.0),
            if (_userProvider.user.id != null)
              Container(
                margin: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Interests',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    VerticalSpacer(distance: 8.0),
                    _userProvider.user.favoriteCategories!.isNotEmpty
                        ? Container(
                            height: 36.0,
                            child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Container(
                                child: CategoryTag(
                                    title: _userProvider
                                        .user.favoriteCategories![index]),
                                margin: EdgeInsets.all(2.0),
                              ),
                              separatorBuilder: (context, index) => Divider(),
                              itemCount:
                                  _userProvider.user.favoriteCategories!.length,
                            ),
                          )
                        : Center(
                            child: Text(
                              'Empty',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                    VerticalSpacer(distance: 24.0),
                    Text(
                      'User information',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    VerticalSpacer(distance: 16.0),
                    Text(
                      'PHONE NUMBER',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    VerticalSpacer(distance: 8.0),
                    Text(
                      _userProvider.user.phone != null
                          ? _userProvider.user.phone.toString()
                          : '',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    VerticalSpacer(distance: 16.0),
                    Text(
                      'ACCOUNT TYPE',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    VerticalSpacer(distance: 8.0),
                    Text(
                      _userProvider.user.type.toString(),
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
