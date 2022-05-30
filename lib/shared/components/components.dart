// ignore_for_file: prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:final_news_application/modules/web_view.dart';
import 'package:flutter/material.dart';

Widget buildArticleItem(article, context) => InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen("${article['url']}"));
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image: NetworkImage(
                    "${article['urlToImage']}",
                  ),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "${article['title']}",
                    style: Theme.of(context).textTheme.bodyText2,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  "${article['publishedAt']}",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
        )
      ],
    ),
  ),
);

Widget myDivider() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 2,
      color: Colors.grey,
    ),
  );
}

Widget articleBuilder(list, context, {isSearch = false}) {
  return ConditionalBuilder(
    condition: list.isNotEmpty,
    builder: (BuildContext context) {
      return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildArticleItem(list[index], context),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: list.length);
    },
    fallback: (BuildContext context) {
      return isSearch? Container() : Center(child: CircularProgressIndicator());
    },
  );
}

Widget defaultFormField({
  required TextInputType type,
  required TextEditingController controller,
  required FormFieldValidator validator,
  required String label,
  required Icon prefix,
  Icon? suffix,
  ValueChanged? onChanged,
  GestureTapCallback? onTaped,
  bool isPassword = false,
  double borderRadius = 2.0,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
    validator: validator,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      suffixIcon: suffix != null ? suffix : null,
      prefixIcon: prefix,
      labelText: label,
    ),
    onTap: onTaped,
    onChanged: onChanged,
    obscureText: isPassword,
  );
}

void navigateTo(context, Widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return Widget;
  }));
}
