---
title: JWT service
date: 2020-05-05T20:08
location: Home, Groningen
---

Hey I'm back with a second post today, and an exciting one. I actually made
something that I listed in the last post. I made a
[JWT service](https://github.com/mees-/jwt-service). It's really simple and
doesn't control adding users to the list, which means that everyone can add
users which is probably not the best. It's fairly easy to add some more 
authorisation though, which is what I'll do if I need to use this for an actual
project.

I've used a couple of libraries to create it and they've made it very easy to
build the app. I used [express](https://expressjs.com/) as the server framework.
For JWT I used the
[jsonwebtoken](https://github.com/auth0/node-jsonwebtoken#readme) library, which
is also very simple. To store users I used
[keyv](https://github.com/lukechilds/keyv). It's a very simple key/value store
that has usernames as keys and hashes as values. I don't need to store the JWTs
anywhere because they can be verified with just the secret. Keyv has a couple of
adaptors that make it easy to connect it to a persistent database, personally I
use postgres. Lastly I needed bcrypt to hash the stored passwords. With these
three libraries the whole service (without user creation auth) is only a single
file of 81 sloc (single lines of code). It only has four methods: <code>/token
</code>, <code>/validate</code>, <code>GET</code> on <code>/user</code> and
<code>POST</code> on <code>/user</code>. For specific information on how it
works and to try it out check
[the Github repo](https://github.com/mees-/jwt-service).

Create an issue if you think something should be better, I'll probably extend it
a little bit more with extra data on users and authorization on creating users
but for now it works.
