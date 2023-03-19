Sets up a new mac

### Usage

1. `xcode-select install`
2. `git clone https://github.com/crcarrick/ansible.git`
3. `cd ansible`
4. `. bin/bootstrap`
5. `. bin/apply`

### Scripts

- `bin/bootstrap` installs git -> homebrew -> python -> ansible
- `bin/apply` runs the ansible playbook
  - arguments:
    - `--playbook` the playbook to run (defaults to `personal.yml`)
    - `--tags` run only tasks tagged with some value (eg. `--tags "ssh,install"`)
- `bin/macos` sets some macos setting defaults.
  - _ansible will run this for you_
- `bin/app_store` installs some apps that can't be installed via homebrew
  - _you will need to manually log in to the app store before running this script_
  - installs:
    - [xcode](https://developer.apple.com/xcode/)
    - [pocket](https://getpocket.com/)

### TODO

- Install apple developer certs to the keychain
