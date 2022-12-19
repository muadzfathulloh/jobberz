import 'package:flutter/material.dart';

class RecomCard extends StatelessWidget {
  const RecomCard(
      {super.key,
      required this.title,
      required this.category_1,
      required this.category_2,
      required this.locate});
  final String title;
  final String category_1;
  final String category_2;
  final String locate;
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    locate,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Color(0XFFD9D9D9),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
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
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
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
              const SizedBox(height: 5),
            ],
          ),
        ));
  }
}
