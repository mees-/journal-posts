---
title: Day two
date: 2020-05-02T18:58
location: Groningen
---

I've been working some more on the blog today. I set up a better way to publish
posts. I now have a separate git repository that is set up with
[travis-ci](https://travis-ci.com). Every time I push a new commit to the master
branch there travis-ci does a new build.

Basically I have a script that travis runs that downloads the main code and uses
it's build script to create a build that includes the posts. Then with some
(fairly easy) travis configuration I got it to automatically publish to Github
pages.

I've also changed some styles on the website to make things more readable. With
those changes the site now has a perfect score in lighthouse. Try it out
yourself and see some fireworks!

The reason I called the project a journal and not a blog is mainly because I
think journal sounds cooler. As I mentioned in my previous post my main
motivation for the project was that I wanted a nice way to look at my private
journal entries. I used to use [Day one](https://dayoneapp.com/) a lot and I
liked having a place for my thoughts. Those thoughts however, were not meant to
be made public ever.

I've really enjoyed creating the site and hope to be working on it some more for
a while. I have some more ideas for improvements and to make it actually
interesting I should probably write some more posts so the site actually has
content. If you're interested in how I made the site check out
[the repo](https://github.com/mees-/journal). This is not the repo the posts and
travis config are stored in though, thats
[this one](https://github.com/mees-/journal-posts). If you have any suggestions
feel free to submit issues or even pull requests if you want. If you submit a pr
with a post to the post repo I might even accept the post as a guest post.

Till next time,  
Mees
