final class Env {
  static const backendBaseUrl = String.fromEnvironment(
    'BACKEND_BASE_URL',
    defaultValue: "http://localhost:8080",
  );
}
