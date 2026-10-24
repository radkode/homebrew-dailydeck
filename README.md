# DailyDeck Homebrew tap

Installs the signed, notarized Apple Silicon Runner for the DailyDeck macOS app.
Requires macOS 14 or later and an app release that supports external Runners.

```sh
brew install radkode/dailydeck/dailydeck-runner
```

DailyDeck owns process supervision, credentials, private Runner homes and safe
version switching. This formula installs the executable and its release metadata.
It has no service or Node dependency. Do not run it through `brew services`.

For an explicit Runner update:

```sh
brew update
brew upgrade radkode/dailydeck/dailydeck-runner
```

Let DailyDeck drain current work before reopening the app. The app verifies the
installed signing identity and compatibility before selecting the new Runner.

## Publishing a Runner release

Reuse the unchanged signed archive from a successful DailyDeck signing and
secret-free exercise run. Stage it in a draft release with its SHA256 sidecar and
manifest. Update the formula's immutable versioned URL and SHA256, preserving
`skip_clean "bin/dailydeck-runner"`. Verify a real Homebrew installation preserves
the binary hash, Developer ID signature and `ai.dailydeck.runner` identity under
team `83DRLQMQ5L`. Complete independent review before publishing the matching
release and formula. Never upload private native source or signing credentials.
