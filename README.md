# homebrew-tap

Homebrew tap for the [KloudSec](https://kloudsec.io) CLI.

## Install

```
brew install kloudsec-io/tap/kloudsec
```

This adds the tap and installs `kloudsec` in one step. If you've already tapped it separately:

```
brew tap kloudsec-io/tap
brew install kloudsec
```

## What you get

`kloudsec` is the command line client for KloudSec, a cloud security platform covering CSPM, SAST, infrastructure-as-code scanning, secrets scanning, and compliance automation. From the terminal you can kick off scans, pull findings, manage exceptions, and check compliance status against your cloud environment without switching to a browser.

The formula installs a precompiled binary. There's no Python or other runtime to set up first.

## Supported platforms

- macOS on Apple Silicon
- macOS on Intel
- Linux x86_64

Windows users should grab the installer from [downloads.kloudsec.io](https://downloads.kloudsec.io) instead.

## Upgrading

```
brew upgrade kloudsec
```

## Uninstalling

```
brew uninstall kloudsec
brew untap kloudsec-io/tap
```

## Authentication

After installing, run `kloudsec login` to authenticate against your organization. See the [CLI documentation](https://app.kloudsec.io/documentation/detail/?id=kloudsec-cli-complete-howto) for the full command reference.

## Issues

This repository only holds the Homebrew formula. If `brew install` or `brew upgrade` fails, open an issue here with the output of `brew install --verbose kloudsec`. For anything related to the CLI itself, scans, or your account, contact hello@kloudsec.io.
