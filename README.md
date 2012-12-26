# Hiera_User_Management
User management using Puppet and Hiera

## History 
This is a puppet module originally based on [puppet-ssh-hiera](https://github.com/credativ/puppet-ssh-hiera).

You should check out that module and the rest of his work; It's great stuff!

## Why change puppet-ssh-hiera?

* I wanted to learn hiera and puppet-ssh-hiera was a great example to learn from.
* puppet-ssh-hiera's calls to hiera are abstracted by example42lib. Nothing wrong with this, but wanted to learn hiera not example42lib
* I already have an ssh module that I really like, and only needed to manage users and groups
* I wanted to make functionality changes to the original code.

## How to use:

* Make sure you have puppet and hiera working
* Create hiera data similar to the example I provided
* add this to the nodes you want:  include user_management
* Thats it.  ;-)

## Support/Input/Comments?

Keep in mind that I created this module as a learning experience.  I'm not a puppet expert, merely a newb who is learning.  I'll help where possible, but I'll also listen to ideas and suggestions for improvement.

You can reach me on irc.mozilla.org as tinfoil.  I am also on #puppet on freenode as tinfoil_ .  Message away.  :-)

