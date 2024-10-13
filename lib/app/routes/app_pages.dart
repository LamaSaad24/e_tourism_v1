import 'package:e_tourism/app/data/repositories/admin/drivers/bindings/drivers.dart';
import 'package:e_tourism/app/data/repositories/admin/drivers/views/drivers.view.dart';
import 'package:e_tourism/app/data/repositories/admin/drivers/views/widgets/EditDriverView.dart';
import 'package:e_tourism/app/data/repositories/admin/guides/bindings/guides.dart';
import 'package:e_tourism/app/data/repositories/admin/guides/views/guides.view.dart';
import 'package:e_tourism/app/data/repositories/admin/guides/views/widgets/EditGuideView.dart';
import 'package:e_tourism/app/data/repositories/admin/home/bindings/admin_home.bindings.dart';
import 'package:e_tourism/app/data/repositories/admin/home/views/admin_home.view.dart';
import 'package:e_tourism/app/data/repositories/admin/programmes/bindings/programmes.dart';
import 'package:e_tourism/app/data/repositories/admin/programmes/views/programmes.dart';
import 'package:e_tourism/app/data/repositories/admin/programmes/views/widgets/EditProgrammeView.dart';
import 'package:e_tourism/app/data/repositories/admin/tourists/bindings/tourists.dart';
import 'package:e_tourism/app/data/repositories/admin/tourists/views/tourists.dart';
import 'package:e_tourism/app/data/repositories/admin/tourists/views/widgets/EditTouristView.dart';
import 'package:e_tourism/app/data/repositories/admin/tours/bindings/DetailsTour.dart';
import 'package:e_tourism/app/data/repositories/admin/tours/bindings/tours.dart';
import 'package:e_tourism/app/data/repositories/admin/tours/views/tours.dart';
import 'package:e_tourism/app/data/repositories/admin/tours/views/widgets/DetailsTourView.dart';
import 'package:e_tourism/app/data/repositories/admin/tours/views/widgets/EditTourView.dart';
import 'package:e_tourism/app/modules/tour_details/bindings/tour_details_binding.dart';
import 'package:e_tourism/app/modules/tour_details/views/tour_details_view.dart';
import 'package:get/get.dart';
import 'package:e_tourism/app/modules/code_check/bindings/register_code_binding.dart';
import 'package:e_tourism/app/modules/code_check/views/register_code_view.dart';
import 'package:e_tourism/app/modules/home/views/main_view.dart';
import 'package:e_tourism/app/modules/splash/binding/launch_binding.dart';
import 'package:e_tourism/app/modules/splash/view/launch_view.dart';
import 'package:e_tourism/app/modules/login/bindings/login_binding.dart';
import 'package:e_tourism/app/modules/login/views/login_view.dart';
import 'package:e_tourism/app/modules/notifications/bindings/notification_bindings.dart';
import 'package:e_tourism/app/modules/notifications/views/notification_view.dart';
import 'package:e_tourism/app/modules/payment/bindings/payment_bindings.dart';
import 'package:e_tourism/app/modules/payment/views/payment_view.dart';
import 'package:e_tourism/app/modules/payment/views/widgets/payment_completion.dart';
import 'package:e_tourism/app/modules/product_details/bindings/product_details_binding.dart';
import 'package:e_tourism/app/modules/product_details/views/product_details_view.dart';
import 'package:e_tourism/app/modules/register/bindings/register_binding.dart';
import 'package:e_tourism/app/modules/register/views/register_view.dart';
import 'package:e_tourism/app/modules/user_profile/bindings/user_profile.binding.dart';
import 'package:e_tourism/app/modules/user_profile/views/user_profile.view.dart';
import '../modules/home/bindings/home_binding.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.INITIAL;
  // dashboard
  static const INITIAL = Routes.LOGIN;
  static const HOME_DASH = Routes.HOME_DASH;
  static const guides = Routes.Guides;
  static const edit_guides = Routes.EditGuides;
  static const drivers = Routes.Drivers;
  static const edit_drivers = Routes.EditDrivers;
  static const programmes = Routes.Programmes;
  static const edit_programmes = Routes.EditProgrammes;
  static const tours = Routes.Tours;
  static const DETAILS_TOUR = Routes.DETAILS_TOUR;
  static const edit_tours = Routes.EditTours;
  static const tourists = Routes.Tourists;
  static const edit_tourists = Routes.EditTourists;
  //users
  static const HOME = Routes.HOME;
  static const LOGIN = Routes.LOGIN;
  static const REGISTER = Routes.REGISTER;
  static const REGISTER_CODE = Routes.REGISTER_CODE;
  static const PRODUCT_DETAILS = Routes.PRODUCT_DETAILS;
  static const TOUR_DETAILS = Routes.TOUR_DETAILS;
  static const PAYMENT = Routes.PAYMENT;
  static const PAYMENT_CONFIRMATION = Routes.PAYMENT_CONFIRMATION;
  static const NOTIFICATION = Routes.NOTIFICATION;
  static const USER_PROFILE = Routes.USER_PROFILE;

  static final routes = [
    GetPage(
      name: _Paths.INITIAL,
      page: () => LaunchView(),
      binding: LaunchBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_CODE,
      page: () => const RegisterCodeView(),
      binding: RegisterCodeBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => ProductDetailsView(),
      binding: ProductsDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => PaymentView(),
      binding: PaymentBindings(),
    ),
    GetPage(
      name: _Paths.PAYMENT_CONFIRMATION,
      page: () => PaymentConfirmation(),
      binding: PaymentBindings(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBindings(),
    ),
    GetPage(
      name: _Paths.USER_PROFILE,
      page: () => UserProfileView(),
      binding: UserProfileBinding(),
    ),
    //dashboard
    GetPage(
      name: _Paths.HOME_DASH,
      page: () => AdminHomeView(),
      binding: AdminHomeBindings(),
    ),
    GetPage(
      name: _Paths.Guides,
      page: () => GuidesView(),
      binding: GuidesBindings(),
    ),
    GetPage(
      name: _Paths.EditGuides,
      page: () => EditGuideView(),
    ),
    GetPage(
      name: _Paths.Drivers,
      page: () => DriversView(),
      binding: DriversBindings(),
    ),
    GetPage(
      name: _Paths.EditDrivers,
      page: () => EditDriverView(),
    ),
    GetPage(
      name: _Paths.Programmes,
      page: () => ProgrammesView(),
      binding: ProgrammesBindings(),
    ),
    GetPage(
      name: _Paths.EditProgrammes,
      page: () => EditProgrammeView(),
    ),
    GetPage(
      name: _Paths.Tours,
      page: () => ToursView(),
      binding: ToursBindings(),
    ),
    GetPage(
      name: _Paths.DETAILS_TOUR,
      page: () => DetailsTourView(),
      binding: DetailsTourBindings()
    ),
    GetPage(
      name: _Paths.EditTours,
      page: () => EditTourView(),
        binding: DetailsTourBindings()
    ),
    GetPage(
      name: _Paths.Tourists,
      page: () => TouristsView(),
      binding: TouristsBindings(),
    ),
    GetPage(
      name: _Paths.EditTourists,
      page: () => EditTouristsView(),
      
    ),
    //users
    GetPage(
      name: _Paths.TOUR_DETAILS,
      page: () => TourDetailsView(),
      binding: TourDetailsBinding(),
    ),
  ];
}
