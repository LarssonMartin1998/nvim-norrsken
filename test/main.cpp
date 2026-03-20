#include <algorithm>
#include <concepts>
#include <coroutine>
#include <exception>
#include <format>
#include <iostream>
#include <memory>
#include <optional>
#include <ranges>
#include <stdexcept>
#include <string>
#include <unordered_map>
#include <variant>
#include <vector>

#define ASSERT(cond)                                                           \
  do {                                                                         \
    if (!(cond)) {                                                             \
      std::cerr << "assertion failed: " #cond "\n";                            \
    }                                                                          \
  } while (0)

#define MAX(a, b) ((a) > (b) ? (a) : (b))

enum class Color : uint8_t { Red, Green, Blue };

enum Direction { North, South, East, West };

template <typename T>
concept Numeric = std::integral<T> || std::floating_point<T>;

template <typename T>
concept Printable = requires(T t) {
  { std::cout << t } -> std::same_as<std::ostream &>;
};

struct Point {
  float x;
  float y;

  Point operator+(const Point &other) const {
    return {x + other.x, y + other.y};
  }

  bool operator==(const Point &other) const = default;
};

class Shape {
public:
  explicit Shape(std::string name) : m_name(std::move(name)) {}
  virtual ~Shape() = default;

  virtual float area() const = 0;

  const std::string &name() const { return m_name; }

protected:
  std::string m_name;
};

class Circle : public Shape {
public:
  explicit Circle(float radius) : Shape("circle"), m_radius(radius) {}

  float area() const override { return 3.14159f * m_radius * m_radius; }

private:
  float m_radius;
};

class Rectangle : public Shape {
public:
  Rectangle(float width, float height)
      : Shape("rectangle"), m_width(width), m_height(height) {}

  float area() const override { return m_width * m_height; }

private:
  float m_width;
  float m_height;
};

template <Numeric T> T clamp(T value, T lo, T hi) {
  if (value < lo)
    return lo;
  if (value > hi)
    return hi;
  return value;
}

template <typename... Ts> void print_all(Ts &&...args) {
  ((std::cout << args << ' '), ...);
  std::cout << '\n';
}

template <typename T> class ScopedResource {
public:
  explicit ScopedResource(T value) : m_value(std::move(value)) {}
  ~ScopedResource() { cleanup(); }

  ScopedResource(const ScopedResource &) = delete;
  ScopedResource &operator=(const ScopedResource &) = delete;

  ScopedResource(ScopedResource &&) noexcept = default;
  ScopedResource &operator=(ScopedResource &&) noexcept = default;

  T &get() { return m_value; }
  const T &get() const { return m_value; }

private:
  void cleanup() {}

  T m_value;
};

struct Generator {
  struct promise_type {
    int current_value{};

    Generator get_return_object() {
      return Generator{
          std::coroutine_handle<promise_type>::from_promise(*this)};
    }
    std::suspend_always initial_suspend() { return {}; }
    std::suspend_always final_suspend() noexcept { return {}; }
    std::suspend_always yield_value(int value) {
      current_value = value;
      return {};
    }
    void return_void() {}
    void unhandled_exception() { std::terminate(); }
  };

  std::coroutine_handle<promise_type> handle;

  explicit Generator(std::coroutine_handle<promise_type> h) : handle(h) {}
  ~Generator() {
    if (handle)
      handle.destroy();
  }

  bool next() {
    handle.resume();
    return !handle.done();
  }

  int value() const { return handle.promise().current_value; }
};

Generator fibonacci() {
  int a = 0, b = 1;
  while (true) {
    co_yield a;
    auto next = a + b;
    a = b;
    b = next;
  }
}

auto make_adder(int n) {
  return [n](int x) { return x + n; };
}

template <typename F> auto memoize(F fn) {
  std::unordered_map<int, int> cache;
  return [fn, cache](int x) mutable -> int {
    if (auto it = cache.find(x); it != cache.end()) {
      return it->second;
    }
    auto result = fn(x);
    cache[x] = result;
    return result;
  };
}

