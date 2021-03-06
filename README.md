# msfjarvis tap

Homebrew tap for some tools that I use and can't find on Linuxbrew or don't like the structure of. I hope this repository stays sparse.

## How do I install these formulae?
`brew install msfjarvis/tap/<formula>`

Or `brew tap msfjarvis/tap` and then `brew install <formula>`.

Or install via URL (which will not receive updates):

```
brew install https://raw.githubusercontent.com/msfjarvis/homebrew-tap/master/Formula/<formula>.rb
```

## Currently available formulae

- [ccache-slim](Formula/ccache-slim.rb): Formula for [ccache](https://github.com/ccache/ccache) that does not install compiler symlinks. The upstream formula creates symlinks that force each compiler to use ccache which I find undesirable.
- [pass-clip](Formula/pass-clip.rb): Formula for my fork of [pass-clip](https://github.com/ibizaman/pass-clip). Homebrew has no formula for this.
- [pass-slim](Formula/pass-slim.rb): Formula for [pass](https://git.zx2c4.com/password-store/about) with GPG dependency removed since I install it myself and Homebrew pulls in a heavy Xorg bundle for it.
- [pfetch](Formula/pfetch.rb): Formula for [pfetch](https://github.com/dylanaraps/pfetch). Homebrew has no formula for this and because there has been no release since the Makefile was added, I cannot attempt to upstream this.
- [procs-bin](Formula/procs-bin.rb): Binary releases of [procs](https://github.com/dalance/procs) for quicker installs and no Rust dependency, since I manage my local installation with RustUp instead.
- [shellcheck-bin](Formula/shellcheck-bin.rb): Binary releases of [shellcheck](https://github.com/koalaman/shellcheck). Linuxbrew builds this from source, pulling a ton of Haskell dependencies.
- [zoxide-bin](Formula/zoxide.rb): Formula for binary releases of [zoxide](https://github.com/ajeetdsouza/zoxide), a fast cd command that learns your habits. Linuxbrew has no formula for this.
