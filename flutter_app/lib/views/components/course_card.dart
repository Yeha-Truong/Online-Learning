import 'package:flutter/material.dart';
import 'package:flutter_app/models/course_detail.dart';
import 'package:flutter_app/views/utils/spacer.dart';
import 'package:flutter_app/views/components/rating_bar.dart';

class CourseCard extends StatelessWidget {
  final ImageProvider<Object> image;
  final String title;
  final String author;
  final String level;
  final String date;
  final String time;
  final double rating;
  final int votes;

  const CourseCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.author,
      required this.level,
      required this.date,
      required this.time,
      required this.rating,
      required this.votes})
      : super(key: key);

  _view(context) {
    var data = {
      "id": "e9a30d73-7c15-42c8-8fef-786888f50da8",
      "title": "Học React Hooks cơ bản (2020)",
      "subtitle": "Đây là loạt video giúp bạn hiểu rõ hơn về React Hooks",
      "price": 0,
      "description":
          "React hooks ra đời đã giúp functional component trở nên powerful hơn bao giờ hết! 😍Trước đây khi cần dùng đến các tính năng của React như state, life cycle thì mình bắt buộc phải dùng class component. Nhưng giờ thì đã khác, có hooks, functional component như hổ mọc thêm cánh, có thể xử lý được state, life cycle và những thứ khác của React một cách êm đềm.\n\nCùng mình xem hết videos để khám phá những điều thú vị từ React hooks nhé! 😉",
      "requirement": ["Có đam mê với lập trình web"],
      "learnWhat": ["Kiến thức cơ bản về React Hooks"],
      "soldNumber": 14,
      "ratedNumber": 1,
      "videoNumber": 16,
      "totalHours": 3.9200000000000004,
      "formalityPoint": 5,
      "contentPoint": 5,
      "presentationPoint": 5,
      "imageUrl":
          "https://storage.googleapis.com/letstudy/Courses/e9a30d73-7c15-42c8-8fef-786888f50da8/avatar/0fcecb4c-b7f7-4de4-b830-64bbd2837e31.png",
      "promoVidUrl":
          "https://storage.googleapis.com/letstudy/Courses/e9a30d73-7c15-42c8-8fef-786888f50da8/promo/104b18d2-7c06-4d91-9311-052ab238c7f5.mp4",
      "status": "COMPLETED",
      "isHidden": false,
      "createdAt": "2021-03-05T03:07:32.311Z",
      "updatedAt": "2021-05-02T10:48:50.244Z",
      "instructorId": "d062ad73-6c7d-480c-8285-1baa99b96d17",
      "typeUploadVideoLesson": 2,
      "section": [
        {
          "id": "886f635b-0fae-47c6-926e-d21a46c30e65",
          "courseId": "e9a30d73-7c15-42c8-8fef-786888f50da8",
          "numberOrder": 1,
          "name": "Học React Hooks cơ bản",
          "isDeleted": false,
          "createdAt": "2021-03-05T03:15:25.369Z",
          "updatedAt": "2021-03-05T03:15:25.369Z",
          "lesson": [
            {
              "id": "67b52264-7ada-4c12-8ba2-696d3ca579aa",
              "courseId": "e9a30d73-7c15-42c8-8fef-786888f50da8",
              "sectionId": "886f635b-0fae-47c6-926e-d21a46c30e65",
              "numberOrder": 6,
              "name": "Giới thiệu tổng quát về React Hooks (2020)",
              "content": null,
              "videoName": null,
              "videoUrl": "https://youtube.com/embed/unFHsn0qSMA",
              "captionName": null,
              "hours": 0.14,
              "isPreview": false,
              "isPublic": true,
              "isDeleted": false,
              "createdAt": "2021-03-05T03:15:57.613Z",
              "updatedAt": "2021-03-05T03:31:45.494Z"
            },
            {
              "id": "41eabb3d-3eca-438f-9c21-3e4cc42d268e",
              "courseId": "e9a30d73-7c15-42c8-8fef-786888f50da8",
              "sectionId": "886f635b-0fae-47c6-926e-d21a46c30e65",
              "numberOrder": 7,
              "name": "Setup project với create react app (2020)",
              "content": null,
              "videoName": null,
              "videoUrl": "https://youtube.com/embed/7beJYPZefyE",
              "captionName": null,
              "hours": 0.23,
              "isPreview": false,
              "isPublic": true,
              "isDeleted": false,
              "createdAt": "2021-03-05T03:19:55.815Z",
              "updatedAt": "2021-03-05T03:31:45.494Z"
            },
            {
              "id": "ffb85a30-a905-40da-b7a0-283e33ccdfcb",
              "courseId": "e9a30d73-7c15-42c8-8fef-786888f50da8",
              "sectionId": "886f635b-0fae-47c6-926e-d21a46c30e65",
              "numberOrder": 8,
              "name": "useState() và điều cần lưu ý 😊 (2020)",
              "content": null,
              "videoName": null,
              "videoUrl": "https://youtube.com/embed/_D16z1kL0wo",
              "captionName": null,
              "hours": 0.2,
              "isPreview": false,
              "isPublic": true,
              "isDeleted": false,
              "createdAt": "2021-03-05T03:20:52.187Z",
              "updatedAt": "2021-03-05T03:31:45.494Z"
            },
            {
              "id": "a8ad7682-5e95-4db3-ae9f-a460f05baa77",
              "courseId": "e9a30d73-7c15-42c8-8fef-786888f50da8",
              "sectionId": "886f635b-0fae-47c6-926e-d21a46c30e65",
              "numberOrder": 9,
              "name": "Dùng useState() qua ví dụ đơn giản (2020)",
              "content": null,
              "videoName": null,
              "videoUrl": "https://youtube.com/embed/SIAGpAaLSaI",
              "captionName": null,
              "hours": 0.34,
              "isPreview": false,
              "isPublic": true,
              "isDeleted": false,
              "createdAt": "2021-03-05T03:21:25.431Z",
              "updatedAt": "2021-03-05T03:31:45.494Z"
            },
            {
              "id": "1c7e9c49-afb7-46c4-9507-a8877f69032e",
              "courseId": "e9a30d73-7c15-42c8-8fef-786888f50da8",
              "sectionId": "886f635b-0fae-47c6-926e-d21a46c30e65",
              "numberOrder": 10,
              "name": "useState() qua ví dụ TodoList (2020)",
              "content": null,
              "videoName": null,
              "videoUrl": "https://youtube.com/embed/G27sfcWlMzc",
              "captionName": null,
              "hours": 0.28,
              "isPreview": false,
              "isPublic": true,
              "isDeleted": false,
              "createdAt": "2021-03-05T03:21:53.437Z",
              "updatedAt": "2021-03-05T03:31:45.494Z"
            },
            {
              "id": "fc8fd193-f8e7-4928-9595-5f3c5a3a49c5",
              "courseId": "e9a30d73-7c15-42c8-8fef-786888f50da8",
              "sectionId": "886f635b-0fae-47c6-926e-d21a46c30e65",
              "numberOrder": 11,
              "name": "useState() qua ví dụ TodoForm (2020)",
              "content": null,
              "videoName": null,
              "videoUrl": "https://youtube.com/embed/HbERbcazLhY",
              "captionName": null,
              "hours": 0.3,
              "isPreview": false,
              "isPublic": true,
              "isDeleted": false,
              "createdAt": "2021-03-05T03:22:42.334Z",
              "updatedAt": "2021-03-05T03:31:45.494Z"
            },
            {
              "id": "5beb612b-3c11-4fd6-aea3-864f713b2f29",
              "courseId": "e9a30d73-7c15-42c8-8fef-786888f50da8",
              "sectionId": "886f635b-0fae-47c6-926e-d21a46c30e65",
              "numberOrder": 12,
              "name": "Những điều cần biết về useEffect hooks 🎉",
              "content": null,
              "videoName": null,
              "videoUrl": "https://youtube.com/embed/zjUC_W7IOIc",
              "captionName": null,
              "hours": 0.24,
              "isPreview": false,
              "isPublic": true,
              "isDeleted": false,
              "createdAt": "2021-03-05T03:23:17.967Z",
              "updatedAt": "2021-03-05T03:31:45.494Z"
            },
            {
              "id": "3599cf06-521e-41f6-b533-89a97b68d517",
              "courseId": "e9a30d73-7c15-42c8-8fef-786888f50da8",
              "sectionId": "886f635b-0fae-47c6-926e-d21a46c30e65",
              "numberOrder": 13,
              "name": "Gọi API với useEffect hooks (2020) 🎉",
              "content": null,
              "videoName": null,
              "videoUrl": "https://youtube.com/embed/4a1_is2OdLY",
              "captionName": null,
              "hours": 0.25,
              "isPreview": false,
              "isPublic": true,
              "isDeleted": false,
              "createdAt": "2021-03-05T03:24:56.391Z",
              "updatedAt": "2021-03-05T03:31:45.494Z"
            },
            {
              "id": "f5e193a3-134b-4e95-9e69-b7a5fc8b4c3f",
              "courseId": "e9a30d73-7c15-42c8-8fef-786888f50da8",
              "sectionId": "886f635b-0fae-47c6-926e-d21a46c30e65",
              "numberOrder": 14,
              "name": "Pagination với useEffect hooks (2020) 😍",
              "content": null,
              "videoName": null,
              "videoUrl": "https://youtube.com/embed/jwfjgRBcUgE",
              "captionName": null,
              "hours": 0.29,
              "isPreview": false,
              "isPublic": true,
              "isDeleted": false,
              "createdAt": "2021-03-05T03:25:38.782Z",
              "updatedAt": "2021-03-05T03:31:45.494Z"
            },
            {
              "id": "2c830aa4-6f22-42d2-87c8-7cbdf10de760",
              "courseId": "e9a30d73-7c15-42c8-8fef-786888f50da8",
              "sectionId": "886f635b-0fae-47c6-926e-d21a46c30e65",
              "numberOrder": 15,
              "name": "useEffect search có debounce 😍 (2020)",
              "content": null,
              "videoName": null,
              "videoUrl": "https://youtube.com/embed/WF3pUtvC01M",
              "captionName": null,
              "hours": 0.29,
              "isPreview": false,
              "isPublic": true,
              "isDeleted": false,
              "createdAt": "2021-03-05T03:26:14.716Z",
              "updatedAt": "2021-03-05T03:31:45.494Z"
            },
            {
              "id": "de6c3ab6-5077-4af9-a31e-681fe98ec80a",
              "courseId": "e9a30d73-7c15-42c8-8fef-786888f50da8",
              "sectionId": "886f635b-0fae-47c6-926e-d21a46c30e65",
              "numberOrder": 16,
              "name": "useEffect cleanup với code đồng hồ (2020)",
              "content": null,
              "videoName": null,
              "videoUrl": "https://youtube.com/embed/QbC4LwsD1rw",
              "captionName": null,
              "hours": 0.22,
              "isPreview": false,
              "isPublic": true,
              "isDeleted": false,
              "createdAt": "2021-03-05T03:26:54.757Z",
              "updatedAt": "2021-03-05T03:31:45.494Z"
            }
          ],
          "sumHours": 2.7800000000000002,
          "sumLessonFinish": 0
        },
        {
          "id": "b0f1d452-46ed-4b11-a7c1-b89f1f9a1286",
          "courseId": "e9a30d73-7c15-42c8-8fef-786888f50da8",
          "numberOrder": 4,
          "name": "Custom React Hooks",
          "isDeleted": false,
          "createdAt": "2021-03-05T03:28:54.581Z",
          "updatedAt": "2021-03-05T03:28:54.581Z",
          "lesson": [
            {
              "id": "89008555-af76-4ad3-8f98-36e4d8704344",
              "courseId": "e9a30d73-7c15-42c8-8fef-786888f50da8",
              "sectionId": "b0f1d452-46ed-4b11-a7c1-b89f1f9a1286",
              "numberOrder": 1,
              "name": "Giới thiệu tổng quát custom hooks (2020) 🚀",
              "content": null,
              "videoName": null,
              "videoUrl": "https://youtube.com/embed/8Ee__cUapdg",
              "captionName": null,
              "hours": 0.18,
              "isPreview": false,
              "isPublic": true,
              "isDeleted": false,
              "createdAt": "2021-03-05T03:29:19.567Z",
              "updatedAt": "2021-03-05T03:29:29.653Z"
            },
            {
              "id": "500ad6ac-c13d-4b1f-ba9a-9126c157bf7a",
              "courseId": "e9a30d73-7c15-42c8-8fef-786888f50da8",
              "sectionId": "b0f1d452-46ed-4b11-a7c1-b89f1f9a1286",
              "numberOrder": 2,
              "name": "Code custom hooks useClock() 🎉 (2020)",
              "content": null,
              "videoName": null,
              "videoUrl": "https://youtube.com/embed/hub6_EzgeIg",
              "captionName": null,
              "hours": 0.18,
              "isPreview": false,
              "isPublic": true,
              "isDeleted": false,
              "createdAt": "2021-03-05T03:29:48.250Z",
              "updatedAt": "2021-03-05T03:29:55.780Z"
            },
            {
              "id": "0065ff45-eea0-44dc-b835-e8273015b1cb",
              "courseId": "e9a30d73-7c15-42c8-8fef-786888f50da8",
              "sectionId": "b0f1d452-46ed-4b11-a7c1-b89f1f9a1286",
              "numberOrder": 3,
              "name": "Code a custom hooks from scratch (2020) 🎉",
              "content": null,
              "videoName": null,
              "videoUrl": "https://youtube.com/embed/k2P78S4YllE",
              "captionName": null,
              "hours": 0.27,
              "isPreview": false,
              "isPublic": true,
              "isDeleted": false,
              "createdAt": "2021-03-05T03:30:12.816Z",
              "updatedAt": "2021-03-05T03:30:21.796Z"
            }
          ],
          "sumHours": 0.63,
          "sumLessonFinish": 0
        },
        {
          "id": "ec822899-e47f-4787-8654-55fe58b48dd7",
          "courseId": "e9a30d73-7c15-42c8-8fef-786888f50da8",
          "numberOrder": 5,
          "name": "Memoization và React.memo",
          "isDeleted": false,
          "createdAt": "2021-03-05T03:31:03.589Z",
          "updatedAt": "2021-03-05T03:31:03.589Z",
          "lesson": [
            {
              "id": "244c59c6-aa1f-4bfa-8df1-ac05d88a0f5c",
              "courseId": "e9a30d73-7c15-42c8-8fef-786888f50da8",
              "sectionId": "ec822899-e47f-4787-8654-55fe58b48dd7",
              "numberOrder": 4,
              "name": "Giới thiệu Memoization và React.memo (2020) 🎉",
              "content": null,
              "videoName": null,
              "videoUrl": "https://youtube.com/embed/EGVhrE6VuNM",
              "captionName": null,
              "hours": 0.28,
              "isPreview": false,
              "isPublic": true,
              "isDeleted": false,
              "createdAt": "2021-03-05T03:31:18.487Z",
              "updatedAt": "2021-03-05T03:31:25.957Z"
            },
            {
              "id": "498799a9-de15-46c9-b814-6fe4d395208f",
              "courseId": "e9a30d73-7c15-42c8-8fef-786888f50da8",
              "sectionId": "ec822899-e47f-4787-8654-55fe58b48dd7",
              "numberOrder": 5,
              "name": "So sánh useCallback và useMemo 😎 (2020)",
              "content": null,
              "videoName": null,
              "videoUrl": "https://youtube.com/embed/quS95gJdxsc",
              "captionName": null,
              "hours": 0.23,
              "isPreview": false,
              "isPublic": true,
              "isDeleted": false,
              "createdAt": "2021-03-05T03:31:45.498Z",
              "updatedAt": "2021-03-05T03:31:54.854Z"
            }
          ],
          "sumHours": 0.51,
          "sumLessonFinish": 0
        }
      ],
      "ratings": {
        "ratingList": [
          {
            "id": "29e25f07-acd1-4e21-ba83-0a1ba9a34e1e",
            "userId": "d41a5ef1-dc73-47c8-be9b-34e48c73d4b2",
            "courseId": "e9a30d73-7c15-42c8-8fef-786888f50da8",
            "formalityPoint": 5,
            "contentPoint": 5,
            "presentationPoint": 5,
            "content": "Thầy dạy hay quá <3",
            "createdAt": "2021-03-05T03:36:32.757Z",
            "updatedAt": "2021-03-05T03:36:32.757Z",
            "user": {
              "id": "d41a5ef1-dc73-47c8-be9b-34e48c73d4b2",
              "email": "fxqtai@gmail.com",
              "avatar":
                  "https://lh4.googleusercontent.com/-Y8G9ePcrKig/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuclMTgSK5-FDpwwFTLtw72XhFimWMA/s96-c/photo.jpg",
              "name": "Trịnh Tấn Tài"
            },
            "averagePoint": 5
          }
        ],
        "stars": [0, 0, 0, 0, 100]
      },
      "averagePoint": "5.0",
      "instructor": {
        "id": "d062ad73-6c7d-480c-8285-1baa99b96d17",
        "userId": "858af660-a953-4b9e-a676-8de1ac50d921",
        "name": "Nguyễn Văn Hậu",
        "email": "paulnguyen.mn@gmail.com",
        "avatar":
            "https://storage.googleapis.com/letstudy/Avatar/aecc74af-7d2a-4d3c-af5e-76fe0104bb29.jpg",
        "phone": "0925726732",
        "major": "Web Developer",
        "intro":
            "Với mong muốn được chia sẻ những kinh nghiệm của mình trong quãng thời gian đi code dự án thực tế một cách đơn giản, hiệu quả và vui vui một tí, nên bạn nào quan tâm tới phần Frontend (HTML/CSS/JS/ReactJS) thì có thể subscribe để được cập nhật các video mới nhất nhé.\n\nHiện mình đang có làm một vài playlist có các chủ đề như: \n\n- Học HTML/CSS cơ bản \n- Học lập trình Javascript cơ bản \n- Học ReactJS dễ hiểu \n- Kinh nghiệm khi đi code - nơi chia sẻ các tips hay hoặc kinh nghiệm hay mình có được từ thực tế đi làm.\n\nHi vọng được mọi người ủng hộ nhiệt tình! ❤️\n\n-----\n❤️Ủng hộ mình làm videos thì đóng góp tại đây nhé: https://unghotoi.com/easyfrontend\n\nKết nối với mình: \n- 🎉Facebook: https://www.facebook.com/learn.easyfrontend\n- 🚀Tham gia nhóm trên Facebook: https://www.facebook.com/groups/easyfrontend\n- 💻Github: https://github.com/paulnguyen-mn\n- 💼 LinkedIn: https://www.linkedin.com/in/haunguyenmn/",
        "skills": ["Front-end"],
        "createdAt": "2021-03-05T03:01:46.048Z",
        "updatedAt": "2021-04-10T03:10:32.344Z",
        "totalCourse": 4,
        "averagePoint": 5,
        "countRating": 1,
        "ratedNumber": 1,
        "soldNumber": 31,
        "courses": [
          {
            "id": "849e1a5e-c159-4277-9504-51b52b59ae2f",
            "title": "Thực hành Redux qua dự án Photo App",
            "subtitle":
                "Khoá thực hành với react redux qua Mini Project Photo App",
            "price": 0,
            "description":
                "Cùng mình khám phá cách tổ chức files trong reactjs redux project như thế nào cho hiệu quả nhé! 😍",
            "requirement": ["Có kiến thức cơ bản về redux reactjs"],
            "learnWhat": ["Kinh nghiệm làm dự án với react redux"],
            "soldNumber": 3,
            "ratedNumber": 0,
            "videoNumber": 18,
            "totalHours": 5.26,
            "formalityPoint": 0,
            "contentPoint": 0,
            "presentationPoint": 0,
            "imageUrl":
                "https://storage.googleapis.com/letstudy/Courses/849e1a5e-c159-4277-9504-51b52b59ae2f/avatar/cdeadcfb-6d56-4674-bdda-53b29dda9b87.png",
            "promoVidUrl": null,
            "status": "COMPLETED",
            "isHidden": false,
            "createdAt": "2021-03-07T09:57:34.433Z",
            "updatedAt": "2021-04-04T07:36:25.096Z",
            "instructorId": "d062ad73-6c7d-480c-8285-1baa99b96d17",
            "typeUploadVideoLesson": 2
          },
          {
            "id": "2610dc50-eb40-48df-9522-b34fbe1c30a3",
            "title": "🚀 Học redux cơ bản 2020",
            "subtitle": "Khoá học giúp bạn hiểu rõ hơn về redux",
            "price": 0,
            "description":
                "Quá bối rối khi mới học redux, hãy cùng mình xem video này để hiểu được cuối cùng ông thần Redux này là cái chi chi nha 🤣",
            "requirement": ["Có đam mê với lập trình web"],
            "learnWhat": ["Tìm hiểu về Redux"],
            "soldNumber": 7,
            "ratedNumber": 0,
            "videoNumber": 12,
            "totalHours": 4.540000000000001,
            "formalityPoint": 0,
            "contentPoint": 0,
            "presentationPoint": 0,
            "imageUrl":
                "https://storage.googleapis.com/letstudy/Courses/2610dc50-eb40-48df-9522-b34fbe1c30a3/avatar/28f7ee0f-08ef-4b98-8301-f8c3a73cc83f.png",
            "promoVidUrl":
                "https://storage.googleapis.com/letstudy/Courses/2610dc50-eb40-48df-9522-b34fbe1c30a3/promo/d27d9ea5-33ac-4811-8abc-52265e154b6d.mp4",
            "status": "COMPLETED",
            "isHidden": false,
            "createdAt": "2021-03-05T03:38:58.762Z",
            "updatedAt": "2021-04-09T08:28:52.605Z",
            "instructorId": "d062ad73-6c7d-480c-8285-1baa99b96d17",
            "typeUploadVideoLesson": 2
          },
          {
            "id": "e9a30d73-7c15-42c8-8fef-786888f50da8",
            "title": "Học React Hooks cơ bản (2020)",
            "subtitle": "Đây là loạt video giúp bạn hiểu rõ hơn về React Hooks",
            "price": 0,
            "description":
                "React hooks ra đời đã giúp functional component trở nên powerful hơn bao giờ hết! 😍Trước đây khi cần dùng đến các tính năng của React như state, life cycle thì mình bắt buộc phải dùng class component. Nhưng giờ thì đã khác, có hooks, functional component như hổ mọc thêm cánh, có thể xử lý được state, life cycle và những thứ khác của React một cách êm đềm.\n\nCùng mình xem hết videos để khám phá những điều thú vị từ React hooks nhé! 😉",
            "requirement": ["Có đam mê với lập trình web"],
            "learnWhat": ["Kiến thức cơ bản về React Hooks"],
            "soldNumber": 14,
            "ratedNumber": 1,
            "videoNumber": 16,
            "totalHours": 3.9200000000000004,
            "formalityPoint": 5,
            "contentPoint": 5,
            "presentationPoint": 5,
            "imageUrl":
                "https://storage.googleapis.com/letstudy/Courses/e9a30d73-7c15-42c8-8fef-786888f50da8/avatar/0fcecb4c-b7f7-4de4-b830-64bbd2837e31.png",
            "promoVidUrl":
                "https://storage.googleapis.com/letstudy/Courses/e9a30d73-7c15-42c8-8fef-786888f50da8/promo/104b18d2-7c06-4d91-9311-052ab238c7f5.mp4",
            "status": "COMPLETED",
            "isHidden": false,
            "createdAt": "2021-03-05T03:07:32.311Z",
            "updatedAt": "2021-05-02T10:48:50.244Z",
            "instructorId": "d062ad73-6c7d-480c-8285-1baa99b96d17",
            "typeUploadVideoLesson": 2
          },
          {
            "id": "ccc51cd9-ee97-4e58-8f27-5e0b35d75cc2",
            "title": "✅ Học lập trình javascript cơ bản",
            "subtitle": "khoá học danh cho người mới bắt đầu với javascript",
            "price": 0,
            "description": "Hãy cùng mình tìm hiểu cơ bản về javascript nhé",
            "requirement": ["Có đam mê với lập trình web"],
            "learnWhat": ["Lập trình JS căn bản "],
            "soldNumber": 7,
            "ratedNumber": 0,
            "videoNumber": 9,
            "totalHours": 1.7899999999999998,
            "formalityPoint": 0,
            "contentPoint": 0,
            "presentationPoint": 0,
            "imageUrl":
                "https://storage.googleapis.com/letstudy/Courses/ccc51cd9-ee97-4e58-8f27-5e0b35d75cc2/avatar/94321d65-6f20-497c-bcef-3673ff928027.png",
            "promoVidUrl": null,
            "status": "COMPLETED",
            "isHidden": false,
            "createdAt": "2021-03-07T10:30:52.940Z",
            "updatedAt": "2021-04-21T03:12:18.821Z",
            "instructorId": "d062ad73-6c7d-480c-8285-1baa99b96d17",
            "typeUploadVideoLesson": 2
          }
        ]
      },
      "coursesLikeCategory": [
        {
          "id": "b96c20dc-4baf-4f4c-b710-ad190fbcee2f",
          "title": "Học lập trình PHP&MySQL",
          "subtitle": "học lập trình PHP & MYSQL qua ví dụ thực tế",
          "price": 0,
          "description":
              "Lập trình thiết kế trang web tin tức VnExpress.Net bằng PHP và MYSQL",
          "requirement": ["kiến thức căn bản về web"],
          "learnWhat": ["Tìm hiểu PHP và MYSQL"],
          "soldNumber": 1,
          "ratedNumber": 0,
          "videoNumber": 32,
          "totalHours": 6.26,
          "formalityPoint": 0,
          "contentPoint": 0,
          "presentationPoint": 0,
          "imageUrl":
              "https://storage.googleapis.com/letstudy/Courses/b96c20dc-4baf-4f4c-b710-ad190fbcee2f/avatar/f4d40624-066e-490f-9c52-b52c5a02c844.png",
          "promoVidUrl": null,
          "status": "COMPLETED",
          "isHidden": false,
          "isDeleted": false,
          "createdAt": "2021-03-14T15:42:12.756Z",
          "updatedAt": "2021-03-31T13:52:51.883Z",
          "instructorId": "4e848aea-18aa-4da4-bcc7-0121c42412a9",
          "typeUploadVideoLesson": 2,
          "instructorName": "Trung Tâm Tin Học Khoa Phạm",
          "averagePoint": 0
        },
        {
          "id": "849e1a5e-c159-4277-9504-51b52b59ae2f",
          "title": "Thực hành Redux qua dự án Photo App",
          "subtitle":
              "Khoá thực hành với react redux qua Mini Project Photo App",
          "price": 0,
          "description":
              "Cùng mình khám phá cách tổ chức files trong reactjs redux project như thế nào cho hiệu quả nhé! 😍",
          "requirement": ["Có kiến thức cơ bản về redux reactjs"],
          "learnWhat": ["Kinh nghiệm làm dự án với react redux"],
          "soldNumber": 3,
          "ratedNumber": 0,
          "videoNumber": 18,
          "totalHours": 5.26,
          "formalityPoint": 0,
          "contentPoint": 0,
          "presentationPoint": 0,
          "imageUrl":
              "https://storage.googleapis.com/letstudy/Courses/849e1a5e-c159-4277-9504-51b52b59ae2f/avatar/cdeadcfb-6d56-4674-bdda-53b29dda9b87.png",
          "promoVidUrl": null,
          "status": "COMPLETED",
          "isHidden": false,
          "isDeleted": false,
          "createdAt": "2021-03-07T09:57:34.433Z",
          "updatedAt": "2021-04-04T07:36:25.096Z",
          "instructorId": "d062ad73-6c7d-480c-8285-1baa99b96d17",
          "typeUploadVideoLesson": 2,
          "instructorName": "Nguyễn Văn Hậu",
          "averagePoint": 0
        },
        {
          "id": "2610dc50-eb40-48df-9522-b34fbe1c30a3",
          "title": "🚀 Học redux cơ bản 2020",
          "subtitle": "Khoá học giúp bạn hiểu rõ hơn về redux",
          "price": 0,
          "description":
              "Quá bối rối khi mới học redux, hãy cùng mình xem video này để hiểu được cuối cùng ông thần Redux này là cái chi chi nha 🤣",
          "requirement": ["Có đam mê với lập trình web"],
          "learnWhat": ["Tìm hiểu về Redux"],
          "soldNumber": 7,
          "ratedNumber": 0,
          "videoNumber": 12,
          "totalHours": 4.540000000000001,
          "formalityPoint": 0,
          "contentPoint": 0,
          "presentationPoint": 0,
          "imageUrl":
              "https://storage.googleapis.com/letstudy/Courses/2610dc50-eb40-48df-9522-b34fbe1c30a3/avatar/28f7ee0f-08ef-4b98-8301-f8c3a73cc83f.png",
          "promoVidUrl":
              "https://storage.googleapis.com/letstudy/Courses/2610dc50-eb40-48df-9522-b34fbe1c30a3/promo/d27d9ea5-33ac-4811-8abc-52265e154b6d.mp4",
          "status": "COMPLETED",
          "isHidden": false,
          "isDeleted": false,
          "createdAt": "2021-03-05T03:38:58.762Z",
          "updatedAt": "2021-04-09T08:28:52.605Z",
          "instructorId": "d062ad73-6c7d-480c-8285-1baa99b96d17",
          "typeUploadVideoLesson": 2,
          "instructorName": "Nguyễn Văn Hậu",
          "averagePoint": 0
        },
        {
          "id": "316e1728-7375-4323-aa5b-9d2d2cbb56bb",
          "title": "Khóa Học Spring MVC - Hibernate - Structs",
          "subtitle": "Khoá học lập trình Java Web - Spring MVC - Hibernate",
          "price": 15000,
          "description": "Khoá học lập trình Java Web - Spring MVC - Hibernate",
          "requirement": ["Không có"],
          "learnWhat": ["Spring MVC - Hibernate - Structs"],
          "soldNumber": 3,
          "ratedNumber": 1,
          "videoNumber": 10,
          "totalHours": 2.47,
          "formalityPoint": 5,
          "contentPoint": 5,
          "presentationPoint": 5,
          "imageUrl":
              "https://storage.googleapis.com/letstudy_dev/Courses/316e1728-7375-4323-aa5b-9d2d2cbb56bb/avatar/3e203c19-b83d-4f05-a53c-47debfb8da19.png",
          "promoVidUrl": null,
          "status": "COMPLETED",
          "isHidden": false,
          "isDeleted": false,
          "createdAt": "2021-03-13T06:24:36.322Z",
          "updatedAt": "2021-04-08T17:31:29.351Z",
          "instructorId": "1d4a4374-ee50-4ac7-8302-27837b743aa7",
          "typeUploadVideoLesson": 2,
          "instructorName": "Phan Phước Nghiệp",
          "averagePoint": 5
        },
        {
          "id": "f57d9591-23bf-4c4b-99fd-d1f3bf590e45",
          "title": "Lập trình Angular 4 từ căn bản đến nâng cao",
          "subtitle": "Loạt Video chia sẻ học lập trình Angular 4",
          "price": 0,
          "description":
              "Loạt Video chia sẻ học lập trình Angular 4 \n- Khóa học dành cho người bắt đầu học lập trình web hoặc muốn chuyên sâu hơn",
          "requirement": ["Có đam mê với lập trình web"],
          "learnWhat": ["Khoá học nâng cao kỹ năng về Angular"],
          "soldNumber": 7,
          "ratedNumber": 0,
          "videoNumber": 49,
          "totalHours": 16.450000000000003,
          "formalityPoint": 0,
          "contentPoint": 0,
          "presentationPoint": 0,
          "imageUrl":
              "https://storage.googleapis.com/letstudy_dev/Courses/f57d9591-23bf-4c4b-99fd-d1f3bf590e45/avatar/35ddc281-e176-4b93-bde2-1cc38e45d4b6.jpg",
          "promoVidUrl": null,
          "status": "COMPLETED",
          "isHidden": false,
          "isDeleted": false,
          "createdAt": "2021-03-13T06:42:36.860Z",
          "updatedAt": "2021-04-05T17:30:08.105Z",
          "instructorId": "1d4a4374-ee50-4ac7-8302-27837b743aa7",
          "typeUploadVideoLesson": 2,
          "instructorName": "Phan Phước Nghiệp",
          "averagePoint": 0
        },
        {
          "id": "ccc51cd9-ee97-4e58-8f27-5e0b35d75cc2",
          "title": "✅ Học lập trình javascript cơ bản",
          "subtitle": "khoá học danh cho người mới bắt đầu với javascript",
          "price": 0,
          "description": "Hãy cùng mình tìm hiểu cơ bản về javascript nhé",
          "requirement": ["Có đam mê với lập trình web"],
          "learnWhat": ["Lập trình JS căn bản "],
          "soldNumber": 7,
          "ratedNumber": 0,
          "videoNumber": 9,
          "totalHours": 1.7899999999999998,
          "formalityPoint": 0,
          "contentPoint": 0,
          "presentationPoint": 0,
          "imageUrl":
              "https://storage.googleapis.com/letstudy/Courses/ccc51cd9-ee97-4e58-8f27-5e0b35d75cc2/avatar/94321d65-6f20-497c-bcef-3673ff928027.png",
          "promoVidUrl": null,
          "status": "COMPLETED",
          "isHidden": false,
          "isDeleted": false,
          "createdAt": "2021-03-07T10:30:52.940Z",
          "updatedAt": "2021-04-21T03:12:18.821Z",
          "instructorId": "d062ad73-6c7d-480c-8285-1baa99b96d17",
          "typeUploadVideoLesson": 2,
          "instructorName": "Nguyễn Văn Hậu",
          "averagePoint": 0
        }
      ]
    };

    CourseDetail detail = CourseDetail.fromJson(data);

    Navigator.of(context, rootNavigator: true)
        .pushNamed('/course', arguments: detail);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _view(context),
      child: Card(
        child: SizedBox(
          width: 256.0,
          height: 256.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 256.0,
                height: 132.0,
                child: Image(
                  image: image,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(author),
                    Row(children: [
                      Text(level),
                      TextSeparator(distance: 4.0),
                      Text(date),
                      TextSeparator(distance: 4.0),
                      Text(time),
                    ]),
                    Row(
                      children: [
                        RatingBar(
                          stars: 5,
                          rate: rating,
                          color: Colors.yellow[600],
                          size: 18.0,
                          reactable: false,
                        ),
                        HorizontalSpacer(distance: 4.0),
                        Text('($votes)')
                      ],
                    )
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
