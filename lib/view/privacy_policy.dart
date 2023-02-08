import 'package:flutter/material.dart';
import 'package:therapy/Helper/colors.dart';
import 'package:therapy/view/appBar/appBar.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Privacy Policy", context),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 15,bottom: 15),
        child: Column(    
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[  
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 12),
               child: Text(
              "Our Privacy Policy",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.fontColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),),
          const SizedBox(height: 10,),
            Padding(padding: EdgeInsets.only(left: 12,right: 12,bottom: 8,top: 3),child: Text("Last update 2022",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.fontClr,
                  fontWeight: FontWeight.w500,
                  fontSize: 13)),),
             Divider(
              height: 4,
              color: Theme.of(context).colorScheme.fontClr,
            ),
            const SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 12,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("1. Using our service",style: TextStyle(color: colors.primary,fontSize: 14,fontWeight: FontWeight.w600),),
                  const SizedBox(height: 8,),
                  Text("Lorem Ipsum is simply dummy text of the Lorem Ipsum is simply dummy text of the and typesetting industry. Lorem Ipsum Lorem Ipsum is simply dummy text of the Lorem Ipsum is simply dummy text of the Lorem Ipsum is simply dummy and typesetting industry. Lorem Ipsum industry's standard dummy when an unknown printer took a galley of type and scrambled it and typesetting industry. Lorem Ipsum industry's standard dummy since the 1500s, when an unknown printer took a galley of type and scrambled it and typesetting industry. Lorem Ipsum industry's standard dummy since the 1500s, when an unknown printer took a galley of type and scrambled it industry's standard dummy since the 1500s, when an unknown printer took a galley of type and scrambled it and typesetting industry. Lorem Ipsum industry's standard dummy since the 1500s, when an unknown printer took a galley of type and scrambled it",style: TextStyle(
                    color: Theme.of(context).colorScheme.fontClr,
                    fontWeight: FontWeight.w500,
                    fontSize: 14
                  ),)
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                const  Text("2. Using our service",style: TextStyle(color: colors.primary,fontSize: 14,fontWeight: FontWeight.w600),),
                 const SizedBox(height: 8,),
                  Text("Lorem Ipsum is simply dummy text of the Lorem Ipsum is simply dummy text of the and typesetting industry. Lorem Ipsum Lorem Ipsum is simply dummy text of the Lorem Ipsum is simply dummy text of the Lorem Ipsum is simply dummy and typesetting industry. Lorem Ipsum industry's standard dummy when an unknown printer took a galley of type and scrambled it and typesetting industry. Lorem Ipsum industry's standard dummy since the 1500s, when an unknown printer took a galley of type and scrambled it and typesetting industry. Lorem Ipsum industry's standard dummy since the 1500s, when an unknown printer took a galley of type and scrambled it industry's standard dummy since the 1500s, when an unknown printer took a galley of type and scrambled it and typesetting industry. Lorem Ipsum industry's standard dummy since the 1500s, when an unknown printer took a galley of type and scrambled it",style: TextStyle(
                      color: Theme.of(context).colorScheme.fontClr,
                      fontWeight: FontWeight.w500,
                      fontSize: 14
                  ),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
