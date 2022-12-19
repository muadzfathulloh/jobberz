import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jobberz_app/routes/app_routes.dart';

class FeaturedCard extends StatelessWidget {
  const FeaturedCard(
      {super.key,
      required this.title,
      required this.company,
      required this.rate,
      required this.category_1,
      required this.category_2,
      required this.people});
  final String title;
  final String company;
  final String rate;
  final String category_1;
  final String category_2;
  final String people;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                spreadRadius: -4)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 65,
                    height: 65,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          Text(
                            company,
                          ),
                          const SizedBox(width: 10),
                          Row(
                            children: [
                              Text(
                                rate,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(width: 4),
                              SvgPicture.asset('assets/icons/rate.svg')
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            decoration: const BoxDecoration(
                              color: Color(0XFFD9D9D9),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Center(
                                  child: Text(
                                category_1,
                                style: const TextStyle(
                                    fontSize: 12, color: Color(0XFF7A7D7E)),
                              )),
                            ),
                          ),
                          const SizedBox(width: 2),
                          Container(
                            height: 30,
                            decoration: const BoxDecoration(
                              color: Color(0XFFD9D9D9),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Center(
                                  child: Text(
                                category_2,
                                style: const TextStyle(
                                    fontSize: 12, color: Color(0XFF7A7D7E)),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 8),
                  SvgPicture.asset(
                    'assets/icons/profile-add.svg',
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    people,
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
