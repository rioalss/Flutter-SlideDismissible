import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List color = [];

  @override
  void initState() {
    color = [
      const Color.fromARGB(255, 37, 37, 37),
      const Color.fromARGB(255, 238, 63, 63),
      const Color.fromARGB(255, 255, 234, 46),
      const Color.fromARGB(255, 183, 63, 238),
    ];
    super.initState();
  }

  void dismiss(int index) {
    setState(() => color.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Messages',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: color.length,
                  itemBuilder: (context, i) => listTile(color[i], i)),
            ],
          ),
        ),
      ),
    );
  }

  Column listTile(Color color, int index) {
    return Column(children: [
      Slidable(
        key: UniqueKey(),
        closeOnScroll: true,
        endActionPane: ActionPane(
            motion: const DrawerMotion(),
            dismissible: DismissiblePane(
              onDismissed: () {
                dismiss(index);
              },
              closeOnCancel: true,
            ),
            children: [
              SlidableAction(
                  autoClose: false,
                  borderRadius: BorderRadius.circular(25),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete_outline,
                  onPressed: (context) {
                    final slidable = Slidable.of(context);
                    slidable?.dismiss(
                        ResizeRequest(const Duration(milliseconds: 500), () {
                      dismiss(index);
                    }));
                  })
            ]),
        child: Container(
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [
                0.1,
                0.5,
              ],
              colors: [
                color.withOpacity(0.7),
                color,
              ],
            ),
          ),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade400,
            highlightColor: Colors.white,
            child: ListTile(
              title: Container(
                margin: const EdgeInsets.only(right: 150),
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              subtitle: Container(
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              leading: const CircleAvatar(),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 15,
      )
    ]);
  }
}
