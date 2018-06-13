## Creating a Formula

See Homebrew's [Formula Cookbook](https://github.com/Homebrew/brew/blob/master/docs/Formula-Cookbook.md).


## Updating a Formula

Suppose we want to update the Inertia formula to its newest release. First,
modify the formula to point to the latest release:

```diff
$ vim inertia.rb
$ git diff -U0 inertia.rb
diff --git a/inertia.rb b/inertia.rb
index a8a4e37..a8518a3 100644
--- a/inertia.rb
+++ b/inertia.rb
@@ -4 +4 @@ class Inertia < Formula
-  version "0.1.0"
+  version "0.1.1"
```

Next, try `brew install`-ing the formula file directly:

```sh
# Uninstall the existing formula, if installed:
$ brew uninstall inertia

# Install from the modified formula file directly:
$ brew install inertia.rb
# ...
Error: SHA256 mismatch
Expected: f0638be76da7b2a63342bed5e1cad1e6f897d35b15152247a8bf6ab1fb92637e
Actual: a687116c7fe155ed2150f86843f933c506eeb5335547e79e4786dec2ae16fc6b
Archive: /Users/FooBar/Library/Caches/Homebrew/inertia-0.1.1.386
To retry an incomplete download, remove the file above.
```

Since the download target has changed, we need to make the corresponding
change to the formula's `sha256`:

```diff
$ vim inertia.rb
$ git diff inertia.rb
diff --git a/inertia.rb b/inertia.rb
index a8a4e37..7026aeb 100644
--- a/inertia.rb
+++ b/inertia.rb
@@ -4 +4 @@ class Inertia < Formula
-  version "0.1.0"
+  version "0.1.1"
@@ -6 +6 @@ class Inertia < Formula
-  sha256 "f0638be76da7b2a63342bed5e1cad1e6f897d35b15152247a8bf6ab1fb92637e"
+  sha256 "a687116c7fe155ed2150f86843f933c506eeb5335547e79e4786dec2ae16fc6b"
```

If all went well, `brew install` should succeed now:

```sh
$ rm /Users/FooBar/Library/Caches/Homebrew/inertia-0.1.1.386
$ brew install inertia.rb
# ...
🍺 /usr/local/Cellar/inertia/0.1.1: 3 files, 15.4MB, built in 1 second
```

Audit the formula for errors using `brew audit formula.rb` for good measure,
and submit that PR! :rocket:

## Adding Unstable/Prerelease Versions to your Formula

See [Homebrew's unstable formula version feature](https://github.com/Homebrew/brew/blob/master/docs/Formula-Cookbook.md#unstable-versions-devel-head).

In short, just add a `devel` spec to your application formula:

```ruby
class Inertia < Formula
  # ...stuff

  devel do
    version "0.4.0-rc2"
    url "https://github.com/ubclaunchpad/inertia/releases/download/v#{version}/inertia.v#{version}.darwin.386"
    sha256 "0a20a1606699790e718a9a3de07b641972433aa302233a1194e3dc6ee9b55a63"
  end

  # ...stuff
end
```

This version of your application can now be installed using the `--devel` flag:

```bash
# from file
$ brew install inertia.rb --devel
# from tap
$ brew install inertia --devel
```
