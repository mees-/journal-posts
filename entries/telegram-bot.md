---
title: Telegram bot
date: 2022-09-13T12:36
location: Campus, Groningen
---

# Telegram bot

Recently I wrote about hobby coding and how I never really writer any code for
fun anymore.  
Recently that has changed! Since April I've been working on a telegram bot for
my student society. It has fun functions like seeing how many days it will be
until your birthday or announcing the people who have birthdays on a day. It
also can track some stats, like when you throw up or take a shit, because that's
what students like to track :P.

Other than the fun features it also has useful features. For example: a member
can send a message to the bot that they want to have announced to the whole
society (there is an announcement channel). The bot then forwards that message
to the board of the society who can then approve, or deny the message. They can
also choose to schedule the message for a later time.

## Technical

The bot is built upon [Telegraf.js](https://github.com/telegraf/telegraf).
Telegraf is a telegram bot framework for Typescript and Node.js. While it
arguably has poor documentation, it has fairly clear code and ways to use it.
Overall I enjoyed using it, although I might say it's lacking in some advanced
features such as context aware handlers. For example, for using the announcement
feature that my bot has, a user needs to run the command without arguments, then
the bot will reply saying something along the lines of: "Send your announcement
now". Then the user sends another message with their announcement. The bot needs
to know when someone sends an announcement message based on the context of the
chat. Telegraf has some hints of a feature for this, but I never found out how
to use it due to a lack of documentation. I ended up using a third party
extension of the framework specifically for this feature.

Apart from Telegraf, the bot uses Postgres with
[Mikro-orm](https://mikro-orm.io/). Mikro-orm is a lovely ORM for node with good
typescript support (using [ts-morph](https://github.com/dsherret/ts-morph)). I
really like the ORM because it does all the simple things an ORM needs to do and
provides a nice escape hatch for when you need to use more advanced SQL. They
even provide ways to automatically cast the results back to a known entity type
at the end of the "advanced SQL". Furthermore their documentation is very good
if you are just using the basics, though I think the documentation for more
advanced features could be better.

## Bot structure

The bot is structured in a way where all the commands it has are basically
plugins. They are all defined in separate functions and take the bot object as
an argument. With that bot object they can do basically anything, like
registering commands and listening for events.  
The bot also has a task system, that I'm currently overhauling. The task system
was initially written for the scheduled announcement feature, but with the
overhaul I also want to add periodic tasks like the birthday announcement. I
want to make task more generic, so they can be used in many more situations. For
this I'm also using Mikro-orm's inheritance with table-per-hierarchy feature.  
I first came across this concept at my work, working with EFCore. I really liked
it because it works really well with OOP.

Overall I think people are generally happy with the bot and I want to keep
working on it in my spare time, adding new features. After I complete the task
overhaul I think I want to add a feature where people can sign up for the weekly
dinner through the bot :).

Cya

Mees
