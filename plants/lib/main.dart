import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(394, 848),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UI(),
      ),
    );
  }
}

class UI extends StatelessWidget {
  const UI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "PlantsCo.",
                    style: GoogleFonts.workSans(fontSize: 28.sp),
                  ),
                  SvgPicture.asset(
                    'assets/purse.svg',
                    fit: BoxFit.cover,
                    height: 31.sp,
                    width: 31.sp,
                    color: Colors.black,
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  image: AssetImage('assets/main_img.jpg'),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    categories(isSelected: true, text: "All"),
                    categories(isSelected: false, text: "Outdoor"),
                    categories(isSelected: false, text: "Indoor"),
                    categories(isSelected: false, text: "Office Plants"),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      plantCard(
                          name: "Small Potted Plant",
                          imgPath: "assets/pngFiles/p1.jpg",
                          price: "400"),
                      plantCard(
                          name: "Office Plant",
                          imgPath: "assets/pngFiles/p1.jpg",
                          price: "670"),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      plantCard(
                          name: "Outdoor Plant",
                          imgPath: "assets/pngFiles/p3.jpg",
                          price: "560"),
                      plantCard(
                          name: "Indoor Plant",
                          imgPath: "assets/pngFiles/p4.jpg",
                          price: "270"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container plantCard(
      {required String name, required String price, required String imgPath}) {
    return Container(
      height: 220.h,
      width: 170.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imgPath,
              height: 220.h,
              width: 206.w,
              fit: BoxFit.cover,
            )),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(255, 31, 97, 34).withOpacity(0.7),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.r),
                        bottomRight: Radius.circular(15.r))),
                width: 206.w,
                height: 50.h,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 10.h,
                        ),
                        Flexible(
                          child: Text(
                            name,
                            style: GoogleFonts.workSans(
                              fontSize: 16.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "Rs." + price + "/-",
                              style: GoogleFonts.workSans(
                                  fontSize: 15.sp, color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/forward_arrow.svg'),
                            SizedBox(
                              width: 10.w,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )))
      ]),
    );
  }

  GestureDetector categories({required bool isSelected, required String text}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: isSelected ? Colors.green : Colors.white),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.h),
            child: Text(
              text,
              style: GoogleFonts.workSans(
                  fontSize: 18.sp,
                  color: isSelected ? Colors.white : Colors.black),
            ),
          )),
    );
  }
}
