---
title: Next.JS and Firebase
date: 2023-07-15T18:00+02
location: Valencia, Home
---

## Context

I’m currently doing my final half year of my bachelor program and the way I
graduate is by doing an internship for a company as a software engineer. I
really wanted to go abroad and I ended up going here, to Valencia in Spain. The
company I’m doing my internship at is a dutch company that helps students find
internships. Students contact the company and the company helps them find an
internship and accommodation here in Valencia. The company is a one-man company
so all this is done by him, and he does all of this almost exclusively by
calling and messaging with clients and host companies.

My project there is building a web application that can help the company
automate a lot of standard tasks like collecting personal information, plan
meetings and collect payment. I’m building this web app on my own, and I’m free
to make almost all the decisions on what stack I want to use.

# Tech

Before I started my project, I had come across two pieces of tech that had me
interested: [Next.JS](https://nextjs.org/) and Firebase. These seemed nice tools
to be able to easily and quickly build modern, performant web applications. When
I found each of them, I tried them and liked the way they worked. Both Next.JS
and firebase make something that used to be very complicated a lot easier by
handeling a lot of hidden complexity.

## Next.JS

I first head of next.js years ago, and at first I thought it was just a simple
static site generator, like for example Gatsby. Later I figured out that it was
more than that but until a year ago I had never really looked into it. Later,
after I had built one or two basic web apps with it to try it out, I started
seeing why something like this exists. I think it’s a Node.js/react counter to
.Net Core. Although I previously wasn’t a big fan of frameworks like .Net Core,
because of all the hidden complexity. You don’t really understand in what
context your code runs and how the framework itself does what it does. However,
Next.JS uses node, and isn’t made by microsoft, so I gave it another chance.

When I started using Next.JS for my internship project, Next.JS 13 had just come
out with the App router and server components. Server components are a pretty
cool feature that leverages the existing react ecosystem to turn JSX into
essentially an advanced templating language, with a very big library of existing
building blocks. So, as Next.JS 13 had come out, I wanted to try it in this new
project.

## Firebase

Firebase is a tool run by google. It is a self-named backend as a service.
Basically it provides Authentication, database and blob storage (It also
provides other things, but I haven’t tried them). The way firebase is meant to
be used on the web is by using only client side Js to talk to firebase, and it
uses it’s own rules language to do access control on the database and blob
storage. It also provides an “Admin” module, that can be used from the server,
where you can skip all the access controls. This approach means that you don’t
_need_ a backend, since your client side code can directly access the db.

## All together

In my internship, I wanted to combine Next.JS and firebase. At first it was
helping me get started quickly. With easy firebase authentication I had login
setup in a day or two. The Firestore database is a No-SQL database so it’s easy
to get stared storing data, since you can just store any json-like data.

Pretty soon however, I started to realize that the ease of setup also brought a
lot of code-smells. By just allowing JSON as data, you don’t enforce any
structure. To solve this, I created types and figured out a way to have Firebase
work together with typescript to sort of automatically use the types.

Another problem I ran into pretty quickly is that firebase does authentication
only client-side. It stores a token in local storage and any request to your own
server doesn’t have any way to figure out what user is making the request. There
are a couple of ways to fix this. The simplest one is by fetching a token from
firebase client-side, and sending it along with any fetch requests in the
Authorization header. This is annoying, since getting that token from firebase
is Async, and async in react means loading and error states that you have to
display in the ui.

Another way to solve the server authentication is by making a call to your
server to set a session cookie. Firebase provides a way to use a session cookie
(that you own and set), to authenticate users. It sort of feels like going
against what firebase is meant to do though, since firebase is client focussed.
This is also annoying, because now you have to manually switch over from this
client-side token to a server token, essentially taking away any gains you got
from using firebase auth.

Now the biggest problem: I don’t like loading all my data with hooks, and
Next.JS 13 came out with server components, which let me load my less-dynamic
data with normal Node.JS code. Trying to use firebase in server components is
hell. They have an awful SDK to begin with, and the
https://github.com/csfrequency/react-firebase-hooks package is not great. Why is
getting my current user async, which means literally _everywhere_ I want to use
my user (so basically everywhere in the app), I have to implement one more
loading state for if the user is loading….

All in all, I was too far along to make a big change, and I have a habit of
throwing away all my work when stuff like this comes up and I don’t like it. But
that isn’t an option in this project, so I’m still working on it, with a
combination of server and client components, I am building the app.
