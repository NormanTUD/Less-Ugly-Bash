# Less-Ugly-Bash
A set of commands that make the bash a little less ugly.

# What do I mean by that?

If should look like this:

```command
if(variable == 5) {
	...
}
```

and NOT like this:

```command
if [[ "$VARIABLE" -eq 5 ]]; then
	...
fi
```

But sometimes it's hard to avoid the shell.

So this, when sourced, creates functions like 

```command
eq "hi" "bye"
```

This returns the `exit` status `0` (`TRUE`) if those are equal, so if's get a little less ugly.


```command
if eq "hi" "bye"; then
	...
fi
```

I've also written automated tests. And the creation of tests is also automated. So you can write

```command
create_and_test_eqlike_function "eq" "=="
```

creates that function (in the current scope, of course) and then tests it automatically. (Currently, the number based variable tests do not work properly in the test, but I'm way to lazy to change this now).
