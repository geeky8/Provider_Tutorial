import 'package:flutter/material.dart';
import 'package:internship/constants.dart';
import 'package:internship/state_enum.dart';
import 'package:internship/state_notifier.dart';
import 'package:internship/user_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: ChangeNotifierProvider(
        create: (context) => StateNotifier(),
        child: Container(
          // padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Consumer<StateNotifier>(
              builder: (context, stateNotifier, _) => Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Consumer<StateNotifier>(
                          builder: (context, stateNotifier, _) {
                        final state = stateNotifier.state;
                        switch (state) {
                          case ScreenState.PROFILE:
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    // stateNotifier.changeState(
                                    //     currentState: stateNotifier.state);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                ),
                                const Text('Profile',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
                                const SizedBox(
                                  width: 40,
                                ),
                              ],
                            );
                          case ScreenState.EDIT:
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    stateNotifier.changeState(
                                        currentState: stateNotifier.state);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                const Text('Edit info',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff626262),
                                    )),
                                const SizedBox(
                                  width: 100,
                                ),
                              ],
                            );
                        }
                      }),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer<StateNotifier>(builder: (context, stateNotifier, _) {
                    final state = stateNotifier.state;
                    switch (state) {
                      case ScreenState.PROFILE:
                        return const ShowProfile();
                      case ScreenState.EDIT:
                        return const EditProfile();
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final countryController = TextEditingController();
    final cityController = TextEditingController();
    final genderController = TextEditingController();
    final whatAmIDoingController = TextEditingController();
    final parentEmailController = TextEditingController();
    final gradeController = TextEditingController();
    final boardController = TextEditingController();

    final stateNotifier = context.read<StateNotifier>();

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                child: Image.asset(
                  'assets/images/image.png',
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.width / 2.1,
                  width: MediaQuery.of(context).size.width / 2.2,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: const Color(0xff630BFF), width: 2),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Upload new photo',
                      style: TextStyle(
                          color: Color(0xff630BFF),
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    )),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'About Me',
                style: TextStyle(
                    color: Color(0xff264F6C),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 15,
              ),
              LabelDetails(
                label: 'Name',
                text: stateNotifier.userModel.name,
                controller: nameController,
              ),
              LabelDetails(
                label: 'Email',
                text: stateNotifier.userModel.email,
                controller: emailController,
              ),
              LabelDetails(
                label: 'Contact Number',
                text: stateNotifier.userModel.phoneNo,
                controller: phoneController,
              ),
              LabelDetails(
                label: 'Country',
                text: stateNotifier.userModel.country,
                controller: countryController,
              ),
              LabelDetails(
                label: 'City',
                text: stateNotifier.userModel.city,
                controller: cityController,
              ),
              LabelDetails(
                label: 'Gender',
                text: stateNotifier.userModel.gender,
                controller: genderController,
              ),
              LabelDetails(
                label: 'What I am currently doing',
                text: stateNotifier.userModel.whatAmIDoing,
                controller: whatAmIDoingController,
              ),
              LabelDetails(
                label: 'Parent’s Email ID',
                text: stateNotifier.userModel.parentEmail,
                controller: parentEmailController,
              ),
              LabelDetails(
                label: 'Which grade I’m in',
                text: stateNotifier.userModel.grade,
                controller: gradeController,
              ),
              LabelDetails(
                label: 'Which school board I’m in',
                text: stateNotifier.userModel.board,
                controller: boardController,
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  final model = stateNotifier.userModel;
                  // if (nameController.text != " ") {
                  //   model = model.copyWith(
                  //     name: nameController.text.trim(),
                  //   );
                  // }
                  // if (emailController.text != " ") {
                  //   model = model.copyWith(
                  //     email: emailController.text.trim(),
                  //   );
                  // }
                  // if (phoneController.text != " ") {
                  //   model = model.copyWith(
                  //     phoneNo: phoneController.text.trim(),
                  //   );
                  // }
                  // if (countryController.text != " ") {
                  //   model = model.copyWith(
                  //     country: countryController.text.trim(),
                  //   );
                  // }
                  // if (cityController.text != " ") {
                  //   model = model.copyWith(
                  //     city: cityController.text.trim(),
                  //   );
                  // }
                  // if (genderController.text != " ") {
                  //   model = model.copyWith(
                  //     gender: genderController.text.trim(),
                  //   );
                  // }
                  // if (whatAmIDoingController.text != " ") {
                  //   model = model.copyWith(
                  //     whatAmIDoing: whatAmIDoingController.text.trim(),
                  //   );
                  // }
                  // if (parentEmailController.text != " ") {
                  //   model = model.copyWith(
                  //     parentEmail: parentEmailController.text.trim(),
                  //   );
                  // }
                  // if (gradeController.text != " ") {
                  //   model = model.copyWith(
                  //     grade: gradeController.text.trim(),
                  //   );
                  // }
                  // if (boardController.text != " ") {
                  //   model = model.copyWith(
                  //     board: boardController.text.trim(),
                  //   );
                  // }
                  // print(phoneController.text.trim());
                  final copyModel = model.copyWith(
                    name: (nameController.text.trim().isNotEmpty)
                        ? nameController.text.trim()
                        : model.name,
                    email: (emailController.text.trim().isNotEmpty)
                        ? emailController.text.trim()
                        : model.email,
                    phoneNo: (phoneController.text.trim().isNotEmpty)
                        ? phoneController.text.trim()
                        : model.phoneNo,
                    country: (countryController.text.trim().isNotEmpty)
                        ? countryController.text.trim()
                        : model.country,
                    city: (cityController.text.trim().isNotEmpty)
                        ? cityController.text.trim()
                        : model.city,
                    gender: (genderController.text.trim().isNotEmpty)
                        ? genderController.text.trim()
                        : model.gender,
                    parentEmail: (parentEmailController.text.trim().isNotEmpty)
                        ? parentEmailController.text.trim()
                        : model.parentEmail,
                    whatAmIDoing:
                        (whatAmIDoingController.text.trim().isNotEmpty)
                            ? whatAmIDoingController.text.trim()
                            : model.whatAmIDoing,
                    grade: (gradeController.text.trim().isNotEmpty)
                        ? gradeController.text.trim()
                        : model.grade,
                    board: (boardController.text.trim().isNotEmpty)
                        ? boardController.text.trim()
                        : model.board,
                  );
                  stateNotifier.updateModel(model: copyModel);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ShowProfile extends StatelessWidget {
  const ShowProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: const [
          UserHeader(),
          SizedBox(
            height: 15,
          ),
          Profile(),
          SizedBox(
            height: 15,
          ),
          CareerClarity(),
          SizedBox(
            height: 15,
          ),
          Activity(),
          SizedBox(
            height: 15,
          ),
          BackGround(),
          SizedBox(
            height: 15,
          ),
          Settings(),
        ],
      ),
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Settings',
            style: headerStyle,
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_downward,
                size: 22,
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Profile (100%)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 5,
          ),
          LinearProgressIndicator(
            value: 100,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}

class BackGround extends StatelessWidget {
  const BackGround({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stateNotifier = context.read<StateNotifier>();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Consumer<StateNotifier>(builder: (context, notifier, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Background',
              style: headerStyle,
            ),
            const SizedBox(
              height: 15,
            ),
            LabelDetails(
              label: 'Name',
              text: notifier.userModel.name,
            ),
            LabelDetails(
              label: 'Email',
              text: notifier.userModel.email,
            ),
            LabelDetails(
              label: 'Contact Number',
              text: '+91 ${notifier.userModel.phoneNo}',
            ),
            LabelDetails(
              label: 'Country',
              text: notifier.userModel.country,
            ),
            LabelDetails(
              label: 'City',
              text: notifier.userModel.city,
            ),
            LabelDetails(
              label: 'Gender',
              text: notifier.userModel.gender,
            ),
            LabelDetails(
              label: 'What I am currently doing',
              text: notifier.userModel.whatAmIDoing,
            ),
            LabelDetails(
              label: 'Parent’s Email ID',
              text: notifier.userModel.parentEmail,
            ),
            LabelDetails(
              label: 'Which grade I’m in',
              text: notifier.userModel.grade,
            ),
            LabelDetails(
              label: 'Which school board I’m in',
              text: notifier.userModel.board,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    stateNotifier.changeState(currentState: notifier.state);
                  },
                  child: const Text(
                    'Update',
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                        color: Colors.black38,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ],
        );
      }),
    );
  }
}