using Value = std::variant<int, float, std::string, bool>;

struct Visitor {
  void operator()(int v) const { std::cout << "int: " << v << '\n'; }
  void operator()(float v) const { std::cout << "float: " << v << '\n'; }
  void operator()(const std::string &v) const {
    std::cout << "string: " << v << '\n';
  }
  void operator()(bool v) const { std::cout << "bool: " << v << '\n'; }
};

class DomainError : public std::runtime_error {
public:
  explicit DomainError(const std::string &msg) : std::runtime_error(msg) {}
};

int safe_divide(int a, int b) {
  if (b == 0)
    throw DomainError("division by zero");
  return a / b;
}

void control_flow_demo(int n) {
  if (n < 0) {
    std::cout << "negative\n";
  } else if (n == 0) {
    std::cout << "zero\n";
  } else {
    std::cout << "positive\n";
  }

  switch (static_cast<Color>(n % 3)) {
  case Color::Red:
    std::cout << "red\n";
    break;
  case Color::Green:
    std::cout << "green\n";
    break;
  case Color::Blue:
    std::cout << "blue\n";
    break;
  default:
    std::cout << "unknown\n";
    break;
  }

  for (int i = 0; i < n; ++i) {
    if (i % 2 == 0)
      continue;
    std::cout << i << ' ';
  }

  int i = n;
  while (i > 0) {
    --i;
  }

  do {
    ++i;
  } while (i < 3);

  std::vector<int> v = {1, 2, 3, 4, 5};
  for (const auto &x : v) {
    std::cout << x << ' ';
  }

  try {
    auto result = safe_divide(10, n);
    std::cout << "result: " << result << '\n';
  } catch (const DomainError &e) {
    std::cerr << "error: " << e.what() << '\n';
  } catch (...) {
    std::cerr << "unknown error\n";
  }

  auto label = (n % 2 == 0) ? "even" : "odd";
  std::cout << label << '\n';
}

void ranges_demo() {
  auto nums = std::views::iota(1, 20) |
              std::views::filter([](int n) { return n % 2 == 0; }) |
              std::views::transform([](int n) { return n * n; }) |
              std::views::take(5);

  for (auto n : nums) {
    std::cout << n << ' ';
  }
  std::cout << '\n';
}

std::optional<std::pair<int, int>> find_pair(const std::vector<int> &v,
                                             int target) {
  for (std::size_t i = 0; i < v.size(); ++i) {
    for (std::size_t j = i + 1; j < v.size(); ++j) {
      if (v[i] + v[j] == target) {
        return std::make_pair(static_cast<int>(i), static_cast<int>(j));
      }
    }
  }
  return std::nullopt;
}

int main() {
  std::vector<std::unique_ptr<Shape>> shapes;
  shapes.push_back(std::make_unique<Circle>(5.0f));
  shapes.push_back(std::make_unique<Rectangle>(3.0f, 4.0f));

  for (const auto &shape : shapes) {
    std::cout << std::format("{}: area = {:.2f}\n", shape->name(),
                             shape->area());
  }

  print_all(1, 2.5f, "hello", true);
  std::cout << clamp(15, 0, 10) << '\n';

  auto add5 = make_adder(5);
  std::cout << add5(3) << '\n';

  std::vector<Value> values = {42, 3.14f, std::string("world"), false};
  for (const auto &val : values) {
    std::visit(Visitor{}, val);
  }

  std::vector<int> nums = {1, 3, 5, 7, 2};
  if (auto result = find_pair(nums, 8)) {
    auto [i, j] = *result;
    std::cout << std::format("found pair at indices {} and {}\n", i, j);
  }

  auto fib = fibonacci();
  for (int k = 0; k < 10 && fib.next(); ++k) {
    std::cout << fib.value() << ' ';
  }
  std::cout << '\n';

  control_flow_demo(4);
  ranges_demo();

  ASSERT(1 + 1 == 2);
  std::cout << MAX(3, 7) << '\n';

  return 0;
}
