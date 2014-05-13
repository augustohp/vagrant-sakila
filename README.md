# MySQL Sakila database (Vagrant)

The [Sakila database][1] is a sample database for MySQL >= 5.0
that provides a standard schema which can be used in books,
tutorials, samples and dreams.

This repository provides a [Vagrant][2] enabled [Ubuntu 12.04][3]
Virtual Machine with the [Sakila database][1] installed.

## Installation

Considering you already have [Vagrant][2] installed and cloned this
repository somewhere in your machine, execute in your favourite shell:

    $ cd <directory of this repository in your machine>
    $ vagrant up

## Accessing the database

Considering you alredy followed the installation instructions,
you can access the native [MySQL client][4] of the Virtual Machine
doing:

    $ cd <directory of this repository in your machine>
    $ vagrant ssh
    $ mysql --user=root sakila

[1]: http://dev.mysql.com/doc/sakila/en/index.html "MySQL Documentation: Sakila Sample Database"
[2]: http://vagrantup.com "Vagrant Website"
[3]: http://releases.ubuntu.com/12.04/ "Ubuntu Releases: 12.04"
[4]: http://dev.mysql.com/doc/refman/5.6/en/mysql.html "MySQL Documentation: mysql client"
