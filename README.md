# homebrew-macmuster

Personal Homebrew tap for [MacMuster](https://github.com/gurupsv/MacMuster) —
a native macOS app launcher. This tap is the staging area for the cask before it
is submitted to [`Homebrew/homebrew-cask`](https://github.com/Homebrew/homebrew-cask).

## Install

```bash
brew tap gurupsv/homebrew-macmuster
brew install --cask macmuster
```

## First release (one-time)

The cask ships with a **placeholder `sha256`** (all zeros). Before the first
install will succeed, replace it with the real digest of the published `.pkg`:

```bash
# after the first GitHub Release is published (see MacMuster's release.md)
curl -L -o /tmp/MacMuster.pkg \
  "https://github.com/gurupsv/MacMuster/releases/download/1.0.2/MacMuster-1.0.2.pkg"
shasum -a 256 /tmp/MacMuster.pkg
# paste the digest into Casks/m/macmuster.rb, then:
git add Casks/m/macmuster.rb
git commit -m "macmuster: set real sha256 for 1.0.2"
git push
```

## Bumping a version

For each new MacMuster release (e.g. `1.0.3`):

1. In `Casks/m/macmuster.rb`, update `version` to `1.0.3`.
2. Compute the new digest of `MacMuster-1.0.3.pkg` (same `shasum` command above)
   and set `sha256`.
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
