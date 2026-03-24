import gleam/option.{type Option, None, Some}
import gleam/order.{type Order}

/// Returns the value contained within the Ok of the result
/// Crashes if the result is Error
pub fn is_ok(result result: Result(a, b), error_message msg: String) -> a {
  let assert Ok(value) = result as msg
  value
}

/// Returns the error contained within the Error of the result
/// Crashes if the result is Ok
pub fn is_error(result result: Result(a, b), error_message msg: String) -> b {
  let assert Error(value) = result as msg
  value
}

/// Returns the value contained within the Some of the option
/// Crashes if the option is None
pub fn is_some(option option: Option(a), error_message msg: String) -> a {
  let assert Some(value) = option as msg
  value
}

/// Returns Nil
/// Crashes if the option is Some
pub fn is_none(option option: Option(a), error_message msg: String) -> Nil {
  assert option == None as msg
  Nil
}

/// Returns the value of the arguments if they're equal
/// Crashes if the two arguments are not equal
pub fn are_equal(
  first first: a,
  second second: a,
  error_message msg: String,
) -> a {
  assert first == second as msg
  first
}

/// Returns the first argument if the two arguments are not equal
/// Crash if the two arguments are equal
pub fn are_different(
  first first: a,
  second second: a,
  error_message msg: String,
) -> a {
  assert first != second as msg
  first
}

/// Returns the first argument if it's greater than the second given the comparison function
/// Crashes if the two arguments are equal
pub fn compare_greater(
  first first: a,
  second second: a,
  compare compare: fn(a, a) -> Order,
  error_message msg: String,
) -> a {
  assert compare(first, second) == order.Gt as msg
  first
}

/// Returns the first argument if it's lesser than the second given the comparison function
/// Crashes if the two arguments are equal
pub fn compare_lesser(
  first first: a,
  second second: a,
  compare compare: fn(a, a) -> Order,
  error_message msg: String,
) -> a {
  assert compare(first, second) == order.Lt as msg
  first
}

/// Returns the first argument if it compares equal to the second given the comparison function
/// Crashes if the two arguments are equal
pub fn compare_equal(
  first first: a,
  second second: a,
  compare compare: fn(a, a) -> Order,
  error_message msg: String,
) -> a {
  assert compare(first, second) == order.Eq as msg
  first
}
