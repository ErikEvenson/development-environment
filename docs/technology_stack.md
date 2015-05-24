# Technology stack

These are the technologies used in this project.

## Foundational

- [bash](http://www.gnu.org/software/bash/manual/bashref.html) 4.3.11(1)-release (x86_64-pc-linux-gnu) - shell.

## apt-get-installed

- [git](http://packages.ubuntu.com/trusty/git) 1.9.1 [Changelog](https://github.com/git/git/tree/master/Documentation/RelNotes) - fast, scalable, distributed revision control system.
- [mercurial](http://packages.ubuntu.com/trusty/mercurial) 3.1 - easy-to-use, scalable distributed version control system.
- [vim](http://www.vim.org/) 2:7.4.052-1ubuntu3 - Vim is an advanced text editor that seeks to provide the power of the de-facto Unix editor 'Vi', with a more complete feature set. It's useful whether you're already using vi or using a different editor.

## bash-installed

- [mongoDB](http://www.mongodb.org/) 3.0.2 - The only database that harnesses the innovations of NoSQL (flexibility, scalability, performance) and builds on the foundation of relational databases (expressive query language, secondary indexes, strong consistency).
- [node](https://nodejs.org/) 0.12.2 - A platform built on Chrome's JavaScript runtime for easily building fast, scalable network applications.
- [nvm](https://github.com/creationix/nvm) - Simple bash script to manage multiple active node.js versions.
- [puppet](http://puppetlabs.com/) 3.7.5 - Open source Puppet is a flexible, customizable framework available under the Apache 2.0 license designed to help system administrators automate the many repetitive tasks they regularly perform.

## gem-installed

- [puppet-lint](http://puppet-lint.com/) 1.1.0 - Check that your Puppet manifest conform to the style guide.

## npm-installed (global)

- [bcrpyt]() 0.8.3
- [bower](http://bower.io/) 1.4.1 - 'A package manager for the web.'
- [gulp](http://gulpjs.com/) 3.8.11 - 'The streaming build system.'
- [jwt-simple]()
- [karma-cli](https://github.com/karma-runner/karma-cli) 0.0.4 - 'The Karma command line interface.'
- [npm](https://npmjs.org/doc/) 2.9.0 - "node package manager"
- [mocha](https://github.com/mochajs/mocha) 2.2.4 - 'mocha - simple, flexible, fun javascript test framework for node.js & the browser.'
- [nodemon]() 1.3.7
* [npm-check-updates](https://www.npmjs.org/package/npm-check-updates) 1.5.1 [Fork](https://github.com/EATechnologies/npm-check-updates) - Find newer versions of dependencies than what your package.json allows.
- [phantomjs]() 1.9.16
- [slush](http://slushjs.github.io/#/) 1.1.1 'The streaming scaffolding system - Gulp as a replacement for Yeoman.'
- [slush-generator](https://github.com/chrisenytc/slush-generator) 0.2.6 - 'A slush generator for create slush generators.'

## Installed on host

These tools are installed directly on the host.  On a Mac, they are can be installed easily using [homebrew](http://brew.sh/) and [homebrew cask](http://caskroom.io/).

***Check for updates manually.***

- [Vagrant](https://www.vagrantup.com/) 1.7.2 [Change log](https://github.com/mitchellh/vagrant/blob/master/CHANGELOG.md) [Fork](https://github.com/EATechnologies/vagrant) - used to manage development environment configuration.
- [vagrant-cachier](https://github.com/fgrehm/vagrant-cachier/) 1.2.0 - A Vagrant plugin that helps you reduce the amount of coffee you drink while waiting for boxes to be provisioned by sharing a common package cache among similiar VM instances.
- [vagrant-librarian-puppet](https://github.com/mhahn/vagrant-librarian-puppet) 0.9.0 - A Vagrant plugin to install Puppet modules using Librarian-Puppet.
- [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest) 0.10.0 [Changelog[(https://github.com/dotless-de/vagrant-vbguest/blob/master/CHANGELOG.md) [Fork](https://github.com/EATechnologies/vagrant-vbguest) - automatically keeps VirtualBox Guest Additions up to date.  ***Updates are manual.***
- [VirtualBox](https://www.virtualbox.org/) 4.3.26 [Changelog](https://www.virtualbox.org/wiki/Changelog) 4.3.26-98988 - used to host development environment.

## Puppet modules

- [puppetlabs-apt](https://forge.puppetlabs.com/puppetlabs/apt) 1.8.0 - The APT module provides a simple interface for managing APT source, key, and definitions with Puppet.
- [puppetlabs-stdlib](https://forge.puppetlabs.com/puppetlabs/stdlib) 4.6.0 - This module provides a "standard library" of resources for developing Puppet Modules.
mod 'willdurand/nodejs', '1.8.5'
mod 'garethr/heroku', '0.0.1'

## Vagrant/vagrant-installed

- [ubuntu/trusty64](https://vagrantcloud.com/ubuntu/trusty64) 14.04 - A standard [Ubuntu 14.04 LTS (Trusty Tahr)](http://releases.ubuntu.com/14.04/) 64-bit box.  ***Vagrant checks for updates to this box automatically.***