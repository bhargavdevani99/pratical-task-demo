//Holds the state of the application and provides an API to access/filter/manipulate that data.
// Its concern is data encapsulation and management.
// It contains logic to structure, validate or compare different pieces of data that we call Domain Logic.
// Model File : A perfect tool to make Models easily.
// https://app.quicktype.io/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guest_profile_demo/global/constants/app_asset.dart';

class HomeController extends GetxController {
  final GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    searchController.clear();
    tabIndex.value = 0;
    isTapRightSide.value = false;
  }

  TextEditingController searchController = TextEditingController();

  RxBool isTapRightSide=false.obs;

  RxList guestList = [
    {
      "imgPath": AppAsset.user1,
      "name": "Lia Thomas",
      "email": "lia.thomas516@reddit.com",
      "phone": "+1 212-456-7890",
    },
    {
      "imgPath": AppAsset.user2,
      "name": "Bergnaum",
      "email": "cleorahills@gmail.com",
      "phone": "+1 212-450-7890",
    },
    {
      "imgPath": AppAsset.user3,
      "name": "Wunderlich",
      "email": "wunder@gmail.com",
      "phone": "+1 212-236-7890",
    },
    {
      "imgPath": AppAsset.user4,
      "name": "Arjun Gerhold",
      "email": "alaskanm@dog.com",
      "phone": "+1 122-456-7890",
    },
    {
      "imgPath": AppAsset.user5,
      "name": "Simeon Wilderman",
      "email": "simeon@user.com",
      "phone": "+1 287-456-7890",
    },
    {
      "imgPath": AppAsset.user6,
      "name": "Eden Kautzer",
      "email": "edenka@user.com",
      "phone": "+1 212-456-7090",
    },
    {
      "imgPath": AppAsset.user7,
      "name": "Gino Yost",
      "email": "gyostt@Test.com",
      "phone": "+1 222-456-7890",
    },
    {
      "imgPath": AppAsset.user1,
      "name": "Lia Thomas",
      "email": "lia.thomas516@reddit.com",
      "phone": "+1 212-456-7890",
    },
    {
      "imgPath": AppAsset.user2,
      "name": "Bergnaum",
      "email": "cleorahills@gmail.com",
      "phone": "+1 212-450-7890",
    },
    {
      "imgPath": AppAsset.user3,
      "name": "Wunderlich",
      "email": "wunder@gmail.com",
      "phone": "+1 212-236-7890",
    },
    {
      "imgPath": AppAsset.user4,
      "name": "Arjun Gerhold",
      "email": "alaskanm@dog.com",
      "phone": "+1 122-456-7890",
    },
    {
      "imgPath": AppAsset.user5,
      "name": "Simeon Wilderman",
      "email": "simeon@user.com",
      "phone": "+1 287-456-7890",
    },
    {
      "imgPath": AppAsset.user6,
      "name": "Eden Kautzer",
      "email": "edenka@user.com",
      "phone": "+1 212-456-7090",
    },
    {
      "imgPath": AppAsset.user7,
      "name": "Gino Yost",
      "email": "gyostt@Test.com",
      "phone": "+1 222-456-7890",
    },
  ].obs;

  RxInt tabIndex = 0.obs;

  RxList optionList = [
    "Profile",
    "Reservation",
    "Payment",
    "Feedback",
    "Order History",
  ].obs;

  RxList reviewDataList = [
    {
      "logo": AppAsset.googleLogo,
      "review":
          "The food was absolutely delicious and served with great presentation. The staff were friendly and attentive.",
      "review_img": AppAsset.firstRevImg,
    },
    {
      "logo": AppAsset.secondLogo,
      "review":
          "The service was prompt and attentive, making our evening enjoyable. Highly recommend this gem.",
      "review_img": AppAsset.secondRevImg,
    },
    {
      "logo": AppAsset.thirdLogo,
      "review":
          "I highly recommend trying their Japan Chicken. it was bursting with flavor.",
      "review_img": AppAsset.thirdRevImg,
    },
    {
      "logo": AppAsset.googleLogo,
      "review":
      "The food was absolutely delicious and served with great presentation. The staff were friendly and attentive.",
      "review_img": AppAsset.firstRevImg,
    },
    {
      "logo": AppAsset.secondLogo,
      "review":
      "The service was prompt and attentive, making our evening enjoyable. Highly recommend this gem.",
      "review_img": AppAsset.secondRevImg,
    },
    {
      "logo": AppAsset.thirdLogo,
      "review":
      "I highly recommend trying their Japan Chicken. it was bursting with flavor.",
      "review_img": AppAsset.thirdRevImg,
    },
    {
      "logo": AppAsset.googleLogo,
      "review":
      "The food was absolutely delicious and served with great presentation. The staff were friendly and attentive.",
      "review_img": AppAsset.firstRevImg,
    },
    {
      "logo": AppAsset.secondLogo,
      "review":
      "The service was prompt and attentive, making our evening enjoyable. Highly recommend this gem.",
      "review_img": AppAsset.secondRevImg,
    },
    {
      "logo": AppAsset.thirdLogo,
      "review":
      "I highly recommend trying their Japan Chicken. it was bursting with flavor.",
      "review_img": AppAsset.thirdRevImg,
    },
  ].obs;
}
