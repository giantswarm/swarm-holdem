## Holdem: A Poker Playing Slack Bot 
This repository contains a service deployment for running Charlie Hess' [Slack Poker Bot](https://github.com/CharlieHess/slack-poker-bot). If you want to run the bot on something besides containers, head over there and follow the instructions.

### Prerequisites
At a minimum you will need the following to launch the software:

* A Giant Swarm [account](https://giantswarm.io/request-invite/).
* The `swarm` command line client [installed](http://docs.giantswarm.io/reference/installation/).
* A functional install of [boot2docker](https://github.com/giantswarm/boot2docker).
* The `git` command line client [installed](https://git-scm.com/downloads).

*Note: Giant Swarm's shared public cluster is currently in [private alpha](https://giantswarm.io/request-invite/). Ping [me on Twitter](https://twitter.com/kordless) if you need your application pushed through!*

### Video Walk-through
What's better than a nice pickup game of Texas Holdem? How about a video about a containerized Texas Holdem? Yeeehaww!

[![](https://raw.githubusercontent.com/giantswarm/swarm-wercker/master/static/video.png)](https://vimeo.com/134043502)

### Getting Started
This won't take long. You'll need to start by heading over to your Slack account settings and doing the following:

1. Navigate to `https://<slack_account>.slack.com/services/new/bot`.
1. Choose a username for your bot and click `add bot integration`.
1. Customize the icon and description for the bot.
1. Copy the `API token`.

#### Build and Launch Locally
Assuming you have `git` installed, you'll need to clone this repository to your computer:

```
$ git clone https://github.com/giantswarm/swarm-holdem.git
```

Change into the `swarm-holdem` directory:

```
$ cd swarm-holdem
```

Edit the `Makefile` and change the `TOKEN` value to be the token you copied from the last step above:

```
$ vi Makefile

# standard info
PROJECT = holdem
REGISTRY = registry.giantswarm.io
USERNAME := $(shell swarm user)
ORG := $(shell swarm env | cut -d/ -f1)
SLACK_TOKEN="ycxb-10021122097-Nw7snCaadfaf370UpvcS5tFkNCg"
```

*Note*: That's a fake token in there. Change it to the token you copied earlier.

#### Run & Push the Bot

Now let's run the bot locally:

```
$ make run
```

You should see some activity and shortly this will appear:

```
##############################################
Your service holdem will be running via Slack.
##############################################
```

You should be able to interact with the bot on Slack as long as you keep it running on your local machine. If you want to run it longer, push it up to Giant Swarm:

```
$ # make sure you are logged in
$ swarm info
Cluster status:      reachable
Swarm CLI version:   0.19.1
Logged in as user:   kord
Current environment: kord/alt
$ 
$ # now push it
$ make up
```

More magic happens. After a bit, Giant Swarm will report:

```
Creating 'holdem' in the 'kord/alt' environment...
Service created successfully!
Starting service holdem...
Service holdem is up.
You can see all components using this command:

    swarm status holdem

##########################################################################
Your service 'holdem' will be running via Slack.
##########################################################################
superman:swarm-holdem kord$ swarm status holdem
Service holdem is up
```

At this point you can safely play poker with your new bot. Start by saying hello to the bot by DM'ing him, and then in a channel of your choice, type:

```
@johnny: Deal
```

If you want your bot to stop the game, enter this:

```
@johnny: Quit game
```