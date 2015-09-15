#Twitter
A version of 2007 twitter :)
Preview:

![alt text](https://github.com/jessicalins/twitter/blob/master/preview.png "Index page preview")

##Installation
```
$ git clone https://github.com/jessicalins/twitter.git

$ cd twitter/

$ bundle install
```
##Database creation
```
$ rake db:create

$ rake db:migrate

$ rake bootstrap:users

$ rake bootstrap:tweets

$ rake bootstrap:follow

$ rake bootstrap:bio

```
##Troubleshooting

If you are using mac and are having problems with **imagemagick**, try to install it via homebrew:

```
$ brew install imagemagick
```
