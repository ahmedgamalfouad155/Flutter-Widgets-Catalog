import 'package:flutter/material.dart';
import 'package:flutter_widgets_catalog/absorb_pointer.dart';
import 'package:flutter_widgets_catalog/animated_builder.dart';
import 'package:flutter_widgets_catalog/auto_complete_example.dart';
import 'package:flutter_widgets_catalog/baseline_view.dart';
import 'package:flutter_widgets_catalog/clip_path.dart';
import 'package:flutter_widgets_catalog/custom_paint_view.dart';
import 'package:flutter_widgets_catalog/draggable_sheet_view.dart';
import 'package:flutter_widgets_catalog/interactive_viewer.dart';
import 'package:flutter_widgets_catalog/layoutbuilder_view.dart';
import 'package:flutter_widgets_catalog/notification_listeber_demo.dart';
import 'package:flutter_widgets_catalog/transform_view.dart';
import 'package:flutter_widgets_catalog/vavigator_fun.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home View')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // لو عايز اتحكم في الاسكرول مثلا لو وصلت احر الليست اعمل اكشن معين
            // او لو مثلا عايز لما اسكرول لتحت الاب بار يختفي و لو لفوق يظهر و كدا
            TextButton(
              onPressed: () => navigation(context, NotificationListenerDemo()),
              child: Text("Notification Listener Demo"),
            ),
            //لو عايز اعمل كيرف
            TextButton(
              onPressed: () => navigation(context, ClipPathView()),
              child: Text("Clip Path Demo"),
            ),
            //اقدر ارسم الويدجيت و الشكل للي عايزه
            TextButton(
              onPressed: () => navigation(context, CustomPaintView()),
              child: Text("Custom Paint Demo"),
            ),
            // اقدر اعمل و اتحكم في الشكل و اتجاهه
            TextButton(
              onPressed: () => navigation(context, TransformDemoPage()),
              child: Text("Transform Demo"),
            ),
            // بخلي اي ويدجيتس عندي تكون علي نفس الخط بحتاجها اكتر في الكلام و كدا مع اختلاف الحجم
            TextButton(
              onPressed: () => navigation(context, BaselineExample()),
              child: Text("Baseline Demo"),
            ),
            TextButton(
              onPressed: () => navigation(context, LayoutBuilderVsMediaQuery()),
              child: Text("layout Builder Demo"),
            ),
            // بتحكم اكتر في مثلا لو عندي زارار عايز اوقف الضغك عليه اثناء حاجه معنيه
            TextButton(
              onPressed: () => navigation(context, AbsorbPointerExample()),
              child: Text("Absorb Pointer Demo"),
            ),
            //اظهار شيت من  تحت و اتحكم فيه براحتي
            TextButton(
              onPressed: () => navigation(context, DraggableSheetExample()),
              child: Text("Draggable Sheet Demo"),
            ),
            //تكبير و تصغير الصور
            TextButton(
              onPressed: () => navigation(context, InteractiveViewerExample()),
              child: Text("Interactive Viewer Demo"),
            ),
            // اكمل الكلام تلقائي داخل تيكست فيلد
            TextButton(
              onPressed: () => navigation(context, AutoCompleteExample()),
              child: Text("Auto Complete Demo"),
            ),
            TextButton(
              onPressed: () => navigation(context, AnimatedRotationExample()),
              child: Text(" Animated Builder  Demo"),
            ),
          ],
        ),
      ),
    );
  }
}
