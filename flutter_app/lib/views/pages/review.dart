import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/views/components/rating_bar.dart';
import 'package:flutter_app/views/components/rating_percentage.dart';
import 'package:flutter_app/views/components/review_card.dart';
import 'package:flutter_app/views/utils/spacer.dart';

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _review = TextEditingController();

  CourseDetail? _detail;

  List<Rating> _reviews = [];
  int _index = 0;
  int _offset = 9;

  bool isLoading = false;

  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      _detail = ModalRoute.of(context)!.settings.arguments as CourseDetail;
      _handleLoading();
    }
    super.didChangeDependencies();
  }

  void _handleLoading() {
    if (_index < _detail!.ratings!.ratingList!.length) {
      _reviews.addAll(_detail!.ratings!.ratingList!.sublist(
          _index, min(_index + _offset, _detail!.ratings!.ratingList!.length)));
      _index += _offset + 1;
    }
  }

  Future _loadReviews() async {
    await new Future.delayed(new Duration(seconds: 2));

    setState(() {
      _handleLoading();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Review'),
        centerTitle: true,
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (!isLoading &&
              notification.metrics.pixels ==
                  notification.metrics.maxScrollExtent) {
            _loadReviews();
            // start loading data
            setState(() {
              isLoading = true;
            });
          }
          return true;
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 150.0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _detail!.averagePoint.toString(),
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          '(${_detail!.ratedNumber} ratings)',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${_detail!.formalityPoint} Formality',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Text(
                              '${_detail!.contentPoint} Content',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Text(
                              '${_detail!.presentationPoint} Presentation',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RatingPercentageBar(
                                value: 5,
                                percent:
                                    _detail!.ratings!.stars![4].toDouble() /
                                        100),
                            RatingPercentageBar(
                                value: 4,
                                percent:
                                    _detail!.ratings!.stars![3].toDouble() /
                                        100),
                            RatingPercentageBar(
                                value: 3,
                                percent:
                                    _detail!.ratings!.stars![2].toDouble() /
                                        100),
                            RatingPercentageBar(
                                value: 2,
                                percent:
                                    _detail!.ratings!.stars![1].toDouble() /
                                        100),
                            RatingPercentageBar(
                                value: 1,
                                percent:
                                    _detail!.ratings!.stars![0].toDouble() /
                                        100),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Review course',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: RatingBar(
                        color: Colors.yellow,
                        rate: 0,
                        reactable: true,
                        stars: 5,
                      ),
                    ),
                    Container(
                      height: 150.0,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(18.0)),
                        color: Color.fromRGBO(44, 49, 55, 1),
                      ),
                      child: TextFormField(
                        maxLength: 400,
                        controller: _review,
                        keyboardType: TextInputType.text,
                        maxLines: null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 0.0,
                          ),
                          hintText: 'Enter review...',
                        ),
                      ),
                    ),
                    Container(
                      height: 40.0,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => {},
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.redAccent),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                              child: Text('Cancel'),
                            ),
                          ),
                          HorizontalSpacer(distance: 8.0),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                ),
                              ),
                              child: Text('Send'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Reviews from learners',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    _reviews.isNotEmpty
                        ? ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => ReviewCard(
                              name: _reviews[index].user!.name.toString(),
                              image: Image.network(
                                  _reviews[index].user!.avatar.toString()),
                              rate: _reviews[index].averagePoint!.toDouble(),
                              date: _reviews[index].updatedAt.toString(),
                              review: _reviews[index].content.toString(),
                            ),
                            itemCount: _reviews.length,
                          )
                        : Container(
                            margin: EdgeInsets.symmetric(vertical: 32.0),
                            child: Center(
                              child: Text(
                                "This course have not been reviewed",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                          ),
                    Container(
                      height: isLoading ? 50.0 : 0,
                      color: Colors.transparent,
                      child: Center(
                        child: new CircularProgressIndicator(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
