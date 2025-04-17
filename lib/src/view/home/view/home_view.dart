// Views are all the Widgets and Pages within the Flutter Application.
// These views may contain a “view controller” themselves,
// But that is still considered part of the view application tier.

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guest_profile_demo/global/constants/app_asset.dart';
import 'package:guest_profile_demo/global/constants/app_color.dart';
import 'package:guest_profile_demo/global/constants/app_string.dart';
import 'package:guest_profile_demo/global/constants/theme/app_text_style.dart';
import 'package:guest_profile_demo/global/utils/dynamic_size/size_constant.dart';
import 'package:guest_profile_demo/global/widgets/common_textfield.dart';
import 'package:guest_profile_demo/src/view/home/controller/home_controller.dart';

class HomeView extends GetWidget<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        if (MediaQuery.sizeOf(context).width >= 940) {
          if (controller.key.currentState != null) {
            if (controller.key.currentState!.isDrawerOpen) {
              controller.key.currentState!.closeDrawer();
            }
          }
        }
        return SafeArea(
          child: Scaffold(
            key: controller.key,
            drawer: guestListView(controller, context),
            backgroundColor: AppColor.greyF8F8F8,
            body:
                buildStack(controller, context),
          ),
        );
      },
    );
  }

  Stack buildStack(HomeController controller, context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            topView(context),
            Expanded(
              child: SingleChildScrollView(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MediaQuery.sizeOf(context).width <= 942
                        ? const SizedBox()
                        : drawerView(),
                    MediaQuery.sizeOf(context).width <= 942
                        ? const SizedBox()
                        : controller.isTapRightSide.value == false
                            ? guestListView(controller, context)
                            : const SizedBox(),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (MediaQuery.sizeOf(context).width > 942) {
                            controller.isTapRightSide.value = true;
                            controller.update();
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            top: MySize.getScaledSizeHeight(19),
                            left: MySize.getScaledSizeWidth(29),
                            right: MySize.getScaledSizeWidth(27),
                          ),
                          decoration: const BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: AppColor.greyD2D2D2,
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              controller.isTapRightSide.value == true &&
                                      MediaQuery.sizeOf(context).width > 942
                                  ? GestureDetector(
                                      onTap: () {
                                        controller.isTapRightSide.value = false;
                                        controller.update();
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          bottom: MySize.getScaledSizeHeight(
                                            27,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              AppAsset.arrowLeftIcon,
                                              height:
                                                  MySize.getScaledSizeHeight(
                                                15,
                                              ),
                                              width: MySize.getScaledSizeWidth(
                                                15,
                                              ),
                                              fit: BoxFit.contain,
                                            ),
                                            SizedBox(
                                              width: MySize.getScaledSizeWidth(
                                                6,
                                              ),
                                            ),
                                            Text(
                                              AppString.guestBook,
                                              style:
                                                  AppTextStyle.medium.copyWith(
                                                fontSize:
                                                    MySize.getScaledSizeWidth(
                                                  22,
                                                ),
                                                color: AppColor.grey666666,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: MySize.getScaledSizeHeight(6),
                                  horizontal: MySize.getScaledSizeWidth(48.5),
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(
                                      MySize.getScaledSizeWidth(12),
                                    ),
                                    topLeft: Radius.circular(
                                      MySize.getScaledSizeWidth(12),
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: MySize.getScaledSizeHeight(25.06),
                                      ),
                                      child: Image.asset(
                                        AppAsset.guestBookIcon,
                                        height: MySize.getScaledSizeHeight(45),
                                        width: MySize.getScaledSizeWidth(36),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical:
                                            MySize.getScaledSizeHeight(12),
                                      ),
                                      child: Text(
                                        AppString.guestBook,
                                        style: AppTextStyle.semiBold.copyWith(
                                          fontSize:
                                              MySize.getScaledSizeWidth(16),
                                          color: AppColor.black212121,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      AppString.guestDescription,
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle.regular.copyWith(
                                        fontSize: MySize.getScaledSizeWidth(16),
                                        color: AppColor.black44474E,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: MySize.getScaledSizeHeight(20),
                                    bottom: MySize.getScaledSizeHeight(18),
                                  ),
                                  height: MySize.getScaledSizeHeight(44),
                                  padding: EdgeInsets.symmetric(
                                    vertical: MySize.getScaledSizeHeight(6),
                                    horizontal: MySize.getScaledSizeWidth(8),
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.circular(
                                      MySize.getScaledSizeWidth(12),
                                    ),
                                  ),
                                  child: ListView.builder(
                                    itemCount: controller.optionList.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          controller.tabIndex.value = index;
                                          controller.update();
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            left: MySize.getScaledSizeWidth(
                                                index == 0 ? 8 : 0),
                                            right: MySize.getScaledSizeWidth(8),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            vertical:
                                                MySize.getScaledSizeHeight(6),
                                            horizontal:
                                                MySize.getScaledSizeWidth(16),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              MySize.getScaledSizeWidth(8),
                                            ),
                                            color: controller.tabIndex.value ==
                                                    index
                                                ? AppColor.grey666666
                                                : AppColor.transparent,
                                          ),
                                          child: Text(
                                            controller.optionList[index],
                                            style: AppTextStyle.medium.copyWith(
                                              fontSize:
                                                  MySize.getScaledSizeWidth(16),
                                              color:
                                                  controller.tabIndex.value ==
                                                          index
                                                      ? AppColor.white
                                                      : AppColor.black,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              profileView(context),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MySize.getScaledSizeHeight(31),
                                    bottom: MySize.getScaledSizeHeight(8)),
                                child: Text(
                                  AppString.allergies,
                                  style: AppTextStyle.medium.copyWith(
                                    fontSize: MySize.getScaledSizeWidth(16),
                                    color: AppColor.grey85858B,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(
                                  MySize.getScaledSizeWidth(26),
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(
                                    MySize.getScaledSizeWidth(10),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          AppAsset.allergiesIcon,
                                          height:
                                              MySize.getScaledSizeHeight(32),
                                          width: MySize.getScaledSizeWidth(32),
                                          fit: BoxFit.contain,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: MySize.getScaledSizeWidth(25),
                                            right:
                                                MySize.getScaledSizeWidth(20),
                                          ),
                                          child: SizedBox(
                                            height:
                                                MySize.getScaledSizeHeight(64),
                                            child: const VerticalDivider(
                                              color: AppColor.grey8E8E93,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          AppString.noAllergies,
                                          style: AppTextStyle.semiBold.copyWith(
                                            fontSize:
                                                MySize.getScaledSizeWidth(14),
                                            color: AppColor.black212121,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MySize.getScaledSizeWidth(16),
                                        vertical:
                                            MySize.getScaledSizeHeight(12),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          MySize.getScaledSizeWidth(28),
                                        ),
                                        color: AppColor.black212121,
                                      ),
                                      child: Text(
                                        AppString.add,
                                        style: AppTextStyle.medium.copyWith(
                                          fontSize:
                                              MySize.getScaledSizeWidth(14),
                                          color: AppColor.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MySize.getScaledSizeHeight(24),
                                    bottom: MySize.getScaledSizeHeight(8)),
                                child: Text(
                                  AppString.upcomingVisits,
                                  style: AppTextStyle.medium.copyWith(
                                    fontSize: MySize.getScaledSizeWidth(16),
                                    color: AppColor.grey85858B,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(
                                  MySize.getScaledSizeWidth(26),
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(
                                    MySize.getScaledSizeWidth(10),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MediaQuery.sizeOf(context).width <= 518
                                          ? MainAxisAlignment.start
                                          : MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          AppAsset.upcomingVisitsIcon,
                                          height:
                                              MySize.getScaledSizeHeight(32),
                                          width: MySize.getScaledSizeWidth(32),
                                          fit: BoxFit.contain,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: MySize.getScaledSizeWidth(25),
                                            right:
                                                MySize.getScaledSizeWidth(20),
                                          ),
                                          child: SizedBox(
                                            height:
                                                MySize.getScaledSizeHeight(64),
                                            child: const VerticalDivider(
                                              color: AppColor.grey8E8E93,
                                            ),
                                          ),
                                        ),
                                        MediaQuery.sizeOf(context).width <= 518
                                            ? const SizedBox()
                                            : Text(
                                                AppString.noUpcomingVisits,
                                                style: AppTextStyle.semiBold
                                                    .copyWith(
                                                  fontSize:
                                                      MySize.getScaledSizeWidth(
                                                          14),
                                                  color: AppColor.black212121,
                                                ),
                                              ),
                                      ],
                                    ),
                                    MediaQuery.sizeOf(context).width <= 518
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                AppString.noUpcomingVisits,
                                                style: AppTextStyle.semiBold
                                                    .copyWith(
                                                  fontSize:
                                                      MySize.getScaledSizeWidth(
                                                          14),
                                                  color: AppColor.black212121,
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                  top: MySize
                                                      .getScaledSizeHeight(10),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      MySize.getScaledSizeWidth(
                                                          16),
                                                  vertical: MySize
                                                      .getScaledSizeHeight(12),
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    MySize.getScaledSizeWidth(
                                                        28),
                                                  ),
                                                  color: AppColor.black212121,
                                                ),
                                                child: Text(
                                                  AppString.bookAVisit,
                                                  style: AppTextStyle.medium
                                                      .copyWith(
                                                    fontSize: MySize
                                                        .getScaledSizeWidth(14),
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  MySize.getScaledSizeWidth(16),
                                              vertical:
                                                  MySize.getScaledSizeHeight(
                                                      12),
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                MySize.getScaledSizeWidth(28),
                                              ),
                                              color: AppColor.black212121,
                                            ),
                                            child: Text(
                                              AppString.bookAVisit,
                                              style:
                                                  AppTextStyle.medium.copyWith(
                                                fontSize:
                                                    MySize.getScaledSizeWidth(
                                                        14),
                                                color: AppColor.white,
                                              ),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MySize.getScaledSizeHeight(25),
                                    bottom: MySize.getScaledSizeHeight(8)),
                                child: Text(
                                  AppString.notes,
                                  style: AppTextStyle.medium.copyWith(
                                    fontSize: MySize.getScaledSizeWidth(16),
                                    color: AppColor.grey85858B,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(
                                  MySize.getScaledSizeWidth(26),
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(
                                    MySize.getScaledSizeWidth(10),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    commonNotesView(AppAsset.generalIcon,
                                        AppString.general),
                                    commonNotesView(AppAsset.specialRelation,
                                        AppString.specialRelation),
                                    commonNotesView(AppAsset.seatingPreferences,
                                        AppString.seatingPreferences),
                                    commonNotesView(AppAsset.specialNote,
                                        AppString.specialNote),
                                    commonNotesView(
                                        AppAsset.allergies, AppString.allergies,
                                        isDividerShow: true),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MySize.getScaledSizeHeight(23),
                                    bottom: MySize.getScaledSizeHeight(8)),
                                child: Text(
                                  AppString.recentOrders,
                                  style: AppTextStyle.medium.copyWith(
                                    fontSize: MySize.getScaledSizeWidth(16),
                                    color: AppColor.grey85858B,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(
                                  MySize.getScaledSizeWidth(26),
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(
                                    MySize.getScaledSizeWidth(10),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      AppAsset.recentOrders,
                                      height: MySize.getScaledSizeHeight(32),
                                      width: MySize.getScaledSizeWidth(32),
                                      fit: BoxFit.contain,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: MySize.getScaledSizeWidth(25),
                                        right: MySize.getScaledSizeWidth(20),
                                      ),
                                      child: SizedBox(
                                        height: MySize.getScaledSizeHeight(64),
                                        child: const VerticalDivider(
                                          color: AppColor.grey8E8E93,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        AppString.noRecentOrdersToShow,
                                        style: AppTextStyle.semiBold.copyWith(
                                          fontSize:
                                              MySize.getScaledSizeWidth(14),
                                          color: AppColor.black212121,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MySize.getScaledSizeHeight(24),
                                    bottom: MySize.getScaledSizeHeight(8)),
                                child: Text(
                                  AppString.onlineReviews,
                                  style: AppTextStyle.medium.copyWith(
                                    fontSize: MySize.getScaledSizeWidth(16),
                                    color: AppColor.grey85858B,
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(
                                  bottom: MySize.getScaledSizeHeight(58),
                                ),
                                height: MySize.getScaledSizeHeight(228),
                                // padding: EdgeInsets.all(
                                //   MySize.getScaledSizeWidth(20),
                                // ),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColor.greyE5E5E5),
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(
                                    MySize.getScaledSizeWidth(16),
                                  ),
                                ),
                                child: ListView.builder(
                                  itemCount: controller.reviewDataList.length,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.only(
                                    left: MySize.getScaledSizeWidth(20),
                                    right: MySize.getScaledSizeWidth(20),
                                    bottom: MySize.getScaledSizeHeight(20),
                                    top: MySize.getScaledSizeHeight(10),
                                  ),
                                  itemBuilder: (context, index) {
                                    final res =
                                        controller.reviewDataList[index];
                                    return Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        // Review Card Container
                                        Container(
                                          width: MySize.getScaledSizeWidth(241),
                                          margin: EdgeInsets.only(
                                            left: MySize.getScaledSizeWidth(
                                                index == 0 ? 0 : 20),
                                            top: MySize.getScaledSizeHeight(
                                                24), // leave space for the logo
                                          ),
                                          padding: EdgeInsets.all(
                                              MySize.getScaledSizeWidth(16)),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColor.greyE5E5E5),
                                            color: AppColor.white,
                                            borderRadius: BorderRadius.circular(
                                                MySize.getScaledSizeWidth(16)),
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: MySize
                                                      .getScaledSizeHeight(12),
                                                ),
                                                child: Image.asset(
                                                  res['review_img'],
                                                  height: MySize
                                                      .getScaledSizeHeight(20),
                                                  width:
                                                      MySize.getScaledSizeWidth(
                                                          100),
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Text(
                                                res['review'],
                                                textAlign: TextAlign.center,
                                                style: AppTextStyle.semiBold
                                                    .copyWith(
                                                  fontSize:
                                                      MySize.getScaledSizeWidth(
                                                          14),
                                                  color: AppColor.grey666666,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        // Logo Positioned at the Top Center
                                        Positioned(
                                          top: 0,
                                          child: Container(
                                            height:
                                                MySize.getScaledSizeHeight(48),
                                            width:
                                                MySize.getScaledSizeWidth(48),
                                            decoration: const BoxDecoration(
                                              color: AppColor.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              res['logo'],
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        MediaQuery.sizeOf(context).width <= 700
            ? const SizedBox()
            : Container(
                margin: EdgeInsets.only(
                  top: MySize.getScaledSizeHeight(40),
                ),
                padding: EdgeInsets.only(
                  bottom: MySize.getScaledSizeHeight(13.43),
                ),
                height: MySize.getScaledSizeHeight(25),
                width: MySize.getScaledSizeWidth(200),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(
                      MySize.getScaledSizeHeight(10),
                    ),
                    bottomLeft: Radius.circular(
                      MySize.getScaledSizeHeight(10),
                    ),
                  ),
                ),
                child: Image.asset(
                  AppAsset.arrowDownIcon,
                  height: MySize.getScaledSizeHeight(23.03),
                  width: MySize.getScaledSizeWidth(14),
                  fit: BoxFit.contain,
                ),
              ),
      ],
    );
  }

  guestListView(HomeController controller, context) {
    return MediaQuery.sizeOf(context).width <= 450
        ? Container(
            margin: EdgeInsets.only(
              right: MySize.getScaledSizeWidth(28),
            ),
            color: AppColor.white,
            // width: MySize.getScaledSizeWidth(350),
            padding: EdgeInsets.only(
              top: MySize.getScaledSizeHeight(37),
              left: MySize.getScaledSizeWidth(28),
              right: MySize.getScaledSizeWidth(28),
            ),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: MySize.getScaledSizeHeight(20),
                      bottom: MySize.getScaledSizeHeight(20),
                    ),
                    height: MySize.getScaledSizeHeight(44),
                    padding: EdgeInsets.symmetric(
                      vertical: MySize.getScaledSizeHeight(6),
                      horizontal: MySize.getScaledSizeWidth(8),
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.black,
                      borderRadius: BorderRadius.circular(
                        MySize.getScaledSizeWidth(5),
                      ),
                    ),
                    child: Row(
                      children: [
                        commonContainerDrawer(
                          Image.asset(
                            AppAsset.drawer1,
                            height: MySize.getScaledSizeHeight(20.33),
                            width: MySize.getScaledSizeWidth(49.28),
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          width: MySize.getScaledSizeHeight(30),
                        ),
                        commonContainerDrawer(
                          Image.asset(
                            AppAsset.drawer2,
                            height: MySize.getScaledSizeHeight(36.37),
                            width: MySize.getScaledSizeWidth(40),
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          width: MySize.getScaledSizeHeight(30),
                        ),
                        commonContainerDrawer(
                          Image.asset(
                            AppAsset.drawer3,
                            height: MySize.getScaledSizeHeight(40),
                            width: MySize.getScaledSizeWidth(40),
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          width: MySize.getScaledSizeHeight(30),
                        ),
                        commonContainerDrawer(
                          Image.asset(
                            AppAsset.drawer4,
                            height: MySize.getScaledSizeHeight(32.66),
                            width: MySize.getScaledSizeWidth(40),
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          width: MySize.getScaledSizeHeight(30),
                        ),
                        commonContainerDrawer(
                          Image.asset(
                            AppAsset.drawer5,
                            height: MySize.getScaledSizeHeight(40),
                            width: MySize.getScaledSizeWidth(47.56),
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          width: MySize.getScaledSizeHeight(30),
                        ),
                        commonContainerDrawer(
                          Image.asset(
                            AppAsset.drawer6,
                            height: MySize.getScaledSizeHeight(33.75),
                            width: MySize.getScaledSizeWidth(35.63),
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          width: MySize.getScaledSizeHeight(30),
                        ),
                        commonContainerDrawer(
                          Row(
                            children: [
                              Image.asset(
                                AppAsset.drawer7,
                                height: MySize.getScaledSizeHeight(40),
                                width: MySize.getScaledSizeWidth(40),
                                fit: BoxFit.contain,
                              ),
                              SizedBox(
                                height: MySize.getScaledSizeHeight(6),
                              ),
                              FittedBox(
                                child: Text(
                                  AppString.version,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.semiBold.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: MySize.getScaledSizeWidth(13),
                                    color: AppColor.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      AppAsset.arrowLeftIcon,
                      height: MySize.getScaledSizeHeight(
                        15,
                      ),
                      width: MySize.getScaledSizeWidth(
                        15,
                      ),
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      width: MySize.getScaledSizeWidth(
                        6,
                      ),
                    ),
                    Text(
                      AppString.settings,
                      style: AppTextStyle.medium.copyWith(
                        fontSize: MySize.getScaledSizeWidth(
                          22,
                        ),
                        color: AppColor.grey666666,
                      ),
                    ),
                  ],
                ),
                CommonTextField(
                  controller: controller.searchController,
                  hintText: "Search",
                  hintStyle: AppTextStyle.medium.copyWith(
                    fontSize: MySize.getScaledSizeWidth(17),
                    color: AppColor.grey76767A.withValues(
                      alpha: 0.6,
                    ),
                  ),
                  bgColor: AppColor.grey767680.withValues(alpha: 0.12),
                  borderColor: AppColor.transparent,
                  bottomPadding: 0.0,
                  boxShadow: false,
                  borderRadius: MySize.getScaledSizeWidth(10),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: MySize.getScaledSizeHeight(12),
                    horizontal: MySize.getScaledSizeWidth(15),
                  ),
                  margin: EdgeInsets.only(
                    top: MySize.getScaledSizeHeight(25),
                    bottom: MySize.getScaledSizeHeight(15),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: MySize.getScaledSizeHeight(12),
                    ),
                    child: Image.asset(
                      AppAsset.searchIcon,
                      height: MySize.getScaledSizeHeight(20.31),
                      width: MySize.getScaledSizeWidth(20.31),
                      fit: BoxFit.contain,
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: MySize.getScaledSizeHeight(12),
                    ),
                    child: Image.asset(
                      AppAsset.microphoneIcon,
                      height: MySize.getScaledSizeHeight(24),
                      width: MySize.getScaledSizeWidth(24),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        commonIconContainer(
                          AppAsset.addIcon,
                          AppColor.black212121,
                        ),
                        SizedBox(
                          width: MySize.getScaledSizeWidth(15),
                        ),
                        commonIconContainer(
                          AppAsset.uploadIcon,
                          AppColor.grey999999,
                        ),
                      ],
                    ),
                    commonIconContainer(
                      AppAsset.aToZSearch,
                      AppColor.grey767680.withValues(
                        alpha: 0.12,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                      child: guestDataShowListView(controller)),
                ),
              ],
            ),
          )
        : Row(
            children: [
              MediaQuery.sizeOf(context).width <= 942
                  ? SingleChildScrollView(child: drawerView())
                  : const SizedBox(),
              Container(
                color: AppColor.white,
                width: MySize.getScaledSizeWidth(416),
                padding: EdgeInsets.only(
                  top: MySize.getScaledSizeHeight(37),
                  left: MySize.getScaledSizeWidth(28),
                  right: MySize.getScaledSizeWidth(28),
                ),
                // decoration: const BoxDecoration(
                //   border: Border(
                //     right: BorderSide(
                //       color: AppColor.greyD2D2D2,
                //     ),
                //   ),
                // ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppAsset.arrowLeftIcon,
                          height: MySize.getScaledSizeHeight(
                            15,
                          ),
                          width: MySize.getScaledSizeWidth(
                            15,
                          ),
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          width: MySize.getScaledSizeWidth(
                            6,
                          ),
                        ),
                        Text(
                          AppString.settings,
                          style: AppTextStyle.medium.copyWith(
                            fontSize: MySize.getScaledSizeWidth(
                              22,
                            ),
                            color: AppColor.grey666666,
                          ),
                        ),
                      ],
                    ),
                    CommonTextField(
                      controller: controller.searchController,
                      hintText: "Search",
                      hintStyle: AppTextStyle.medium.copyWith(
                        fontSize: MySize.getScaledSizeWidth(17),
                        color: AppColor.grey76767A.withValues(
                          alpha: 0.6,
                        ),
                      ),
                      bgColor: AppColor.grey767680.withValues(alpha: 0.12),
                      borderColor: AppColor.transparent,
                      bottomPadding: 0.0,
                      boxShadow: false,
                      borderRadius: MySize.getScaledSizeWidth(10),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: MySize.getScaledSizeHeight(12),
                        horizontal: MySize.getScaledSizeWidth(15),
                      ),
                      margin: EdgeInsets.only(
                        top: MySize.getScaledSizeHeight(25),
                        bottom: MySize.getScaledSizeHeight(15),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MySize.getScaledSizeHeight(12),
                        ),
                        child: Image.asset(
                          AppAsset.searchIcon,
                          height: MySize.getScaledSizeHeight(20.31),
                          width: MySize.getScaledSizeWidth(20.31),
                          fit: BoxFit.contain,
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MySize.getScaledSizeHeight(12),
                        ),
                        child: Image.asset(
                          AppAsset.microphoneIcon,
                          height: MySize.getScaledSizeHeight(24),
                          width: MySize.getScaledSizeWidth(24),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            commonIconContainer(
                              AppAsset.addIcon,
                              AppColor.black212121,
                            ),
                            SizedBox(
                              width: MySize.getScaledSizeWidth(15),
                            ),
                            commonIconContainer(
                              AppAsset.uploadIcon,
                              AppColor.grey999999,
                            ),
                          ],
                        ),
                        commonIconContainer(
                          AppAsset.aToZSearch,
                          AppColor.grey767680.withValues(
                            alpha: 0.12,
                          ),
                        ),
                      ],
                    ),
                    MediaQuery.sizeOf(context).width <= 942
                        ? Expanded(
                            child: SingleChildScrollView(
                                child: guestDataShowListView(controller)),
                          )
                        : guestDataShowListView(controller),
                  ],
                ),
              ),
            ],
          );
  }

  ListView guestDataShowListView(HomeController controller) {
    return ListView.builder(
      itemCount: controller.guestList.length,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        vertical: MySize.getScaledSizeHeight(16),
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final isFirst = index == 0;
        final isLast = index == controller.guestList.length - 1;
        final res = controller.guestList[index];
        return Container(
          padding: EdgeInsets.only(
            top: MySize.getScaledSizeHeight(12),
            bottom: MySize.getScaledSizeHeight(12),
            left: MySize.getScaledSizeWidth(20),
          ),
          decoration: BoxDecoration(
            border: const Border(
              bottom: BorderSide(
                color: /* isLast
                                            ? AppColor.transparent
                                            :*/
                    AppColor.greyB9B9BB,
              ),
            ),
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: isFirst
                  ? Radius.circular(
                      MySize.getScaledSizeWidth(12),
                    )
                  : Radius.zero,
              topRight: isFirst
                  ? Radius.circular(
                      MySize.getScaledSizeWidth(12),
                    )
                  : Radius.zero,
              bottomLeft: isLast
                  ? Radius.circular(
                      MySize.getScaledSizeWidth(12),
                    )
                  : Radius.zero,
              bottomRight: isLast
                  ? Radius.circular(
                      MySize.getScaledSizeWidth(12),
                    )
                  : Radius.zero,
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                res['imgPath'],
                height: MySize.getScaledSizeHeight(60),
                width: MySize.getScaledSizeWidth(60),
                fit: BoxFit.contain,
              ),
              SizedBox(
                width: MySize.getScaledSizeWidth(24),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      res['name'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.medium.copyWith(
                        fontSize: MySize.getScaledSizeWidth(22),
                        color: AppColor.black212121,
                      ),
                    ),
                    Text(
                      res['email'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.medium.copyWith(
                        fontSize: MySize.getScaledSizeWidth(14),
                        color: AppColor.black212121,
                      ),
                    ),
                    Text(
                      res['phone'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.medium.copyWith(
                        fontSize: MySize.getScaledSizeWidth(14),
                        color: AppColor.black212121,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Column commonNotesView(imgPath, title, {bool? isDividerShow = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              imgPath,
              height: MySize.getScaledSizeHeight(16),
              width: MySize.getScaledSizeWidth(14),
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: MySize.getScaledSizeWidth(12),
            ),
            Text(
              title,
              style: AppTextStyle.semiBold.copyWith(
                fontSize: MySize.getScaledSizeWidth(16),
                color: AppColor.black212121,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MySize.getScaledSizeHeight(7),
            bottom: MySize.getScaledSizeHeight(isDividerShow == true ? 0 : 12),
          ),
          child: Text(
            AppString.addNotes,
            style: AppTextStyle.medium.copyWith(
              fontSize: MySize.getScaledSizeWidth(14),
              color: AppColor.greyD2D2D2,
            ),
          ),
        ),
        isDividerShow == false
            ? const Divider(
                color: AppColor.greyBDBDBD,
              )
            : const SizedBox()
      ],
    );
  }

  Widget profileView(context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MySize.getScaledSizeWidth(26),
        vertical: MySize.getScaledSizeHeight(18),
      ),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(
          MySize.getScaledSizeWidth(16),
        ),
      ),
      child: MediaQuery.sizeOf(context).width < 1400
          ? Column(
              children: [
                Image.asset(
                  AppAsset.user1,
                  height: MySize.getScaledSizeHeight(56),
                  width: MySize.getScaledSizeWidth(56),
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MySize.getScaledSizeHeight(16),
                    bottom: MySize.getScaledSizeHeight(8),
                  ),
                  child: Text(
                    "Lia Thomas",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.semiBold.copyWith(
                      fontSize: MySize.getScaledSizeWidth(16),
                      color: AppColor.black212121,
                    ),
                  ),
                ),
                Text(
                  "lia.thomas516@reddit.com",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.semiBold.copyWith(
                    fontSize: MySize.getScaledSizeWidth(12),
                    color: AppColor.black212121,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MySize.getScaledSizeHeight(8),
                    bottom: MySize.getScaledSizeHeight(16),
                  ),
                  child: Text(
                    "+1 212-450-7890",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.semiBold.copyWith(
                      fontSize: MySize.getScaledSizeWidth(12),
                      color: AppColor.black212121,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: MySize.getScaledSizeHeight(20),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: MySize.getScaledSizeWidth(16),
                    vertical: MySize.getScaledSizeHeight(8),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      MySize.getScaledSizeWidth(28),
                    ),
                    color: AppColor.black212121,
                  ),
                  child: Text(
                    AppString.addTags,
                    style: AppTextStyle.medium.copyWith(
                      fontSize: MySize.getScaledSizeWidth(10),
                      color: AppColor.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(
                    MySize.getScaledSizeWidth(16),
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.greyF8F8F8,
                    borderRadius: BorderRadius.circular(
                      MySize.getScaledSizeWidth(10),
                    ),
                  ),
                  child: MediaQuery.sizeOf(context).width < 1197
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                commonProfileDataShowView(
                                  "-- -- --",
                                  AppString.lastVisit,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: MySize.getScaledSizeHeight(10),
                                  ),
                                  child: commonProfileDataShowView(
                                    "\$0.00",
                                    AppString.lifetimeSpend,
                                  ),
                                ),
                                commonProfileDataShowView(
                                  "\$0.00",
                                  AppString.averageTip,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                commonProfileDataShowView(
                                  "\$0.00",
                                  AppString.averageSpend,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: MySize.getScaledSizeHeight(10),
                                  ),
                                  child: commonProfileDataShowView(
                                    "0",
                                    AppString.totalOrders,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Row(
                          // alignment: WrapAlignment.center,
                          children: [
                            commonProfileDataShowView(
                              "-- -- --",
                              AppString.lastVisit,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: MySize.getScaledSizeHeight(14.3),
                              ),
                              height: MySize.getScaledSizeHeight(54),
                              child: const VerticalDivider(
                                color: AppColor.greyD6D6D6,
                              ),
                            ),
                            commonProfileDataShowView(
                              "\$0.00",
                              AppString.averageSpend,
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.sizeOf(context).width < 1197
                                        ? MySize.getScaledSizeHeight(10)
                                        : 0),
                                margin: EdgeInsets.symmetric(
                                  horizontal: MySize.getScaledSizeHeight(14.3),
                                ),
                                height: MySize.getScaledSizeHeight(54),
                                child: const VerticalDivider(
                                  color: AppColor.greyD6D6D6,
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.sizeOf(context).width < 1197
                                      ? MySize.getScaledSizeHeight(10)
                                      : 0),
                              child: commonProfileDataShowView(
                                "\$0.00",
                                AppString.lifetimeSpend,
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.sizeOf(context).width < 1197
                                        ? MySize.getScaledSizeHeight(10)
                                        : 0),
                                margin: EdgeInsets.symmetric(
                                  horizontal: MySize.getScaledSizeHeight(14.3),
                                ),
                                height: MySize.getScaledSizeHeight(54),
                                child: const VerticalDivider(
                                  color: AppColor.greyD6D6D6,
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.sizeOf(context).width < 1197
                                      ? MySize.getScaledSizeHeight(10)
                                      : 0),
                              child: commonProfileDataShowView(
                                "0",
                                AppString.totalOrders,
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.sizeOf(context).width < 1197
                                        ? MySize.getScaledSizeHeight(10)
                                        : 0),
                                margin: EdgeInsets.symmetric(
                                  horizontal: MySize.getScaledSizeHeight(14.3),
                                ),
                                height: MySize.getScaledSizeHeight(54),
                                child: const VerticalDivider(
                                  color: AppColor.greyD6D6D6,
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.sizeOf(context).width < 1197
                                      ? MySize.getScaledSizeHeight(10)
                                      : 0),
                              child: commonProfileDataShowView(
                                "\$0.00",
                                AppString.averageTip,
                              ),
                            ),
                          ],
                        ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: MySize.getScaledSizeHeight(16),
                        ),
                        // width: MySize.getScaledSizeWidth(271),
                        padding: EdgeInsets.all(
                          MySize.getScaledSizeWidth(16),
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.greyF8F8F8,
                          borderRadius: BorderRadius.circular(
                            MySize.getScaledSizeWidth(10),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            commonRowInProfile(
                              AppString.loyaltyNo,
                              "RF",
                            ),
                            const Divider(
                              color: AppColor.greyD6D6D6,
                            ),
                            commonRowInProfile(
                              color: AppColor.greyD2D2D2,
                              AppString.customerSince,
                              "Enter",
                            ),
                            const Divider(
                              color: AppColor.greyD6D6D6,
                            ),
                            commonRowInProfile(
                              imgPath: AppAsset.birthdayIcon,
                              isImageShow: true,
                              color: AppColor.greyD2D2D2,
                              AppString.birthday,
                              "Enter",
                            ),
                            const Divider(
                              color: AppColor.greyD6D6D6,
                            ),
                            commonRowInProfile(
                              imgPath: AppAsset.anniversaryIcon,
                              isImageShow: true,
                              color: AppColor.greyD2D2D2,
                              AppString.anniversary,
                              "Enter",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MySize.getScaledSizeHeight(16),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: commonTotalShowContainer(
                          isNoLeftPadding: true,
                          title: AppString.loyalty,
                          firstText: AppString.earned,
                          thirdText: AppString.available,
                          secondText: AppString.redeemed,
                          fourText: AppString.amount,
                        ),
                      ),
                      MediaQuery.sizeOf(context).width < 1056
                          ? const SizedBox()
                          : Expanded(
                              child: commonTotalShowContainer(
                                isZeroShow: true,
                                title: AppString.visits,
                                firstText: AppString.totalVisits,
                                thirdText: AppString.canceled,
                                secondText: AppString.upcoming,
                                fourText: AppString.noShows,
                              ),
                            ),
                    ],
                  ),
                ),
                MediaQuery.sizeOf(context).width < 1056
                    ? Padding(
                        padding: EdgeInsets.only(
                          top: MySize.getScaledSizeHeight(16),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: commonTotalShowContainer(
                                isNoLeftPadding: true,
                                isZeroShow: true,
                                title: AppString.visits,
                                firstText: AppString.totalVisits,
                                thirdText: AppString.canceled,
                                secondText: AppString.upcoming,
                                fourText: AppString.noShows,
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                Padding(
                  padding: EdgeInsets.only(
                    top: MySize.getScaledSizeHeight(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(
                            // left: MySize.getScaledSizeWidth(6.5),
                            right: MySize.getScaledSizeWidth(
                                MediaQuery.sizeOf(context).width > 1146
                                    ? 6.5
                                    : 0),
                            bottom: MySize.getScaledSizeHeight(17),
                          ),
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            vertical: MySize.getScaledSizeWidth(16),
                            horizontal: MySize.getScaledSizeWidth(27),
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.greyF8F8F8,
                            borderRadius: BorderRadius.circular(
                              MySize.getScaledSizeWidth(10),
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                AppAsset.noOrderIcon,
                                height: MySize.getScaledSizeHeight(
                                  17,
                                ),
                                width: MySize.getScaledSizeWidth(
                                  20,
                                ),
                                fit: BoxFit.contain,
                              ),
                              SizedBox(
                                width: MySize.getScaledSizeWidth(
                                  10,
                                ),
                              ),
                              Text(
                                AppString.noOrderedItems,
                                style: AppTextStyle.medium.copyWith(
                                  fontSize: MySize.getScaledSizeWidth(14),
                                  color: AppColor.black212121,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      MediaQuery.sizeOf(context).width < 1146
                          ? const SizedBox()
                          : Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: MySize.getScaledSizeWidth(6.5),
                                  bottom: MySize.getScaledSizeHeight(17),
                                ),
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                  vertical: MySize.getScaledSizeWidth(16),
                                  horizontal: MySize.getScaledSizeWidth(27),
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.greyF8F8F8,
                                  borderRadius: BorderRadius.circular(
                                    MySize.getScaledSizeWidth(10),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      AppAsset.carIcon,
                                      height: MySize.getScaledSizeHeight(
                                        17,
                                      ),
                                      width: MySize.getScaledSizeWidth(
                                        20,
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(
                                      width: MySize.getScaledSizeWidth(
                                        10,
                                      ),
                                    ),
                                    Text(
                                      AppString.noRecentVehicleToShow,
                                      style: AppTextStyle.medium.copyWith(
                                        fontSize: MySize.getScaledSizeWidth(14),
                                        color: AppColor.black212121,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                MediaQuery.sizeOf(context).width < 1146
                    ? Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                // left: MySize.getScaledSizeWidth(6.5),
                                // right: MySize.getScaledSizeWidth(6.5),
                                bottom: MySize.getScaledSizeHeight(17),
                              ),
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                vertical: MySize.getScaledSizeWidth(16),
                                horizontal: MySize.getScaledSizeWidth(27),
                              ),
                              decoration: BoxDecoration(
                                color: AppColor.greyF8F8F8,
                                borderRadius: BorderRadius.circular(
                                  MySize.getScaledSizeWidth(10),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    AppAsset.carIcon,
                                    height: MySize.getScaledSizeHeight(
                                      17,
                                    ),
                                    width: MySize.getScaledSizeWidth(
                                      20,
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(
                                    width: MySize.getScaledSizeWidth(
                                      10,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      AppString.noRecentVehicleToShow,
                                      style: AppTextStyle.medium.copyWith(
                                        fontSize: MySize.getScaledSizeWidth(14),
                                        color: AppColor.black212121,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox()
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Image.asset(
                        AppAsset.user1,
                        height: MySize.getScaledSizeHeight(56),
                        width: MySize.getScaledSizeWidth(56),
                        fit: BoxFit.contain,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MySize.getScaledSizeHeight(16),
                          bottom: MySize.getScaledSizeHeight(8),
                        ),
                        child: Text(
                          "Lia Thomas",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.semiBold.copyWith(
                            fontSize: MySize.getScaledSizeWidth(16),
                            color: AppColor.black212121,
                          ),
                        ),
                      ),
                      Text(
                        "lia.thomas516@reddit.com",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.semiBold.copyWith(
                          fontSize: MySize.getScaledSizeWidth(12),
                          color: AppColor.black212121,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: MySize.getScaledSizeHeight(8),
                          bottom: MySize.getScaledSizeHeight(16),
                        ),
                        child: Text(
                          "+1 212-450-7890",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.semiBold.copyWith(
                            fontSize: MySize.getScaledSizeWidth(12),
                            color: AppColor.black212121,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(
                          MySize.getScaledSizeWidth(8),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            MySize.getScaledSizeWidth(28),
                          ),
                          color: AppColor.black212121,
                        ),
                        child: Text(
                          AppString.addTags,
                          style: AppTextStyle.medium.copyWith(
                            fontSize: MySize.getScaledSizeWidth(10),
                            color: AppColor.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MySize.getScaledSizeWidth(34),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: MySize.getScaledSizeWidth(15),
                    ),
                    decoration: const BoxDecoration(
                      color: AppColor.white,
                      border: Border(
                        left: BorderSide(
                          color: AppColor.grey8E8E93,
                        ),
                      ),
                    ),
                    child: MediaQuery.sizeOf(context).width < 1881
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(
                                  MySize.getScaledSizeWidth(16),
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.greyF8F8F8,
                                  borderRadius: BorderRadius.circular(
                                    MySize.getScaledSizeWidth(10),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    commonProfileDataShowView(
                                      "-- -- --",
                                      AppString.lastVisit,
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal:
                                            MySize.getScaledSizeHeight(14.3),
                                      ),
                                      height: MySize.getScaledSizeHeight(54),
                                      child: const VerticalDivider(
                                        color: AppColor.greyD6D6D6,
                                      ),
                                    ),
                                    commonProfileDataShowView(
                                      "\$0.00",
                                      AppString.averageSpend,
                                    ),
                                    Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal:
                                              MySize.getScaledSizeHeight(14.3),
                                        ),
                                        height: MySize.getScaledSizeHeight(54),
                                        child: const VerticalDivider(
                                          color: AppColor.greyD6D6D6,
                                        )),
                                    commonProfileDataShowView(
                                      "\$0.00",
                                      AppString.lifetimeSpend,
                                    ),
                                    Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal:
                                              MySize.getScaledSizeHeight(14.3),
                                        ),
                                        height: MySize.getScaledSizeHeight(54),
                                        child: const VerticalDivider(
                                          color: AppColor.greyD6D6D6,
                                        )),
                                    commonProfileDataShowView(
                                      "0",
                                      AppString.totalOrders,
                                    ),
                                    Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal:
                                              MySize.getScaledSizeHeight(14.3),
                                        ),
                                        height: MySize.getScaledSizeHeight(54),
                                        child: const VerticalDivider(
                                          color: AppColor.greyD6D6D6,
                                        )),
                                    commonProfileDataShowView(
                                      "\$0.00",
                                      AppString.averageTip,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        top: MySize.getScaledSizeHeight(16),
                                      ),
                                      // width: MySize.getScaledSizeWidth(271),
                                      padding: EdgeInsets.all(
                                        MySize.getScaledSizeWidth(16),
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColor.greyF8F8F8,
                                        borderRadius: BorderRadius.circular(
                                          MySize.getScaledSizeWidth(10),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          commonRowInProfile(
                                            AppString.loyaltyNo,
                                            "RF",
                                          ),
                                          const Divider(
                                            color: AppColor.greyD6D6D6,
                                          ),
                                          commonRowInProfile(
                                            color: AppColor.greyD2D2D2,
                                            AppString.customerSince,
                                            "Enter",
                                          ),
                                          const Divider(
                                            color: AppColor.greyD6D6D6,
                                          ),
                                          commonRowInProfile(
                                            imgPath: AppAsset.birthdayIcon,
                                            isImageShow: true,
                                            color: AppColor.greyD2D2D2,
                                            AppString.birthday,
                                            "Enter",
                                          ),
                                          const Divider(
                                            color: AppColor.greyD6D6D6,
                                          ),
                                          commonRowInProfile(
                                            imgPath: AppAsset.anniversaryIcon,
                                            isImageShow: true,
                                            color: AppColor.greyD2D2D2,
                                            AppString.anniversary,
                                            "Enter",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  MediaQuery.sizeOf(context).width < 1500
                                      ? const SizedBox()
                                      : Expanded(
                                          child: commonTotalShowContainer(
                                            title: AppString.loyalty,
                                            firstText: AppString.earned,
                                            thirdText: AppString.available,
                                            secondText: AppString.redeemed,
                                            fourText: AppString.amount,
                                          ),
                                        ),
                                  MediaQuery.sizeOf(context).width < 1500
                                      ? const SizedBox()
                                      : Expanded(
                                          child: commonTotalShowContainer(
                                            isZeroShow: true,
                                            title: AppString.visits,
                                            firstText: AppString.totalVisits,
                                            thirdText: AppString.canceled,
                                            secondText: AppString.upcoming,
                                            fourText: AppString.noShows,
                                          ),
                                        ),
                                ],
                              ),
                              MediaQuery.sizeOf(context).width < 1500
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                        top: MySize.getScaledSizeHeight(16),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: commonTotalShowContainer(
                                              isNoLeftPadding: true,
                                              isZeroShow: true,
                                              title: AppString.visits,
                                              firstText: AppString.totalVisits,
                                              thirdText: AppString.canceled,
                                              secondText: AppString.upcoming,
                                              fourText: AppString.noShows,
                                            ),
                                          ),
                                          Expanded(
                                            child: commonTotalShowContainer(
                                              isZeroShow: true,
                                              title: AppString.visits,
                                              firstText: AppString.totalVisits,
                                              thirdText: AppString.canceled,
                                              secondText: AppString.upcoming,
                                              fourText: AppString.noShows,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : const SizedBox(),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: MySize.getScaledSizeHeight(10),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          right: MySize.getScaledSizeWidth(6.5),
                                          bottom:
                                              MySize.getScaledSizeHeight(17),
                                        ),
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                          vertical:
                                              MySize.getScaledSizeWidth(16),
                                          horizontal:
                                              MySize.getScaledSizeWidth(27),
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColor.greyF8F8F8,
                                          borderRadius: BorderRadius.circular(
                                            MySize.getScaledSizeWidth(10),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              AppAsset.noOrderIcon,
                                              height:
                                                  MySize.getScaledSizeHeight(
                                                17,
                                              ),
                                              width: MySize.getScaledSizeWidth(
                                                20,
                                              ),
                                              fit: BoxFit.contain,
                                            ),
                                            SizedBox(
                                              width: MySize.getScaledSizeWidth(
                                                10,
                                              ),
                                            ),
                                            Text(
                                              AppString.noOrderedItems,
                                              style:
                                                  AppTextStyle.medium.copyWith(
                                                fontSize:
                                                    MySize.getScaledSizeWidth(
                                                        14),
                                                color: AppColor.black212121,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          left: MySize.getScaledSizeWidth(6.5),
                                          bottom:
                                              MySize.getScaledSizeHeight(17),
                                        ),
                                        width: double.infinity,
                                        padding: EdgeInsets.symmetric(
                                          vertical:
                                              MySize.getScaledSizeWidth(16),
                                          horizontal:
                                              MySize.getScaledSizeWidth(27),
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColor.greyF8F8F8,
                                          borderRadius: BorderRadius.circular(
                                            MySize.getScaledSizeWidth(10),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              AppAsset.carIcon,
                                              height:
                                                  MySize.getScaledSizeHeight(
                                                17,
                                              ),
                                              width: MySize.getScaledSizeWidth(
                                                20,
                                              ),
                                              fit: BoxFit.contain,
                                            ),
                                            SizedBox(
                                              width: MySize.getScaledSizeWidth(
                                                10,
                                              ),
                                            ),
                                            Text(
                                              AppString.noRecentVehicleToShow,
                                              style:
                                                  AppTextStyle.medium.copyWith(
                                                fontSize:
                                                    MySize.getScaledSizeWidth(
                                                        14),
                                                color: AppColor.black212121,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(
                                        MySize.getScaledSizeWidth(16),
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColor.greyF8F8F8,
                                        borderRadius: BorderRadius.circular(
                                          MySize.getScaledSizeWidth(10),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          commonProfileDataShowView(
                                            "-- -- --",
                                            AppString.lastVisit,
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                              horizontal:
                                                  MySize.getScaledSizeHeight(
                                                      14.3),
                                            ),
                                            height:
                                                MySize.getScaledSizeHeight(54),
                                            child: const VerticalDivider(
                                              color: AppColor.greyD6D6D6,
                                            ),
                                          ),
                                          commonProfileDataShowView(
                                            "\$0.00",
                                            AppString.averageSpend,
                                          ),
                                          Container(
                                              margin: EdgeInsets.symmetric(
                                                horizontal:
                                                    MySize.getScaledSizeHeight(
                                                        14.3),
                                              ),
                                              height:
                                                  MySize.getScaledSizeHeight(
                                                      54),
                                              child: const VerticalDivider(
                                                color: AppColor.greyD6D6D6,
                                              )),
                                          commonProfileDataShowView(
                                            "\$0.00",
                                            AppString.lifetimeSpend,
                                          ),
                                          Container(
                                              margin: EdgeInsets.symmetric(
                                                horizontal:
                                                    MySize.getScaledSizeHeight(
                                                        14.3),
                                              ),
                                              height:
                                                  MySize.getScaledSizeHeight(
                                                      54),
                                              child: const VerticalDivider(
                                                color: AppColor.greyD6D6D6,
                                              )),
                                          commonProfileDataShowView(
                                            "0",
                                            AppString.totalOrders,
                                          ),
                                          Container(
                                              margin: EdgeInsets.symmetric(
                                                horizontal:
                                                    MySize.getScaledSizeHeight(
                                                        14.3),
                                              ),
                                              height:
                                                  MySize.getScaledSizeHeight(
                                                      54),
                                              child: const VerticalDivider(
                                                color: AppColor.greyD6D6D6,
                                              )),
                                          commonProfileDataShowView(
                                            "\$0.00",
                                            AppString.averageTip,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                              top: MySize.getScaledSizeHeight(
                                                  16),
                                            ),
                                            // width: MySize.getScaledSizeWidth(271),
                                            padding: EdgeInsets.all(
                                              MySize.getScaledSizeWidth(16),
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColor.greyF8F8F8,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                MySize.getScaledSizeWidth(10),
                                              ),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                commonRowInProfile(
                                                  AppString.loyaltyNo,
                                                  "RF",
                                                ),
                                                const Divider(
                                                  color: AppColor.greyD6D6D6,
                                                ),
                                                commonRowInProfile(
                                                  color: AppColor.greyD2D2D2,
                                                  AppString.customerSince,
                                                  "Enter",
                                                ),
                                                const Divider(
                                                  color: AppColor.greyD6D6D6,
                                                ),
                                                commonRowInProfile(
                                                  imgPath:
                                                      AppAsset.birthdayIcon,
                                                  isImageShow: true,
                                                  color: AppColor.greyD2D2D2,
                                                  AppString.birthday,
                                                  "Enter",
                                                ),
                                                const Divider(
                                                  color: AppColor.greyD6D6D6,
                                                ),
                                                commonRowInProfile(
                                                  imgPath:
                                                      AppAsset.anniversaryIcon,
                                                  isImageShow: true,
                                                  color: AppColor.greyD2D2D2,
                                                  AppString.anniversary,
                                                  "Enter",
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        MediaQuery.sizeOf(context).width < 1500
                                            ? const SizedBox()
                                            : Expanded(
                                                child: commonTotalShowContainer(
                                                  title: AppString.loyalty,
                                                  firstText: AppString.earned,
                                                  thirdText:
                                                      AppString.available,
                                                  secondText:
                                                      AppString.redeemed,
                                                  fourText: AppString.amount,
                                                ),
                                              ),
                                        MediaQuery.sizeOf(context).width < 1500
                                            ? const SizedBox()
                                            : Expanded(
                                                child: commonTotalShowContainer(
                                                  isZeroShow: true,
                                                  title: AppString.visits,
                                                  firstText:
                                                      AppString.totalVisits,
                                                  thirdText: AppString.canceled,
                                                  secondText:
                                                      AppString.upcoming,
                                                  fourText: AppString.noShows,
                                                ),
                                              ),
                                      ],
                                    ),
                                    MediaQuery.sizeOf(context).width < 1500
                                        ? Padding(
                                            padding: EdgeInsets.only(
                                              top: MySize.getScaledSizeHeight(
                                                  16),
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child:
                                                      commonTotalShowContainer(
                                                    isZeroShow: true,
                                                    title: AppString.visits,
                                                    firstText:
                                                        AppString.totalVisits,
                                                    thirdText:
                                                        AppString.canceled,
                                                    secondText:
                                                        AppString.upcoming,
                                                    fourText: AppString.noShows,
                                                  ),
                                                ),
                                                Expanded(
                                                  child:
                                                      commonTotalShowContainer(
                                                    isZeroShow: true,
                                                    title: AppString.visits,
                                                    firstText:
                                                        AppString.totalVisits,
                                                    thirdText:
                                                        AppString.canceled,
                                                    secondText:
                                                        AppString.upcoming,
                                                    fourText: AppString.noShows,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: MySize.getScaledSizeWidth(17),
                                        bottom: MySize.getScaledSizeHeight(17),
                                      ),
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                        vertical:
                                            MySize.getScaledSizeHeight(65),
                                        horizontal:
                                            MySize.getScaledSizeWidth(72),
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColor.greyF8F8F8,
                                        borderRadius: BorderRadius.circular(
                                          MySize.getScaledSizeWidth(10),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            AppAsset.noOrderIcon,
                                            height: MySize.getScaledSizeHeight(
                                              26.67,
                                            ),
                                            width: MySize.getScaledSizeWidth(
                                              26.67,
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                          Text(
                                            AppString.noOrderedItems,
                                            style: AppTextStyle.medium.copyWith(
                                              fontSize:
                                                  MySize.getScaledSizeWidth(14),
                                              color: AppColor.black212121,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(
                                        left: MySize.getScaledSizeWidth(17),
                                      ),
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                        vertical: MySize.getScaledSizeWidth(16),
                                        horizontal:
                                            MySize.getScaledSizeWidth(27),
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColor.greyF8F8F8,
                                        borderRadius: BorderRadius.circular(
                                          MySize.getScaledSizeWidth(10),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            AppAsset.carIcon,
                                            height: MySize.getScaledSizeHeight(
                                              17,
                                            ),
                                            width: MySize.getScaledSizeWidth(
                                              20,
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                          SizedBox(
                                            width: MySize.getScaledSizeWidth(
                                              10,
                                            ),
                                          ),
                                          Text(
                                            AppString.noOrderedItems,
                                            style: AppTextStyle.medium.copyWith(
                                              fontSize:
                                                  MySize.getScaledSizeWidth(14),
                                              color: AppColor.black212121,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
    );
  }

  Container commonTotalShowContainer(
      {title,
      firstText,
      secondText,
      thirdText,
      fourText,
      bool? isZeroShow = false,
      bool? isNoLeftPadding = false}) {
    return Container(
      margin: EdgeInsets.only(
        left: MySize.getScaledSizeWidth(isNoLeftPadding == true ? 0 : 17),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: MySize.getScaledSizeWidth(13),
        vertical: MySize.getScaledSizeHeight(14),
      ),
      decoration: BoxDecoration(
        color: AppColor.greyF8F8F8,
        borderRadius: BorderRadius.circular(
          MySize.getScaledSizeWidth(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.medium.copyWith(
              fontSize: MySize.getScaledSizeWidth(14),
              color: AppColor.black212121,
            ),
          ),
          SizedBox(
            height: MySize.getScaledSizeHeight(10),
          ),
          Row(
            children: [
              Column(
                children: [
                  commonProfileDataShowView(
                    "0",
                    firstText,
                  ),
                  SizedBox(
                    height: MySize.getScaledSizeHeight(9),
                  ),
                  commonProfileDataShowView(
                    "0",
                    thirdText,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MySize.getScaledSizeWidth(20),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MySize.getScaledSizeWidth(48),
                      child: const VerticalDivider(
                        color: AppColor.greyD6D6D6,
                      ),
                    ),
                    SizedBox(
                      height: MySize.getScaledSizeHeight(9),
                    ),
                    SizedBox(
                      height: MySize.getScaledSizeWidth(48),
                      child: const VerticalDivider(
                        color: AppColor.greyD6D6D6,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  commonProfileDataShowView(
                    "0",
                    secondText,
                  ),
                  SizedBox(
                    height: MySize.getScaledSizeHeight(9),
                  ),
                  commonProfileDataShowView(
                    isZeroShow == true ? "0" : "\$00.00",
                    fourText,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row commonRowInProfile(title, text,
      {color, bool? isImageShow = false, imgPath}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              title,
              style: AppTextStyle.medium.copyWith(
                fontSize: MySize.getScaledSizeWidth(14),
                color: AppColor.black212121,
              ),
            ),
            isImageShow == true
                ? Image.asset(
                    imgPath,
                    height: MySize.getScaledSizeHeight(13.13),
                    width: MySize.getScaledSizeWidth(12.5),
                    fit: BoxFit.contain,
                  )
                : const SizedBox(),
          ],
        ),
        Text(
          text,
          style: AppTextStyle.semiBold.copyWith(
            fontSize: MySize.getScaledSizeWidth(18),
            color: color ?? AppColor.black212121,
          ),
        ),
      ],
    );
  }

  Column commonProfileDataShowView(
    title,
    subTitle,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.semiBold.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: MySize.getScaledSizeWidth(16),
            color: AppColor.black212121,
          ),
        ),
        SizedBox(
          height: MySize.getScaledSizeWidth(12),
        ),
        Text(
          subTitle,
          style: AppTextStyle.medium.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: MySize.getScaledSizeWidth(12),
            color: AppColor.black212121,
          ),
        ),
      ],
    );
  }

  Container commonIconContainer(imagePath, color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          MySize.getScaledSizeWidth(6),
        ),
      ),
      // height: MySize.getScaledSizeHeight(28),
      // width: MySize.getScaledSizeWidth(28),
      padding: EdgeInsets.symmetric(
        vertical: MySize.getScaledSizeHeight(7),
        horizontal: MySize.getScaledSizeWidth(6),
      ),
      child: Image.asset(
        imagePath,
        height: MySize.getScaledSizeHeight(15),
        width: MySize.getScaledSizeWidth(15),
        fit: BoxFit.contain,
      ),
    );
  }

  Container drawerView() {
    return Container(
      width: MySize.getScaledSizeWidth(60),
      padding: EdgeInsets.symmetric(
        horizontal: MySize.getScaledSizeWidth(10),
      ),
      color: AppColor.black,
      child: Column(
        children: [
          commonContainerDrawer(
            Image.asset(
              AppAsset.drawer1,
              height: MySize.getScaledSizeHeight(20.33),
              width: MySize.getScaledSizeWidth(49.28),
              fit: BoxFit.contain,
            ),
          ),
          commonContainerDrawer(
            Image.asset(
              AppAsset.drawer2,
              height: MySize.getScaledSizeHeight(36.37),
              width: MySize.getScaledSizeWidth(40),
              fit: BoxFit.contain,
            ),
          ),
          commonContainerDrawer(
            Image.asset(
              AppAsset.drawer3,
              height: MySize.getScaledSizeHeight(40),
              width: MySize.getScaledSizeWidth(40),
              fit: BoxFit.contain,
            ),
          ),
          commonContainerDrawer(
            Image.asset(
              AppAsset.drawer4,
              height: MySize.getScaledSizeHeight(32.66),
              width: MySize.getScaledSizeWidth(40),
              fit: BoxFit.contain,
            ),
          ),
          commonContainerDrawer(
            Image.asset(
              AppAsset.drawer5,
              height: MySize.getScaledSizeHeight(40),
              width: MySize.getScaledSizeWidth(47.56),
              fit: BoxFit.contain,
            ),
          ),
          commonContainerDrawer(
            Image.asset(
              AppAsset.drawer6,
              height: MySize.getScaledSizeHeight(33.75),
              width: MySize.getScaledSizeWidth(35.63),
              fit: BoxFit.contain,
            ),
          ),
          commonContainerDrawer(
            Column(
              children: [
                Image.asset(
                  AppAsset.drawer7,
                  height: MySize.getScaledSizeHeight(40),
                  width: MySize.getScaledSizeWidth(40),
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: MySize.getScaledSizeHeight(6),
                ),
                FittedBox(
                  child: Text(
                    AppString.version,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.semiBold.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: MySize.getScaledSizeWidth(13),
                      color: AppColor.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container commonContainerDrawer(child) {
    return Container(
      height: 146.23,
      color: AppColor.black.withValues(alpha: 0.5),
      child: child,
    );
  }

  Container topView(context) {
    return Container(
      color: AppColor.black,
      padding: EdgeInsets.only(
        top: MySize.getScaledSizeHeight(8.33),
        bottom: MySize.getScaledSizeHeight(8.33),
        left: MySize.getScaledSizeWidth(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (MediaQuery.sizeOf(context).width <= 942) {
                    controller.key.currentState!.openDrawer();
                  }
                },
                child: Image.asset(
                  AppAsset.menuIcon,
                  height: MySize.getScaledSizeHeight(
                      MediaQuery.sizeOf(context).width <= 450 ? 25 : 20),
                  width: MySize.getScaledSizeWidth(
                      MediaQuery.sizeOf(context).width <= 450 ? 25 : 30),
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MySize.getScaledSizeWidth(
                      MediaQuery.sizeOf(context).width <= 450 ? 20 : 28),
                ),
                child: Image.asset(
                  AppAsset.shapeArrow,
                  height: MySize.getScaledSizeHeight(
                      MediaQuery.sizeOf(context).width <= 450 ? 25 : 23.33),
                  width: MySize.getScaledSizeWidth(
                      MediaQuery.sizeOf(context).width <= 450 ? 25 : 30),
                  fit: BoxFit.contain,
                ),
              ),
              Image.asset(
                AppAsset.profileIcon,
                height: MySize.getScaledSizeHeight(
                    MediaQuery.sizeOf(context).width <= 450 ? 25 : 40),
                width: MySize.getScaledSizeWidth(
                    MediaQuery.sizeOf(context).width <= 450 ? 25 : 40),
                fit: BoxFit.contain,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MySize.getScaledSizeWidth(12),
                ),
                child: Column(
                  children: [
                    Text(
                      AppString.johnsonFrancisco,
                      style: AppTextStyle.semiBold.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: MySize.getScaledSizeWidth(
                            MediaQuery.sizeOf(context).width <= 450 ? 16 : 21),
                        color: AppColor.white,
                      ),
                    ),
                    MediaQuery.sizeOf(context).width < 700
                        ? Text(
                            AppString.clockInTime,
                            style: AppTextStyle.semiBold.copyWith(
                              fontSize: MySize.getScaledSizeWidth(
                                  MediaQuery.sizeOf(context).width <= 450
                                      ? 14
                                      : 18),
                              color: AppColor.white,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              MediaQuery.sizeOf(context).width < 700
                  ? const SizedBox()
                  : Text(
                      AppString.clockInTime,
                      style: AppTextStyle.semiBold.copyWith(
                        fontSize: MySize.getScaledSizeWidth(18),
                        color: AppColor.white,
                      ),
                    ),
            ],
          ),
          SizedBox(
            width: MySize.getScaledSizeWidth(
                MediaQuery.sizeOf(context).width <= 450 ? 0 : 50),
          ),
          Row(
            children: [
              MediaQuery.sizeOf(context).width < 950
                  ? const SizedBox()
                  : Text(
                      AppString.clockTime,
                      style: AppTextStyle.semiBold.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: MySize.getScaledSizeWidth(21),
                        color: AppColor.white,
                      ),
                    ),
              MediaQuery.sizeOf(context).width < 950
                  ? const SizedBox()
                  : Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MySize.getScaledSizeWidth(40),
                      ),
                      child: Image.asset(
                        AppAsset.wifiIcon,
                        height: MySize.getScaledSizeHeight(40),
                        width: MySize.getScaledSizeWidth(40),
                        fit: BoxFit.contain,
                      ),
                    ),
              Image.asset(
                AppAsset.notificationIcon,
                height: MySize.getScaledSizeHeight(
                    MediaQuery.sizeOf(context).width <= 450 ? 25 : 40),
                width: MySize.getScaledSizeWidth(
                    MediaQuery.sizeOf(context).width <= 450 ? 25 : 40),
                fit: BoxFit.contain,
              ),
            ],
          )
        ],
      ),
    );
  }
}
