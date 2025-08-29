import 'package:dio/dio.dart' as dio;

class NetworkException implements Exception {
  final String message;

  NetworkException({required this.message});

  static NetworkException handleResponse(dio.Response response) {
    switch (response.statusCode) {
      case 203:
        throw NonAuthoritativeInformationException();

      case 204:
        throw NoContentException();

      case 304:
        throw NotModifiedException();

      /// to call refresh_token
      case 401:
        throw UnauthorizedException();

      case 402:
        throw PaymentRequiredException();

      case 403:
        throw ForbiddenException();

      case 404:
        throw NotFoundException();

      case 405:
        throw MethodNotAllowedException();

      case 406:
        throw NotAcceptableException();

      case 407:
        throw ProxyAuthRequiredException();

      case 408:
        throw RequestTimeoutException();

      case 409:
        throw ConflictException();

      case 411:
        throw LengthRequiredException();

      case 412:
        throw PreConditionFailedException();

      case 413:
        throw RequestEntityTooLargeException();

      case 414:
        throw RequestUriTooLongException();

      case 415:
        throw UnsupportedMediaTypeException();

      case 416:
        throw RequestedRangeNotSatisfiableException();

      case 417:
        throw ExpectationFailedException();

      case 422:
        throw UnProcessableEntityException();

      case 424:
        throw FailedDependencyException();

      case 425:
        throw UnorderedCollectionException();

      case 426:
        throw UpgradeRequiredException();

      case 429:
        throw TooManyRequestException();

      case 431:
        throw RequestHeaderFieldsTooLargeException();

      case 444:
        throw NoResponseException();

      case 451:
        throw UnavailableForLegalReasonsException();

      case 494:
        throw RequestHeaderTooLargeException();

      case 500:
        throw InternalServerErrorException();

      case 501:
        throw NotImplementedException();

      case 502:
        throw BadGatewayException();

      case 503:
        throw ServiceUnavailableException();

      case 504:
        throw GatewayTimeoutException();

      case 507:
        throw InsufficientStorageException();

      case 508:
        throw LoopDetectedException();

      case 509:
        throw BandwidthLimitException();

      case 510:
        throw NotExtendedException();

      case 511:
        throw NetworkAuthRequiredException();

      default:
        throw UnknownException();
    }
  }

  static ParsingDataException parsingDataException() => ParsingDataException();
}

class ParsingDataException extends NetworkException {
  ParsingDataException() : super(message: "Parsing data error");
}

class NonAuthoritativeInformationException extends NetworkException {
  NonAuthoritativeInformationException() : super(message: 'Non-authoritative information error');
}

class NoContentException extends NetworkException {
  NoContentException() : super(message: 'No content error');
}

class NotModifiedException extends NetworkException {
  NotModifiedException() : super(message: 'Not modified error');
}

class BadRequestException extends NetworkException {
  BadRequestException() : super(message: 'Bad request error');
}

class UnauthorizedException extends NetworkException {
  UnauthorizedException() : super(message: 'Unauthorized error');
}

class PaymentRequiredException extends NetworkException {
  PaymentRequiredException() : super(message: 'Payment required error');
}

class ForbiddenException extends NetworkException {
  ForbiddenException() : super(message: 'Forbidden error');
}

class NotFoundException extends NetworkException {
  NotFoundException() : super(message: 'Not found error');
}

class MethodNotAllowedException extends NetworkException {
  MethodNotAllowedException() : super(message: 'Method not allowed error');
}

class NotAcceptableException extends NetworkException {
  NotAcceptableException() : super(message: 'Not acceptable error');
}

class ProxyAuthRequiredException extends NetworkException {
  ProxyAuthRequiredException() : super(message: 'Proxy authentication required error');
}

class RequestTimeoutException extends NetworkException {
  RequestTimeoutException() : super(message: 'Request timeout error');
}

class ConflictException extends NetworkException {
  ConflictException() : super(message: 'Conflict error');
}

class LengthRequiredException extends NetworkException {
  LengthRequiredException() : super(message: 'Length required error');
}

class PreConditionFailedException extends NetworkException {
  PreConditionFailedException() : super(message: 'Precondition failed error');
}

class RequestEntityTooLargeException extends NetworkException {
  RequestEntityTooLargeException() : super(message: 'Request entity too large error');
}

class RequestUriTooLongException extends NetworkException {
  RequestUriTooLongException() : super(message: 'Request URI too long error');
}

class UnsupportedMediaTypeException extends NetworkException {
  UnsupportedMediaTypeException() : super(message: 'Unsupported media type error');
}

class RequestedRangeNotSatisfiableException extends NetworkException {
  RequestedRangeNotSatisfiableException() : super(message: 'Requested range not satisfiable error');
}

class ExpectationFailedException extends NetworkException {
  ExpectationFailedException() : super(message: 'Expectation failed error');
}

class UnProcessableEntityException extends NetworkException {
  UnProcessableEntityException() : super(message: 'Unprocessable entity error');
}

class FailedDependencyException extends NetworkException {
  FailedDependencyException() : super(message: 'Failed dependency error');
}

class UnorderedCollectionException extends NetworkException {
  UnorderedCollectionException() : super(message: 'Unordered collection error');
}

class UpgradeRequiredException extends NetworkException {
  UpgradeRequiredException() : super(message: 'Upgrade required error');
}

class TooManyRequestException extends NetworkException {
  TooManyRequestException() : super(message: 'Too many requests error');
}

class RequestHeaderFieldsTooLargeException extends NetworkException {
  RequestHeaderFieldsTooLargeException() : super(message: 'Request header fields too large error');
}

class NoResponseException extends NetworkException {
  NoResponseException() : super(message: 'No response error');
}

class UnavailableForLegalReasonsException extends NetworkException {
  UnavailableForLegalReasonsException() : super(message: 'Unavailable for legal reasons error');
}

class RequestHeaderTooLargeException extends NetworkException {
  RequestHeaderTooLargeException() : super(message: 'Request header too large error');
}

class InternalServerErrorException extends NetworkException {
  InternalServerErrorException() : super(message: 'Internal server error');
}

class NotImplementedException extends NetworkException {
  NotImplementedException() : super(message: 'Not implemented error');
}

class BadGatewayException extends NetworkException {
  BadGatewayException() : super(message: 'Bad gateway error');
}

class ServiceUnavailableException extends NetworkException {
  ServiceUnavailableException() : super(message: 'Service unavailable error');
}

class GatewayTimeoutException extends NetworkException {
  GatewayTimeoutException() : super(message: 'Gateway timeout error');
}

class InsufficientStorageException extends NetworkException {
  InsufficientStorageException() : super(message: 'Insufficient storage error');
}

class LoopDetectedException extends NetworkException {
  LoopDetectedException() : super(message: 'Loop detected error');
}

class BandwidthLimitException extends NetworkException {
  BandwidthLimitException() : super(message: 'Bandwidth limit error');
}

class NotExtendedException extends NetworkException {
  NotExtendedException() : super(message: 'Not extended error');
}

class NetworkAuthRequiredException extends NetworkException {
  NetworkAuthRequiredException() : super(message: 'Network authentication required error');
}

class UnknownException extends NetworkException {
  UnknownException() : super(message: 'Unknown error');
}
