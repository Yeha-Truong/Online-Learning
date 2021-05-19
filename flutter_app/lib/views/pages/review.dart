import 'package:flutter/material.dart';
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

  List<dynamic> _reviews = [];
  bool isLoading = false;

  Future _loadReviews() async {
    await new Future.delayed(new Duration(seconds: 2));

    setState(() {
      Map<String, dynamic> review = {
        'name': 'Takodachi',
        'image': Image.asset('assets/default/takodachi.png'),
        'rate': 5.0,
        'date': 'Tuesday 18 May 2021',
        'review':
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum mollis massa tellus. Maecenas tempor luctus euismod. Vivamus nec efficitur turpis. Duis nisl arcu, luctus vel quam non, vehicula fermentum quam. Cras tincidunt ligula eget maximus vehicula. Nam aliquet metus eu metus blandit, et efficitur quam feugiat. Phasellus tristique est purus, sed pellentesque ipsum egestas vel. Nulla et vestibulum est. Nullam maximus mi ac neque sagittis, vestibulum mattis dui dapibus. In mollis orci vitae sem ornare, et fermentum ipsum hendrerit. Duis non accumsan elit, nec condimentum nibh. Mauris sed risus odio.'
      };
      _reviews.addAll([review, review, review]);
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
                          '4.8',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          '(2 ratings)',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '5.0 Formality',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Text(
                              '4.5 Content',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Text(
                              '5.0 Presentation',
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
                            RatingPercentageBar(value: 5, percent: 0.89),
                            RatingPercentageBar(value: 4, percent: 0.05),
                            RatingPercentageBar(value: 3, percent: 0.03),
                            RatingPercentageBar(value: 2, percent: 0.02),
                            RatingPercentageBar(value: 1, percent: 0.01),
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
                        rate: 5,
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
                              name: _reviews[index]['name'],
                              image: _reviews[index]['image'],
                              rate: _reviews[index]['rate'],
                              date: _reviews[index]['date'],
                              review: _reviews[index]['review'],
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
