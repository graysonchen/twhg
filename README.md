# TWHG(Trello Webhook Github)

## Overview

When a user creates a pull request with the trello card link, automatically move the card from the "doing" to the "reviewing" list using the GitHub webhook and Trello API.

## Installation

*Requirement*

* Ruby2+
* MySQL
* Redis

## Usage

*Demo*

```
trello: https://trello.com/b/8ocOWx6F/interview-q
Repository: git@github.com:cgg5207/trello_card_test.git
host: http://twhg.growcn.com/github_webhooks
```

*Github webhook config*

![github webhook config](https://raw.github.com/cgg5207/twhg/master/doc/github-webhook-config.jpg)


*Create pull request example*

![pull-request](https://raw.github.com/cgg5207/twhg/master/doc/pull-request-relation-trello-card-link.jpg)

*Automatically move to reviewing*

![doing-move-reviewing](https://raw.github.com/cgg5207/twhg/master/doc/doing-move-reviewing.jpg)

*Pull request is accepted*

![pull-request-is-accepted](https://raw.github.com/cgg5207/twhg/master/doc/pull-request-is-accepted.jpg)

*Automatically move to released*

![move-released](https://raw.github.com/cgg5207/twhg/master/doc/move-released.png)


## Deployment

```
cap production deploy
cap production sidekiq:start
cap production db:pull

```


## Todo
* github oauth
* trello token

## Ref
* https://developers.trello.com/sandbox
* https://trello.com/app-key
* https://github.com/zanker/github-trello
* https://larry-price.com/blog/2014/03/20/using-the-trello-api-in-ruby
* http://www.sitepoint.com/customizing-trello-ruby/
* https://github.com/jeremytregunna/ruby-trello
* https://github.com/ssaunier/github_webhook


## Bug reports

[issues](https://github.com/cgg5207/twhg/issues)

[![issues](http://i.imgur.com/K8vsw.gif)](https://github.com/cgg5207/twhg/issues)
