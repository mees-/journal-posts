---
title: stateofthe.cards technical choices
date: 2020-05-10T17:22
location: Groningen
---

This entry outlines the technical decisions that have been made for building the
card game website that my and my project group came up with. We will make a
modular card game with a card game editor where users can make up their own rules
for games.

My project group consists of [Thomas](https://github.com/ThowV),
[Lutzen](https://github.com/LutzenH), [Mike](https://github.com/Prusias) and
[me](https://github.com/mees-).

### Frontend framework - [React](https://reactjs.org)
For the frontend framework we decided to go with react. This is because react is
only the view layer and it leaves us free to choose whatever libraries we want
to use for the state and data-fetching, the controller and model.  
Furthermore, react is very popular and has a lot of community support. There are
tons of available resources to help learn react and React, like angular, has a
big company supporting it together with the open source community.

### API server - [Node.js](https://nodejs.org)
Node.js is chrome's V8 javascript engine transplanted into a server scenario.
They bascially removed the DOM and added IO api's in order to facilitate server
development. Node has [a huge library of packages](https://www.npmjs.com) which
can greatly simplify development. Express is the server framework we will use.
Express, while not the newest and coolest framework on the block, is very robust
and well tested. It is one of the most popular npm packages and it's probably
the most popular web framework for Node.

### File server - [NGINX](https://www.nginx.com/)
Since we are building a PWA (progressive web app), we only need to serve a
static bundle as our app, the app will then fetch all the data it needs from the
api by itself. NGINX is a very stable, battle-tested web server. It supports
advanced configuration but also isn't hard to work with. NGINX can also serve as
a reverse-proxy for our api, which allows us to route requests to the same
domain to multiple different servers
