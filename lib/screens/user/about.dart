import 'package:flutter/material.dart';
import 'package:fitpro/widget/colors.dart';
import 'package:fitpro/widget/custom_appbar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.Black,
      appBar: customAppBar(context, text1: 'About', back: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'About FitPro',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: MyColors.White,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Welcome to FitPro, your all-in-one fitness companion designed to help you achieve your health and wellness goals. Whether you\'re just starting your fitness journey or you\'re a seasoned athlete, FitPro is here to guide you every step of the way.',
                style: TextStyle(fontSize: 16, color: MyColors.White),
              ),
              const SizedBox(height: 16),
              const Text(
                'Features:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: MyColors.White,
                ),
              ),
              const SizedBox(height: 8),
              _buildFeatureItem('Personalized Workouts', 'Tailored workout plans for beginners, intermediates, and advanced users. Each plan is crafted to suit your fitness level and help you progress efficiently.'),
              _buildFeatureItem('Diet Tracking', 'Monitor your diet with category-specific recommendations for underweight, normal weight, overweight, and obesity. Get personalized diet plans based on your BMI and fitness goals.'),
              _buildFeatureItem('Favorite Workouts', 'Save your favorite exercises and access them quickly anytime you need. Build a routine that works best for you.'),
              _buildFeatureItem('Workout History', 'Track your workout history and monitor your progress over time. Stay motivated by seeing how far you\'ve come.'),
              _buildFeatureItem('BMI Calculator', 'Calculate your Body Mass Index (BMI) and get tailored fitness and diet advice to help you reach your ideal weight.'),
              _buildFeatureItem('Custom Workouts', 'Create your custom workout routines by selecting exercises that match your goals. Make your fitness journey unique and enjoyable.'),
              _buildFeatureItem('Cool-off Timer', 'Before each workout, enjoy a cool-off period with guided breathing exercises to prepare your mind and body for the session ahead.'),
              _buildFeatureItem('Seamless UI', 'Experience a user-friendly interface that makes navigating the app simple and enjoyable, whether you\'re setting up a new workout or tracking your diet.'),
              const SizedBox(height: 16),
              const Text(
                'Our Mission:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: MyColors.White,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'At FitPro, we believe that fitness is more than just exercise—it\'s about building a lifestyle that promotes health, well-being, and confidence. Our mission is to provide you with the tools and support you need to make informed decisions about your fitness journey, helping you to achieve your goals and maintain a healthy lifestyle.',
                style: TextStyle(fontSize: 16, color: MyColors.White),
              ),
              const SizedBox(height: 16),
              const Text(
                'Get Started:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: MyColors.White),
              ),
              const SizedBox(height: 8),
              const Text(
                'Join thousands of users who have transformed their lives with FitPro. Download the app, set your goals, and start your journey towards a healthier, fitter you!',
                style: TextStyle(fontSize: 16, color: MyColors.White),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: MyColors.White,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(fontSize: 16, color: MyColors.White),
          ),
        ],
      ),
    );
  }
}
