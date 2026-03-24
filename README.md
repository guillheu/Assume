# Assume

Don't tell Louis or Hayleigh, they'd get upset.

This functionally is similar to [`gleeunit/should`](https://hexdocs.pm/gleeunit/1.9.0/gleeunit/should.html) except you *can* use it.

## Motivation

I like to use assertions in production. Gleam's strong type system means I rarely need it, but occasionally I will. In those cases, I'm not a fan of the `let assert Ok(something) = result as "Something went wrong!"` API. It's not pipe-able, and adding long, composite error messages is a drag.

## Satnity check

**Why on Earth would you use assertions in production?!?!?!?!?!**

Sometimes, your app is in an undefined state. Maybe a certain DB is reachable, but a field is missing from the table. Maybe your reverse proxy sent you a request with some headers missing you were expecting. Maybe the config file is missing some critical options. All those cases have 3 things in common:
- they're external, not part of the Gleam project directly
- they're not userspace, they're not just weird things the user sent us, but actively configured as being part of the overall application
- they should not fail, ever, under any circumstance.

These examples all lead to an undefined state for your app. From there, you have 2 ways of handling it:
- Try to gracefully correct the issue
- Crash and scream at the admin that something is wrong

Personally, I prefer the second option, depending on the case. For example, if a table is missing from the DB, maybe we want to automatically create and populate it. Or, on the inverse, maybe you *assume* that table should have been created prior by hand.
Maybe that DB is missing a field. You could either add that field and populate each row with a default value, or you *assume* that the DB table should be correctly formatted.

Usually I find those things useful on startup. Contradictory options, missing connections to parts of the infra, etc.

This is why assertions in production code are occasionally useful, and why *Assume* isn't completely insane to use.

*Sometimes you really do want to scream that something went wrong and ask for help.*