# homebrew-macmuster

Personal Homebrew tap for [MacMuster](https://github.com/gurupsv/MacMuster) —
a native macOS app launcher. This tap is the staging area for the cask before it
is submitted to [`Homebrew/homebrew-cask`](https://github.com/Homebrew/homebrew-cask).

## Install

```bash
brew tap gurupsv/homebrew-macmuster
brew install --cask macmuster
```

## Releasing a new version

For each new MacMuster release (e.g. `1.0.11`), after the GitHub Release is
published (see MacMuster's `release.md`):

1. Compute the digest of the published `.pkg`:
   ```bash
   curl -L -o /tmp/MacMuster.pkg \
     "https://github.com/gurupsv/MacMuster/releases/download/1.0.11/MacMuster-1.0.11.pkg"
   shasum -a 256 /tmp/MacMuster.pkg
   ```
2. In `Casks/m/macmuster.rb`, set `version` to `1.0.11` and `sha256` to the
   digest from step 1.
3. Commit and push.

`livecheck` uses `:github_latest`, so `brew livecheck macmuster` and
`brew bump-cask-pr` will detect the next release automatically.

## Uninstall

```bash
brew uninstall --cask macmuster     # removes /Applications/MacMuster.app
brew uninstall --cask --zap macmuster   # also removes prefs + icon cache
```

## Cask layout

Casks live under `Casks/<first letter>/<name>.rb` to match the `homebrew-cask`
tap structure, so a later PR to the official tap is a straight file move.
