class ApiUrl {
  ApiUrl._();
  // String baseUrl = 'https://mechanicapp-9f8ff2cc0a94.herokuapp.com/api/v1/';
  static const baseUrl = 'https://mechanicapi.carmagard.com/api/v1/';
  static const signUp = "m-registration";
  static const activation = "m-activate";
  static const login = "m-login";
  static const mInfo = "m-me";
  static const logout = "m-logout";
  static const forgotPassword = "forgot-password";
  static const verifyForgotPassword = "verify-forgot-password";
  static const saveNewPassword = "set-new-password";
  static const setProfile = "m-set-profile";
  static const setService = "m-set-services";
  static const getUserService = "m-get-service";
  static const getAllService = "get-all-services";

  /// https://mechanicapi.carmagard.com/api/v1/m-delete-myservice/{Id}
  static const deleteService = "m-delete-myservice/";
  static const requestOTP = "m-request-otp";
  static const verifyOTP = "m-verify-otp";
  static const cancelPhoneNumber = "m-cancel-phone-verification";
  static const updatePassword = "m-update-password";
  static const getAllTickets = "m-getTickets";
  static const getTicket = "m-getTicket/";
  static const addTicket = "m-addTicket";
  static const replyTicket = "m-reply_ticket/";

  static const getRating = "getRating/";
  static const getReview = "getReviews/";
  static const getServiceRequest = "m-service-requests";
  static const approveServiceRequest = "m-service-requests/approve/";
  static const setMechanicCoordinate = "update-coordinates/";

  /// Payment Endpoint
  static const paymentUrl = "https://paymentapi.carmagard.com/";

  /// https://paymentapi.carmagard.com/pay/getMechanicRefPayments?limit=1
  static const getMechanicPayments = "pay/getMechanicRefPayments";

  //maps api key
  // challenge of my maps api key is that i am not authorized in
  //places search since i have not paid for it i just access map but
  // if the company will offer us api key i have implimented all functions ready
  static const String mapApiKey = "AIzaSyCHndvzn5ICZVXCgwrpBKujmYxdt9IjbYc";
}
