abstract class ForecastFailure {
  const ForecastFailure();
}

class ServerError implements ForecastFailure {
  const ServerError();
}

class UnexpectedError implements ForecastFailure {
  const UnexpectedError();
}