class LabelDetails extends StatelessWidget {
  const LabelDetails({
    required this.label,
    required this.text,
    this.controller,
    Key? key,
  }) : super(key: key);

  final String label;
  final String text;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label :',
            style: const TextStyle(
                color: Colors.black26,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          if (controller == null)
            const SizedBox(
              height: 5,
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (controller == null)
                Text(
                  text,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              if (controller != null)
                TextField(
                  controller: controller,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    hintText: text,

                    // labelText: label,
                    hintStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              if (controller == null)
                const Divider(
                  color: Colors.black,
                  thickness: 1.5,
                ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}

class Activity extends StatelessWidget {
  const Activity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 140,
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'My Activity',
            style: headerStyle,
          ),
          const SizedBox(
            height: 15,
          ),
          FittedBox(
            child: Row(
              children: const [
                ActivityBox(
                  num: '2',
                  text: 'Hour(s) spent on\nCareer learning',
                  color: Colors.orange,
                ),
                SizedBox(
                  width: 7,
                ),
                ActivityBox(
                  num: '6',
                  text: 'Career(s) Explored\n ',
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ActivityBox extends StatelessWidget {
  const ActivityBox({
    required this.num,
    required this.text,
    required this.color,
    Key? key,
  }) : super(key: key);

  final String num;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            num,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}

class CareerClarity extends StatelessWidget {
  const CareerClarity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Text(
            'Career Clarity',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
            'I have a general idea',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

class UserHeader extends StatelessWidget {
  const UserHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stateNotifier = context.read<StateNotifier>();
    return SizedBox(
      child: Row(
        children: [
          Container(
            // padding: const EdgeInsets.all(28),
            child: Image.asset(
              'assets/images/profile.png',
              fit: BoxFit.contain,
              height: 80,
              width: 80,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.purple),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stateNotifier.userModel.name,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'I am here to find what aligns with my interests',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
